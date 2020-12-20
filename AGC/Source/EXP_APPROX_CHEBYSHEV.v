`timescale 1 ns / 1 ns

module EXP_APPROX_CHEBYSHEV
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
  input   signed [35:0] In1;  // sfix36_En33
  output  [37:0] Out1;  // ufix38_En33

  wire [19:0] Constant0_out1;  // ufix20_En19
  wire [16:0] Constant1_out1;  // ufix17_En17
  wire signed [17:0] exp_1_1_cast;  // sfix18_En17
  wire signed [53:0] exp_1_1_mul_temp;  // sfix54_En50
  wire signed [52:0] exp_1_1_cast_1;  // sfix53_En50
  wire signed [29:0] exp_1_1_out1;  // sfix30_En27
  reg signed [29:0] exp_1_1_out_reg_delay2_reg [0:2];  // sfix30 [3]
  wire signed [29:0] exp_1_1_out_reg_delay2_reg_next [0:2];  // sfix30_En27 [3]
  wire signed [29:0] exp_1_1_out_reg_delay2_out1;  // sfix30_En27
  wire signed [29:0] Sum_add_cast;  // sfix30_En27
  wire signed [29:0] Sum_add_temp;  // sfix30_En27
  wire [28:0] Sum_out1;  // ufix29_En27
  wire [15:0] Constant2_out1;  // ufix16_En16
  wire signed [71:0] exp_2_1_mul_temp;  // sfix72_En66
  wire [30:0] exp_2_1_out1;  // ufix31_En27
  reg [30:0] exp_2_1_out_reg_out1;  // ufix31_En27
  wire [46:0] exp_2_2_mul_temp;  // ufix47_En43
  wire [30:0] exp_2_2_out1;  // ufix31_En28
  reg [30:0] exp_2_2_out_reg_delay2_reg [0:2];  // ufix31 [3]
  wire [30:0] exp_2_2_out_reg_delay2_reg_next [0:2];  // ufix31_En28 [3]
  wire [30:0] exp_2_2_out_reg_delay2_out1;  // ufix31_En28
  wire [15:0] Constant3_out1;  // ufix16_En16
  reg signed [35:0] In1_1;  // sfix36_En33
  wire signed [31:0] exp_3_1_cast;  // sfix32_En27
  wire signed [67:0] exp_3_1_mul_temp;  // sfix68_En60
  wire signed [66:0] exp_3_1_cast_1;  // sfix67_En60
  wire signed [32:0] exp_3_1_out1;  // sfix33_En27
  reg signed [32:0] exp_3_1_out_reg_out1;  // sfix33_En27
  wire signed [16:0] exp_3_2_cast;  // sfix17_En16
  wire signed [49:0] exp_3_2_mul_temp;  // sfix50_En43
  wire signed [48:0] exp_3_2_cast_1;  // sfix49_En43
  wire signed [40:0] exp_3_2_out1;  // sfix41_En36
  reg [28:0] exp_1_1_out_reg_plus_const0_delay_out1;  // ufix29_En27
  reg signed [40:0] exp_3_2_out_reg_reg [0:1];  // sfix41 [2]
  wire signed [40:0] exp_3_2_out_reg_reg_next [0:1];  // sfix41_En36 [2]
  wire signed [40:0] exp_3_2_out_reg_out1;  // sfix41_En36
  wire signed [40:0] Sum1_add_cast;  // sfix41_En36
  wire signed [40:0] Sum1_add_temp;  // sfix41_En36
  wire [39:0] Sum1_out1;  // ufix40_En36
  wire [39:0] Sum2_add_cast;  // ufix40_En36
  wire [39:0] Sum2_out1;  // ufix40_En36
  wire [20:0] Constant4_out1;  // ufix21_En21
  reg signed [35:0] In1_2;  // sfix36_En33
  wire signed [68:0] exp_4_1_mul_temp;  // sfix69_En60
  wire [31:0] exp_4_1_out1;  // ufix32_En25
  reg [31:0] exp_4_1_out_reg_out1;  // ufix32_En25
  wire [52:0] exp_4_2_mul_temp;  // ufix53_En46
  wire [34:0] exp_4_2_out1;  // ufix35_En31
  reg [34:0] exp_4_2_out_reg_out1;  // ufix35_En31
  wire [37:0] Sum3_add_cast;  // ufix38_En33
  wire [37:0] Sum3_add_cast_1;  // ufix38_En33
  wire [37:0] Sum3_out1;  // ufix38_En33


  // <S3>/Constant0
  assign Constant0_out1 = 20'b10000000000000010111;



  // <S3>/Constant1
  assign Constant1_out1 = 17'b11111111101011101;



  // <S3>/exp_1_1
  assign exp_1_1_cast = {1'b0, Constant1_out1};
  assign exp_1_1_mul_temp = exp_1_1_cast * In1;
  assign exp_1_1_cast_1 = exp_1_1_mul_temp[52:0];
  assign exp_1_1_out1 = exp_1_1_cast_1[52:23];



  // <S3>/exp_1_1_out_reg_delay2
  // 
  // <S3>/exp_1_1_out_reg_delay1
  // 
  // <S3>/exp_1_1_out_reg
  always @(posedge clk or posedge reset)
    begin : exp_1_1_out_reg_delay2_process
      if (reset == 1'b1) begin
        exp_1_1_out_reg_delay2_reg[0] <= 30'sb000000000000000000000000000000;
        exp_1_1_out_reg_delay2_reg[1] <= 30'sb000000000000000000000000000000;
        exp_1_1_out_reg_delay2_reg[2] <= 30'sb000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          exp_1_1_out_reg_delay2_reg[0] <= exp_1_1_out_reg_delay2_reg_next[0];
          exp_1_1_out_reg_delay2_reg[1] <= exp_1_1_out_reg_delay2_reg_next[1];
          exp_1_1_out_reg_delay2_reg[2] <= exp_1_1_out_reg_delay2_reg_next[2];
        end
      end
    end

  assign exp_1_1_out_reg_delay2_out1 = exp_1_1_out_reg_delay2_reg[2];
  assign exp_1_1_out_reg_delay2_reg_next[0] = exp_1_1_out1;
  assign exp_1_1_out_reg_delay2_reg_next[1] = exp_1_1_out_reg_delay2_reg[0];
  assign exp_1_1_out_reg_delay2_reg_next[2] = exp_1_1_out_reg_delay2_reg[1];



  // <S3>/Sum
  assign Sum_add_cast = {2'b0, {Constant0_out1, 8'b00000000}};
  assign Sum_add_temp = Sum_add_cast + exp_1_1_out_reg_delay2_out1;
  assign Sum_out1 = Sum_add_temp[28:0];



  // <S3>/Constant2
  assign Constant2_out1 = 16'b1000001010000001;



  // <S3>/exp_2_1
  assign exp_2_1_mul_temp = In1 * In1;
  assign exp_2_1_out1 = exp_2_1_mul_temp[69:39];



  // <S3>/exp_2_1_out_reg
  always @(posedge clk or posedge reset)
    begin : exp_2_1_out_reg_process
      if (reset == 1'b1) begin
        exp_2_1_out_reg_out1 <= 31'b0000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          exp_2_1_out_reg_out1 <= exp_2_1_out1;
        end
      end
    end



  // <S3>/exp_2_2
  assign exp_2_2_mul_temp = Constant2_out1 * exp_2_1_out_reg_out1;
  assign exp_2_2_out1 = exp_2_2_mul_temp[45:15];



  // <S3>/exp_2_2_out_reg_delay2
  // 
  // <S3>/exp_2_2_out_reg_delay1
  // 
  // <S3>/exp_2_2_out_reg
  always @(posedge clk or posedge reset)
    begin : exp_2_2_out_reg_delay2_process
      if (reset == 1'b1) begin
        exp_2_2_out_reg_delay2_reg[0] <= 31'b0000000000000000000000000000000;
        exp_2_2_out_reg_delay2_reg[1] <= 31'b0000000000000000000000000000000;
        exp_2_2_out_reg_delay2_reg[2] <= 31'b0000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          exp_2_2_out_reg_delay2_reg[0] <= exp_2_2_out_reg_delay2_reg_next[0];
          exp_2_2_out_reg_delay2_reg[1] <= exp_2_2_out_reg_delay2_reg_next[1];
          exp_2_2_out_reg_delay2_reg[2] <= exp_2_2_out_reg_delay2_reg_next[2];
        end
      end
    end

  assign exp_2_2_out_reg_delay2_out1 = exp_2_2_out_reg_delay2_reg[2];
  assign exp_2_2_out_reg_delay2_reg_next[0] = exp_2_2_out1;
  assign exp_2_2_out_reg_delay2_reg_next[1] = exp_2_2_out_reg_delay2_reg[0];
  assign exp_2_2_out_reg_delay2_reg_next[2] = exp_2_2_out_reg_delay2_reg[1];



  // <S3>/Constant3
  assign Constant3_out1 = 16'b0010001111101001;



  // <S3>/exp_3_1_in_delay
  always @(posedge clk or posedge reset)
    begin : reduced_process
      if (reset == 1'b1) begin
        In1_1 <= 36'sh000000000;
      end
      else begin
        if (enb) begin
          In1_1 <= In1;
        end
      end
    end



  // <S3>/exp_3_1
  assign exp_3_1_cast = {1'b0, exp_2_1_out_reg_out1};
  assign exp_3_1_mul_temp = exp_3_1_cast * In1_1;
  assign exp_3_1_cast_1 = exp_3_1_mul_temp[66:0];
  assign exp_3_1_out1 = exp_3_1_cast_1[65:33];



  // <S3>/exp_3_1_out_reg
  always @(posedge clk or posedge reset)
    begin : exp_3_1_out_reg_process
      if (reset == 1'b1) begin
        exp_3_1_out_reg_out1 <= 33'sh000000000;
      end
      else begin
        if (enb) begin
          exp_3_1_out_reg_out1 <= exp_3_1_out1;
        end
      end
    end



  // <S3>/exp_3_2
  assign exp_3_2_cast = {1'b0, Constant3_out1};
  assign exp_3_2_mul_temp = exp_3_2_cast * exp_3_1_out_reg_out1;
  assign exp_3_2_cast_1 = exp_3_2_mul_temp[48:0];
  assign exp_3_2_out1 = exp_3_2_cast_1[47:7];



  // <S3>/exp_1_1_out_reg_plus_const0_delay
  always @(posedge clk or posedge reset)
    begin : exp_1_1_out_reg_plus_const0_delay_process
      if (reset == 1'b1) begin
        exp_1_1_out_reg_plus_const0_delay_out1 <= 29'b00000000000000000000000000000;
      end
      else begin
        if (enb) begin
          exp_1_1_out_reg_plus_const0_delay_out1 <= Sum_out1;
        end
      end
    end



  // <S3>/exp_3_2_out_reg
  // 
  // <S3>/exp_3_1_out_reg_delay
  always @(posedge clk or posedge reset)
    begin : exp_3_2_out_reg_process
      if (reset == 1'b1) begin
        exp_3_2_out_reg_reg[0] <= 41'sh00000000000;
        exp_3_2_out_reg_reg[1] <= 41'sh00000000000;
      end
      else begin
        if (enb) begin
          exp_3_2_out_reg_reg[0] <= exp_3_2_out_reg_reg_next[0];
          exp_3_2_out_reg_reg[1] <= exp_3_2_out_reg_reg_next[1];
        end
      end
    end

  assign exp_3_2_out_reg_out1 = exp_3_2_out_reg_reg[1];
  assign exp_3_2_out_reg_reg_next[0] = exp_3_2_out1;
  assign exp_3_2_out_reg_reg_next[1] = exp_3_2_out_reg_reg[0];



  // <S3>/Sum1
  assign Sum1_add_cast = {2'b0, {exp_2_2_out_reg_delay2_out1, 8'b00000000}};
  assign Sum1_add_temp = Sum1_add_cast + exp_3_2_out_reg_out1;
  assign Sum1_out1 = Sum1_add_temp[39:0];



  // <S3>/Sum2
  assign Sum2_add_cast = {2'b0, {exp_1_1_out_reg_plus_const0_delay_out1, 9'b000000000}};
  assign Sum2_out1 = Sum2_add_cast + Sum1_out1;



  // <S3>/Constant4
  assign Constant4_out1 = 21'b000100011100010100111;



  // <S3>/exp_4_1_delay2
  // 
  // <S3>/exp_4_1_delay1
  always @(posedge clk or posedge reset)
    begin : reduced_1_process
      if (reset == 1'b1) begin
        In1_2 <= 36'sh000000000;
      end
      else begin
        if (enb) begin
          In1_2 <= In1_1;
        end
      end
    end



  // <S3>/exp_4_1
  assign exp_4_1_mul_temp = exp_3_1_out_reg_out1 * In1_2;
  assign exp_4_1_out1 = exp_4_1_mul_temp[66:35];



  // <S3>/exp_4_1_out_reg
  always @(posedge clk or posedge reset)
    begin : exp_4_1_out_reg_process
      if (reset == 1'b1) begin
        exp_4_1_out_reg_out1 <= 32'b00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          exp_4_1_out_reg_out1 <= exp_4_1_out1;
        end
      end
    end



  // <S3>/exp_4_2
  assign exp_4_2_mul_temp = Constant4_out1 * exp_4_1_out_reg_out1;
  assign exp_4_2_out1 = exp_4_2_mul_temp[49:15];



  // <S3>/exp_4_2_out_reg
  always @(posedge clk or posedge reset)
    begin : exp_4_2_out_reg_process
      if (reset == 1'b1) begin
        exp_4_2_out_reg_out1 <= 35'h000000000;
      end
      else begin
        if (enb) begin
          exp_4_2_out_reg_out1 <= exp_4_2_out1;
        end
      end
    end



  // <S3>/Sum3
  assign Sum3_add_cast = {1'b0, Sum2_out1[39:3]};
  assign Sum3_add_cast_1 = {1'b0, {exp_4_2_out_reg_out1, 2'b00}};
  assign Sum3_out1 = Sum3_add_cast + Sum3_add_cast_1;



  assign Out1 = Sum3_out1;

endmodule  // EXP_APPROX_CHEBYSHEV

