`timescale 1 ns / 1 ns

module FM_demodulator
          (
           clk,
           reset,
           clk_enable,
           inp_I,
           inp_Q,
           out_fm
          );



  input   clk;
  input   reset;
  input   clk_enable;
  input   signed [38:0] inp_I;  // sfix39_En36
  input   signed [38:0] inp_Q;  // sfix39_En36
  output  [12:0] out_fm;  // ufix13_En12

  wire enb;
  reg signed [38:0] Delay1_out1;  // sfix39_En36
  reg signed [38:0] Delay2_out1;  // sfix39_En36
  reg signed [38:0] Delay4_out1;  // sfix39_En36
  wire signed [31:0] Sum4_sub_cast;  // sfix32_En29
  wire signed [31:0] Sum4_sub_cast_1;  // sfix32_En29
  wire signed [31:0] Sum4_sub_temp;  // sfix32_En29
  wire signed [29:0] Sum4_out1;  // sfix30_En29
  wire signed [68:0] Product_mul_temp;  // sfix69_En65
  wire signed [32:0] Product_out1;  // sfix33_En31
  reg signed [38:0] Delay3_out1;  // sfix39_En36
  wire signed [30:0] Sum3_sub_cast;  // sfix31_En28
  wire signed [30:0] Sum3_sub_cast_1;  // sfix31_En28
  wire signed [30:0] Sum3_sub_temp;  // sfix31_En28
  wire signed [28:0] Sum3_out1;  // sfix29_En28
  wire signed [67:0] Product2_mul_temp;  // sfix68_En64
  wire signed [32:0] Product2_out1;  // sfix33_En31
  wire signed [31:0] Sum5_sub_cast;  // sfix32_En29
  wire signed [31:0] Sum5_sub_cast_1;  // sfix32_En29
  wire signed [31:0] Sum5_sub_temp;  // sfix32_En29
  wire [12:0] OUTPUT_rsvd;  // ufix13_En12
  reg [12:0] OUTPUT_rsvdreg;


  assign enb = clk_enable;

  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 39'sh0000000000;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= inp_I;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_out1 <= 39'sh0000000000;
      end
      else begin
        if (enb) begin
          Delay2_out1 <= inp_Q;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay4_process
      if (reset == 1'b1) begin
        Delay4_out1 <= 39'sh0000000000;
      end
      else begin
        if (enb) begin
          Delay4_out1 <= Delay2_out1;
        end
      end
    end



  assign Sum4_sub_cast = inp_Q[38:7];
  assign Sum4_sub_cast_1 = Delay4_out1[38:7];
  assign Sum4_sub_temp = Sum4_sub_cast - Sum4_sub_cast_1;
  assign Sum4_out1 = Sum4_sub_temp[29:0];



  assign Product_mul_temp = Delay1_out1 * Sum4_out1;
  assign Product_out1 = Product_mul_temp[66:34];



  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 39'sh0000000000;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= Delay1_out1;
        end
      end
    end



  assign Sum3_sub_cast = inp_I[38:8];
  assign Sum3_sub_cast_1 = Delay3_out1[38:8];
  assign Sum3_sub_temp = Sum3_sub_cast - Sum3_sub_cast_1;
  assign Sum3_out1 = Sum3_sub_temp[28:0];



  assign Product2_mul_temp = Sum3_out1 * Delay2_out1;
  assign Product2_out1 = Product2_mul_temp[65:33];



  assign Sum5_sub_cast = {Product_out1[32], Product_out1[32:2]};
  assign Sum5_sub_cast_1 = {Product2_out1[32], Product2_out1[32:2]};
  assign Sum5_sub_temp = Sum5_sub_cast - Sum5_sub_cast_1;
  assign OUTPUT_rsvd = Sum5_sub_temp[29:17];

always @(posedge clk)
    begin : OUTPUT_rsvdreg_process    
        if (enb) begin
          OUTPUT_rsvdreg <= OUTPUT_rsvd;
       end
    end

  assign out_fm = OUTPUT_rsvdreg;


endmodule  // FM_demodulator
