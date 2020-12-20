`timescale 1 ns / 1 ns

module FM_demodulator_tb
          (
           
          );




  reg  clk;
  reg  reset;
  wire clk_enable;
  wire out_fm_done;  // ufix1
  wire rdEnb;
  wire out_fm_done_enb;  // ufix1
  reg [16:0] out_fm_addr;  // ufix17
  wire out_fm_active;  // ufix1
  reg [16:0] Signal_From_Workspace_out1_addr;  // ufix17
  wire [16:0] Signal_From_Workspace1_out1_addr_delay_1;  // ufix17
  reg  tb_enb_delay;
  reg signed [31:0] fp_inp_Q;  // sfix32
  reg signed [38:0] rawData_inp_Q;  // sfix39_En36
  reg signed [31:0] status_inp_Q;  // sfix32
  reg signed [38:0] holdData_inp_Q;  // sfix39_En36
  reg signed [38:0] inp_Q_offset;  // sfix39_En36
  wire signed [38:0] inp_Q;  // sfix39_En36
  wire Signal_From_Workspace_out1_active;  // ufix1
  wire Signal_From_Workspace_out1_enb;  // ufix1
  wire [16:0] Signal_From_Workspace_out1_addr_delay_1;  // ufix17
  reg signed [31:0] fp_inp_I;  // sfix32
  reg signed [38:0] rawData_inp_I;  // sfix39_En36
  reg signed [31:0] status_inp_I;  // sfix32
  reg signed [38:0] holdData_inp_I;  // sfix39_En36
  reg signed [38:0] inp_I_offset;  // sfix39_En36
  wire signed [38:0] inp_I;  // sfix39_En36
  reg  check1_done;  // ufix1
  wire snkDonen;
  wire resetn;
  wire tb_enb;
  wire [12:0] out_fm;  // ufix13_En12
  wire out_fm_enb;  // ufix1
  wire out_fm_lastAddr;  // ufix1
  wire [16:0] out_fm_addr_delay_1;  // ufix17
  reg signed [31:0] fp_out_fm_expected;  // sfix32
  reg [12:0] out_fm_expected;  // ufix13_En12
  reg signed [31:0] status_out_fm_expected;  // sfix32
  wire [12:0] out_fm_ref;  // ufix13_En12
  reg [12:0] out_fm_refreg;
  reg  out_fm_testFailure;  // ufix1
  wire testFailure;  // ufix1


  assign out_fm_done_enb = out_fm_done & rdEnb;



  assign out_fm_active = out_fm_addr != 17'b11000011010100000;



  assign #1 Signal_From_Workspace1_out1_addr_delay_1 = Signal_From_Workspace_out1_addr;

  // Data source for inp_Q
  initial
    begin : inp_Q_fileread
      fp_inp_Q = $fopen("../Source/inp_Q.dat", "r");
      status_inp_Q = $rewind(fp_inp_Q);
    end

  always @(Signal_From_Workspace1_out1_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_inp_Q <= 39'bx;
      end
      else if (rdEnb == 1) begin
        status_inp_Q = $fscanf(fp_inp_Q, "%h", rawData_inp_Q);
      end
    end

  // holdData reg for Signal_From_Workspace1_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Signal_From_Workspace1_out1
      if (reset) begin
        holdData_inp_Q <= 39'bx;
      end
      else begin
        holdData_inp_Q <= rawData_inp_Q;
      end
    end

  always @(rawData_inp_Q or rdEnb)
    begin : stimuli_Signal_From_Workspace1_out1_1
      if (rdEnb == 1'b0) begin
        inp_Q_offset <= holdData_inp_Q;
      end
      else begin
        inp_Q_offset <= rawData_inp_Q;
      end
    end

  assign #2 inp_Q = inp_Q_offset;

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



  assign #1 Signal_From_Workspace_out1_addr_delay_1 = Signal_From_Workspace_out1_addr;

  // Data source for inp_I
  initial
    begin : inp_I_fileread
      fp_inp_I = $fopen("../Source/inp_I.dat", "r");
      status_inp_I = $rewind(fp_inp_I);
    end

  always @(Signal_From_Workspace_out1_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_inp_I <= 39'bx;
      end
      else if (rdEnb == 1) begin
        status_inp_I = $fscanf(fp_inp_I, "%h", rawData_inp_I);
      end
    end

  // holdData reg for Signal_From_Workspace_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Signal_From_Workspace_out1
      if (reset) begin
        holdData_inp_I <= 39'bx;
      end
      else begin
        holdData_inp_I <= rawData_inp_I;
      end
    end

  always @(rawData_inp_I or rdEnb)
    begin : stimuli_Signal_From_Workspace_out1_1
      if (rdEnb == 1'b0) begin
        inp_I_offset <= holdData_inp_I;
      end
      else begin
        inp_I_offset <= rawData_inp_I;
      end
    end

  assign #2 inp_I = inp_I_offset;

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
      # (4000);
      @ (posedge clk)
      # (2);
      reset <= 1'b0;
    end

  always 
    begin : clk_gen
      clk <= 1'b1;
      # (1000);
      clk <= 1'b0;
      # (1000);
      if (check1_done == 1'b1) begin
        clk <= 1'b1;
        # (1000);
        clk <= 1'b0;
        # (1000);
        $stop;
      end
    end

  FM_demodulator   u_FM_demodulator   (.clk(clk),
                                       .reset(reset),
                                       .clk_enable(clk_enable),
                                       .inp_I(inp_I),  // sfix39_En36
                                       .inp_Q(inp_Q),  // sfix39_En36
                                       .out_fm(out_fm)  // ufix13_En12
                                       );

  assign out_fm_enb = clk_enable & out_fm_active;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 100000
  always @(posedge clk or posedge reset)
    begin : c_2_process
      if (reset == 1'b1) begin
        out_fm_addr <= 17'b00000000000000000;
      end
      else begin
        if (out_fm_enb) begin
          if (out_fm_addr == 17'b11000011010100000) begin
            out_fm_addr <= 17'b00000000000000000;
          end
          else begin
            out_fm_addr <= out_fm_addr + 17'b00000000000000001;
          end
        end
      end
    end



  assign out_fm_lastAddr = out_fm_addr >= 17'b11000011010100000;



  assign out_fm_done = out_fm_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk or posedge reset)
    begin : checkDone_1
      if (reset) begin
        check1_done <= 0;
      end
      else begin
        if (out_fm_done_enb) begin
          check1_done <= out_fm_done;
        end
      end
    end

  assign #1 out_fm_addr_delay_1 = out_fm_addr;

  // Data source for out_fm_expected
  initial
    begin : out_fm_expected_fileread
      fp_out_fm_expected = $fopen("../Source/out_fm_expected.dat", "r");
      status_out_fm_expected = $rewind(fp_out_fm_expected);
    end

  always @(out_fm_addr_delay_1, clk_enable, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        out_fm_expected <= 13'bx;
      end
      else if (clk_enable == 1) begin
        status_out_fm_expected = $fscanf(fp_out_fm_expected, "%h", out_fm_expected);
      end
    end

  assign out_fm_ref = out_fm_expected;
  
  always @(posedge clk or posedge reset)
    begin : out_fm_refreg_process    
        
          out_fm_refreg <= out_fm_ref;
       
    end
  
  always @(posedge clk or posedge reset)
    begin : out_fm_checker
      if (reset == 1'b1) begin
        out_fm_testFailure <= 1'b0;
      end
      else begin
        if (clk_enable == 1'b1 && out_fm !== out_fm_refreg) begin
          out_fm_testFailure <= 1'b1;
          $display("ERROR in out_fm at time %t : Expected '%h' Actual '%h'", $time, out_fm_refreg, out_fm);
        end
      end
    end

  assign testFailure = out_fm_testFailure;

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

endmodule  // FM_demodulator_tb
