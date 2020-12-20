`timescale 1 ns / 1 ns

module LN_X_MNK_0_001_to_5000
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
  input   [36:0] In1;  // ufix37_En28
  output  signed [32:0] Out1;  // sfix33_En29

  wire [27:0] Constant1_out1;  // ufix28_En26
  wire [31:0] Constant2_out1;  // ufix32_En32
  wire [68:0] ln_1_1_mul_temp;  // ufix69_En60
  wire [32:0] ln_1_1_out1;  // ufix33_En31
  reg [32:0] ln_1_1_out_reg_delay2_reg [0:2];  // ufix33 [3]
  wire [32:0] ln_1_1_out_reg_delay2_reg_next [0:2];  // ufix33_En31 [3]
  wire [32:0] ln_1_1_out_reg_delay2_out1;  // ufix33_En31
  wire [28:0] Sum_add_cast;  // ufix29_En26
  wire [28:0] Sum_add_cast_1;  // ufix29_En26
  wire [28:0] Sum_add_temp;  // ufix29_En26
  wire [27:0] Sum_out1;  // ufix28_En25
  wire signed [38:0] Constant3_out1;  // sfix39_En39
  wire [73:0] ln_2_1_mul_temp;  // ufix74_En56
  wire [24:0] ln_2_1_out1;  // ufix25_En7
  reg [24:0] ln_2_1_out_reg_out1;  // ufix25_En7
  wire signed [25:0] ln_2_2_cast;  // sfix26_En7
  wire signed [64:0] ln_2_2_mul_temp;  // sfix65_En46
  wire signed [63:0] ln_2_2_cast_1;  // sfix64_En46
  wire signed [29:0] ln_2_2_out1;  // sfix30_En28
  reg signed [29:0] ln_2_2_out_reg_delay2_reg [0:2];  // sfix30 [3]
  wire signed [29:0] ln_2_2_out_reg_delay2_reg_next [0:2];  // sfix30_En28 [3]
  wire signed [29:0] ln_2_2_out_reg_delay2_out1;  // sfix30_En28
  wire [47:0] Constant4_out1;  // ufix48_En48
  reg [36:0] In1_1;  // ufix37_En28
  wire [61:0] ln_3_1_mul_temp;  // ufix62_En35
  wire [26:0] ln_3_1_out1;  // ufix27
  reg [26:0] ln_3_1_out_reg_out1;  // ufix27
  reg [26:0] ln_3_1_out_reg_delay_out1;  // ufix27
  wire [74:0] ln_3_2_mul_temp;  // ufix75_En48
  wire [32:0] ln_3_2_out1;  // ufix33_En33
  reg [27:0] ln_1_1_out_reg_plus_const1_delay_out1;  // ufix28_En25
  reg [32:0] ln_3_2_out_reg_out1;  // ufix33_En33
  wire signed [29:0] Sum1_add_cast;  // sfix30_En29
  wire signed [29:0] Sum1_add_cast_1;  // sfix30_En29
  wire signed [29:0] Sum1_add_temp;  // sfix30_En29
  wire signed [32:0] Sum1_out1;  // sfix33_En32
  wire signed [32:0] Sum2_add_cast;  // sfix33_En29
  wire signed [32:0] Sum2_add_cast_1;  // sfix33_En29
  wire signed [32:0] Sum2_out1;  // sfix33_En29
  wire signed [56:0] Constant5_out1;  // sfix57_En57
  reg [36:0] In1_2;  // ufix37_En28
  wire [63:0] ln_4_1_mul_temp;  // ufix64_En28
  wire [35:0] ln_4_1_out1;  // ufix36
  reg [35:0] ln_4_1_out_reg_out1;  // ufix36
  wire signed [36:0] ln_4_2_cast;  // sfix37
  wire signed [93:0] ln_4_2_mul_temp;  // sfix94_En57
  wire signed [92:0] ln_4_2_cast_1;  // sfix93_En57
  wire signed [34:0] ln_4_2_out1;  // sfix35_En35
  reg signed [34:0] ln_4_2_out_reg_out1;  // sfix35_En35
  wire signed [32:0] Sum3_add_cast;  // sfix33_En29
  wire signed [32:0] Sum3_out1;  // sfix33_En29


  // <S5>/Constant1
  assign Constant1_out1 = 28'b1111000111000000001010011111;



  // <S5>/Constant2
  assign Constant2_out1 = 32'b00000001110011000011111100100101;



  // <S5>/ln_1_1
  assign ln_1_1_mul_temp = Constant2_out1 * In1;
  assign ln_1_1_out1 = ln_1_1_mul_temp[61:29];



  // <S5>/ln_1_1_out_reg_delay2
  // 
  // <S5>/ln_1_1_out_reg_delay1
  // 
  // <S5>/ln_1_1_out_reg
  always @(posedge clk or posedge reset)
    begin : ln_1_1_out_reg_delay2_process
      if (reset == 1'b1) begin
        ln_1_1_out_reg_delay2_reg[0] <= 33'h000000000;
        ln_1_1_out_reg_delay2_reg[1] <= 33'h000000000;
        ln_1_1_out_reg_delay2_reg[2] <= 33'h000000000;
      end
      else begin
        if (enb) begin
          ln_1_1_out_reg_delay2_reg[0] <= ln_1_1_out_reg_delay2_reg_next[0];
          ln_1_1_out_reg_delay2_reg[1] <= ln_1_1_out_reg_delay2_reg_next[1];
          ln_1_1_out_reg_delay2_reg[2] <= ln_1_1_out_reg_delay2_reg_next[2];
        end
      end
    end

  assign ln_1_1_out_reg_delay2_out1 = ln_1_1_out_reg_delay2_reg[2];
  assign ln_1_1_out_reg_delay2_reg_next[0] = ln_1_1_out1;
  assign ln_1_1_out_reg_delay2_reg_next[1] = ln_1_1_out_reg_delay2_reg[0];
  assign ln_1_1_out_reg_delay2_reg_next[2] = ln_1_1_out_reg_delay2_reg[1];



  // <S5>/Sum
  assign Sum_add_cast = {1'b0, Constant1_out1};
  assign Sum_add_cast_1 = {1'b0, ln_1_1_out_reg_delay2_out1[32:5]};
  assign Sum_add_temp = Sum_add_cast + Sum_add_cast_1;
  assign Sum_out1 = Sum_add_temp[28:1];



  // <S5>/Constant3
  assign Constant3_out1 = 39'sh7FFFD0D1C5;



  // <S5>/ln_2_1
  assign ln_2_1_mul_temp = In1 * In1;
  assign ln_2_1_out1 = ln_2_1_mul_temp[73:49];



  // <S5>/ln_2_1_out_reg
  always @(posedge clk or posedge reset)
    begin : ln_2_1_out_reg_process
      if (reset == 1'b1) begin
        ln_2_1_out_reg_out1 <= 25'b0000000000000000000000000;
      end
      else begin
        if (enb) begin
          ln_2_1_out_reg_out1 <= ln_2_1_out1;
        end
      end
    end



  // <S5>/ln_2_2
  assign ln_2_2_cast = {1'b0, ln_2_1_out_reg_out1};
  assign ln_2_2_mul_temp = Constant3_out1 * ln_2_2_cast;
  assign ln_2_2_cast_1 = ln_2_2_mul_temp[63:0];
  assign ln_2_2_out1 = ln_2_2_cast_1[47:18];



  // <S5>/ln_2_2_out_reg_delay2
  // 
  // <S5>/ln_2_2_out_reg_delay1
  // 
  // <S5>/ln_2_2_out_reg
  always @(posedge clk or posedge reset)
    begin : ln_2_2_out_reg_delay2_process
      if (reset == 1'b1) begin
        ln_2_2_out_reg_delay2_reg[0] <= 30'sb000000000000000000000000000000;
        ln_2_2_out_reg_delay2_reg[1] <= 30'sb000000000000000000000000000000;
        ln_2_2_out_reg_delay2_reg[2] <= 30'sb000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          ln_2_2_out_reg_delay2_reg[0] <= ln_2_2_out_reg_delay2_reg_next[0];
          ln_2_2_out_reg_delay2_reg[1] <= ln_2_2_out_reg_delay2_reg_next[1];
          ln_2_2_out_reg_delay2_reg[2] <= ln_2_2_out_reg_delay2_reg_next[2];
        end
      end
    end

  assign ln_2_2_out_reg_delay2_out1 = ln_2_2_out_reg_delay2_reg[2];
  assign ln_2_2_out_reg_delay2_reg_next[0] = ln_2_2_out1;
  assign ln_2_2_out_reg_delay2_reg_next[1] = ln_2_2_out_reg_delay2_reg[0];
  assign ln_2_2_out_reg_delay2_reg_next[2] = ln_2_2_out_reg_delay2_reg[1];



  // <S5>/Constant4
  assign Constant4_out1 = 48'h00000009AAFB;



  // <S5>/ln_3_1_in_delay
  always @(posedge clk or posedge reset)
    begin : reduced_process
      if (reset == 1'b1) begin
        In1_1 <= 37'h0000000000;
      end
      else begin
        if (enb) begin
          In1_1 <= In1;
        end
      end
    end



  // <S5>/ln_3_1
  assign ln_3_1_mul_temp = ln_2_1_out_reg_out1 * In1_1;
  assign ln_3_1_out1 = ln_3_1_mul_temp[61:35];



  // <S5>/ln_3_1_out_reg
  always @(posedge clk or posedge reset)
    begin : ln_3_1_out_reg_process
      if (reset == 1'b1) begin
        ln_3_1_out_reg_out1 <= 27'b000000000000000000000000000;
      end
      else begin
        if (enb) begin
          ln_3_1_out_reg_out1 <= ln_3_1_out1;
        end
      end
    end



  // <S5>/ln_3_1_out_reg_delay
  always @(posedge clk or posedge reset)
    begin : ln_3_1_out_reg_delay_process
      if (reset == 1'b1) begin
        ln_3_1_out_reg_delay_out1 <= 27'b000000000000000000000000000;
      end
      else begin
        if (enb) begin
          ln_3_1_out_reg_delay_out1 <= ln_3_1_out_reg_out1;
        end
      end
    end



  // <S5>/ln_3_2
  assign ln_3_2_mul_temp = Constant4_out1 * ln_3_1_out_reg_delay_out1;
  assign ln_3_2_out1 = ln_3_2_mul_temp[47:15];



  // <S5>/ln_1_1_out_reg_plus_const1_delay
  always @(posedge clk or posedge reset)
    begin : ln_1_1_out_reg_plus_const1_delay_process
      if (reset == 1'b1) begin
        ln_1_1_out_reg_plus_const1_delay_out1 <= 28'b0000000000000000000000000000;
      end
      else begin
        if (enb) begin
          ln_1_1_out_reg_plus_const1_delay_out1 <= Sum_out1;
        end
      end
    end



  // <S5>/ln_3_2_out_reg
  always @(posedge clk or posedge reset)
    begin : ln_3_2_out_reg_process
      if (reset == 1'b1) begin
        ln_3_2_out_reg_out1 <= 33'h000000000;
      end
      else begin
        if (enb) begin
          ln_3_2_out_reg_out1 <= ln_3_2_out1;
        end
      end
    end



  // <S5>/Sum1
  assign Sum1_add_cast = {ln_2_2_out_reg_delay2_out1[28:0], 1'b0};
  assign Sum1_add_cast_1 = {1'b0, ln_3_2_out_reg_out1[32:4]};
  assign Sum1_add_temp = Sum1_add_cast + Sum1_add_cast_1;
  assign Sum1_out1 = {Sum1_add_temp, 3'b000};



  // <S5>/Sum2
  assign Sum2_add_cast = {1'b0, {ln_1_1_out_reg_plus_const1_delay_out1, 4'b0000}};
  assign Sum2_add_cast_1 = {{3{Sum1_out1[32]}}, Sum1_out1[32:3]};
  assign Sum2_out1 = Sum2_add_cast + Sum2_add_cast_1;



  // <S5>/Constant5
  assign Constant5_out1 = 57'sh1FFFFFFFFFF126F;



  // <S5>/ln_4_1_delay2
  // 
  // <S5>/ln_4_1_delay1
  always @(posedge clk or posedge reset)
    begin : reduced_1_process
      if (reset == 1'b1) begin
        In1_2 <= 37'h0000000000;
      end
      else begin
        if (enb) begin
          In1_2 <= In1_1;
        end
      end
    end



  // <S5>/ln_4_1
  assign ln_4_1_mul_temp = ln_3_1_out_reg_out1 * In1_2;
  assign ln_4_1_out1 = ln_4_1_mul_temp[63:28];



  // <S5>/ln_4_1_out_reg
  always @(posedge clk or posedge reset)
    begin : ln_4_1_out_reg_process
      if (reset == 1'b1) begin
        ln_4_1_out_reg_out1 <= 36'h000000000;
      end
      else begin
        if (enb) begin
          ln_4_1_out_reg_out1 <= ln_4_1_out1;
        end
      end
    end



  // <S5>/ln_4_2
  assign ln_4_2_cast = {1'b0, ln_4_1_out_reg_out1};
  assign ln_4_2_mul_temp = Constant5_out1 * ln_4_2_cast;
  assign ln_4_2_cast_1 = ln_4_2_mul_temp[92:0];
  assign ln_4_2_out1 = ln_4_2_cast_1[56:22];



  // <S5>/ln_4_2_out_reg
  always @(posedge clk or posedge reset)
    begin : ln_4_2_out_reg_process
      if (reset == 1'b1) begin
        ln_4_2_out_reg_out1 <= 35'sh000000000;
      end
      else begin
        if (enb) begin
          ln_4_2_out_reg_out1 <= ln_4_2_out1;
        end
      end
    end



  // <S5>/Sum3
  assign Sum3_add_cast = {{4{ln_4_2_out_reg_out1[34]}}, ln_4_2_out_reg_out1[34:6]};
  assign Sum3_out1 = Sum2_out1 + Sum3_add_cast;



  assign Out1 = Sum3_out1;

endmodule  // LN_X_MNK_0_001_to_5000

