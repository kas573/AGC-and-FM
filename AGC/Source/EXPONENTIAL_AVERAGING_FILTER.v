// -------------------------------------------------------------
// 
// File Name: AGC_regs\hdlsrc\AGC_regs\EXPONENTIAL_AVERAGING_FILTER.v
// Created: 2020-11-28 15:24:59
// 
// Generated by MATLAB 9.1 and HDL Coder 3.9
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: EXPONENTIAL_AVERAGING_FILTER
// Source Path: AGC_regs/AGC/EXPONENTIAL AVERAGING FILTER
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module EXPONENTIAL_AVERAGING_FILTER
          (
           clk,
           reset,
           enb,
           In1,
           Out1
          );



  input   clk;
  input   reset;
  input   enb;
  input   [28:0] In1;  // ufix29_En17
  output  [36:0] Out1;  // ufix37_En28

  wire [29:0] exp_ave_alpha_out1;  // ufix30_En30
  wire [58:0] exp_ave_input_product_mul_temp;  // ufix59_En47
  wire [30:0] exp_ave_input_product_out1;  // ufix31_En27
  wire [29:0] exp_ave_1_alpha_out1;  // ufix30_En30
  wire [36:0] Sum3_out1;  // ufix37_En28
  reg [36:0] Delay1_out1;  // ufix37_En28
  wire [66:0] exp_ave_product_mul_temp;  // ufix67_En58
  wire [36:0] exp_ave_product_out1;  // ufix37_En28
  wire [36:0] Sum3_add_cast;  // ufix37_En28


  // <S4>/exp_ave_alpha
  assign exp_ave_alpha_out1 = 30'b000000010100011110101110000101;



  // <S4>/exp_ave_input_product
  assign exp_ave_input_product_mul_temp = In1 * exp_ave_alpha_out1;
  assign exp_ave_input_product_out1 = (exp_ave_input_product_mul_temp[58:51] != 8'b00000000 ? 31'b1111111111111111111111111111111 :
              exp_ave_input_product_mul_temp[50:20]);



  // <S4>/exp_ave_1-alpha
  assign exp_ave_1_alpha_out1 = 30'b111111101011100001010001111011;



  // <S4>/Delay1
  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 37'h0000000000;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= Sum3_out1;
        end
      end
    end



  // <S4>/exp_ave_product
  assign exp_ave_product_mul_temp = Delay1_out1 * exp_ave_1_alpha_out1;
  assign exp_ave_product_out1 = exp_ave_product_mul_temp[66:30];



  // <S4>/Sum3
  assign Sum3_add_cast = {5'b0, {exp_ave_input_product_out1, 1'b0}};
  assign Sum3_out1 = Sum3_add_cast + exp_ave_product_out1;



  assign Out1 = Sum3_out1;

endmodule  // EXPONENTIAL_AVERAGING_FILTER

