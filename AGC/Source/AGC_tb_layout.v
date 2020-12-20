`timescale 1 ns / 1 ns

module AGC_tb
          (
           
          );




  reg  clk;
  reg  reset;
  wire clk_enable;
  wire out_agc_done;  // ufix1
  wire rdEnb;
  wire out_agc_done_enb;  // ufix1
  reg [16:0] out_agc_addr;  // ufix17
  wire out_agc_active;  // ufix1
  reg [16:0] Signal_From_Workspace_out1_addr;  // ufix17
  wire Signal_From_Workspace_out1_active;  // ufix1
  reg  tb_enb_delay;
  wire Signal_From_Workspace_out1_enb;  // ufix1
  wire [16:0] Signal_From_Workspace_out1_addr_delay_1;  // ufix17
  reg signed [31:0] fp_inp_agc;  // sfix32
  reg signed [12:0] rawData_inp_agc;  // sfix13_En6
  reg signed [31:0] status_inp_agc;  // sfix32
  reg signed [12:0] holdData_inp_agc;  // sfix13_En6
  reg signed [12:0] inp_agc_offset;  // sfix13_En6
  wire signed [12:0] inp_agc;  // sfix13_En6
  reg  check1_done;  // ufix1
  wire snkDonen;
  wire resetn;
  wire tb_enb;
  wire signed [38:0] out_agc;  // sfix39_En36
  wire out_agc_enb;  // ufix1
  wire out_agc_lastAddr;  // ufix1
  wire [16:0] out_agc_addr_delay_1;  // ufix17
  reg signed [31:0] fp_out_agc_expected;  // sfix32
  reg signed [38:0] out_agc_expected;  // sfix39_En36
  reg signed [31:0] status_out_agc_expected;  // sfix32
  wire signed [38:0] out_agc_ref;  // sfix39_En36
  reg signed [38:0] out_agc_ref_reg;  // sfix39_En36
  reg  out_agc_testFailure;  // ufix1
  wire testFailure;  // ufix1
  reg signed [38:0] out_agc_reg;

  assign out_agc_done_enb = out_agc_done & rdEnb;



  assign out_agc_active = out_agc_addr != 17'b11000011010100000;



  assign Signal_From_Workspace_out1_active = Signal_From_Workspace_out1_addr != 17'b11000011010100000;



  assign Signal_From_Workspace_out1_enb = Signal_From_Workspace_out1_active & (rdEnb & tb_enb_delay);



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 100000
  always @(posedge clk or posedge reset)
    begin : SignalFromWorkspace_process
      if (reset == 1'b1) begin
        Signal_From_Workspace_out1_addr <= 17'b00000000000000000;
      end
      else begin
        if (Signal_From_Workspace_out1_enb) begin
          if (Signal_From_Workspace_out1_addr == 17'b11000011010100000) begin
            Signal_From_Workspace_out1_addr <= 17'b00000000000000000;
          end
          else begin
            Signal_From_Workspace_out1_addr <= Signal_From_Workspace_out1_addr + 17'b00000000000000001;
          end
        end
      end
    end



  assign #1  Signal_From_Workspace_out1_addr_delay_1 = Signal_From_Workspace_out1_addr; 

  // Data source for inp_agc
  initial
    begin : inp_agc_fileread
      fp_inp_agc = $fopen("../Source/inp_agc.dat", "r");
      status_inp_agc = $rewind(fp_inp_agc);
    end

  always @(Signal_From_Workspace_out1_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_inp_agc <= 13'bx;
      end
      else if (rdEnb == 1) begin
        status_inp_agc = $fscanf(fp_inp_agc, "%h", rawData_inp_agc);
      end
    end

  // holdData reg for Signal_From_Workspace_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Signal_From_Workspace_out1
      if (reset) begin
        holdData_inp_agc <= 13'bx;
      end
      else begin
        holdData_inp_agc <= rawData_inp_agc;
      end
    end

  always @(rawData_inp_agc or rdEnb)
    begin : stimuli_Signal_From_Workspace_out1_1
      if (rdEnb == 1'b0) begin
        inp_agc_offset <= holdData_inp_agc;
      end
      else begin
        inp_agc_offset <= rawData_inp_agc;
      end
    end

  assign #2 inp_agc = inp_agc_offset;

  assign snkDonen =  ~ check1_done;



  assign resetn =  ~ reset;



  assign tb_enb = resetn & snkDonen;



  // Delay inside enable generation: register depth 1
  always @(posedge clk or posedge reset)
    begin : u_enable_delay
      if (reset) begin
        tb_enb_delay <= 0;
      end
      else begin
        tb_enb_delay <= tb_enb;
      end
    end

  assign rdEnb = (check1_done == 1'b0 ? tb_enb_delay :
              1'b0);



  assign #2 clk_enable = rdEnb;

  initial
    begin : reset_gen
      reset <= 1'b1;
      # (2000);
      @ (posedge clk)
      # (2);
      reset <= 1'b0;
    end

  always 
    begin : clk_gen
      clk <= 1'b1;
      # (500);
      clk <= 1'b0;
      # (500);
      if (check1_done == 1'b1) begin
        clk <= 1'b1;
        # (500);
        clk <= 1'b0;
        # (500);
        $stop;
      end
    end

  AGC   u_AGC   (.clk(clk),
                 .reset(reset),
                 .clk_enable(clk_enable),
                 .inp_agc(inp_agc),  // sfix13_En6
                 .out_agc(out_agc)  // sfix39_En36
                 );
initial
$sdf_annotate("../Outputs/Layout/AGC.sdf", u_AGC);

  assign out_agc_enb = clk_enable & out_agc_active;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 100000
  always @(posedge clk or posedge reset)
    begin : c_2_process
      if (reset == 1'b1) begin
        out_agc_addr <= 17'b00000000000000000;
      end
      else begin
        if (out_agc_enb) begin
          if (out_agc_addr == 17'b11000011010100000) begin
            out_agc_addr <= 17'b00000000000000000;
          end
          else begin
            out_agc_addr <= out_agc_addr + 17'b00000000000000001;
          end
        end
      end
    end



  assign out_agc_lastAddr = out_agc_addr >= 17'b11000011010100000;



  assign out_agc_done = out_agc_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk or posedge reset)
    begin : checkDone_1
      if (reset) begin
        check1_done <= 0;
      end
      else begin
        if (out_agc_done_enb) begin
          check1_done <= out_agc_done;
        end
      end
    end

  assign #1 out_agc_addr_delay_1 = out_agc_addr;

  // Data source for out_agc_expected
  initial
    begin : out_agc_expected_fileread
      fp_out_agc_expected = $fopen("../Source/out_agc_expected.dat", "r");
      status_out_agc_expected = $rewind(fp_out_agc_expected);
    end

  always @(out_agc_addr_delay_1, clk_enable, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        out_agc_expected <= 39'bx;
      end
      else if (clk_enable == 1) begin
        status_out_agc_expected = $fscanf(fp_out_agc_expected, "%h", out_agc_expected);
      end
    end

always @ (posedge clk)
out_agc_ref_reg<=out_agc_expected;
  assign out_agc_ref = out_agc_ref_reg;
always @ (posedge clk)
out_agc_reg<=out_agc;
  always @(posedge clk or posedge reset)
    begin : out_agc_checker
      if (reset == 1'b1) begin
        out_agc_testFailure <= 1'b0;
      end
      else begin
        if (clk_enable == 1'b1 && out_agc_reg !== out_agc_ref) begin
          out_agc_testFailure <= 1'b1;
          $display("ERROR in out_agc at time %t : Expected '%h' Actual '%h'", $time, out_agc_ref, out_agc);
        end
      end
    end

  assign testFailure = out_agc_testFailure;

  always @(posedge clk)
    begin : completed_msg
      if (check1_done == 1'b1) begin
        if (testFailure == 1'b0) begin
          $display("**************TEST COMPLETED (PASSED)**************");
        end
        else begin
          $display("**************TEST COMPLETED (FAILED)**************");
        end
      end
    end

endmodule  // AGC_tb

