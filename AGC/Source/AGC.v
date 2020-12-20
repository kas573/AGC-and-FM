`timescale 1 ns / 1 ns

module AGC
          (
           clk,
           reset,
           clk_enable,
           inp_agc,
           out_agc
          );



  input   clk;
  input   reset;
  input   clk_enable;
  input   signed [12:0] inp_agc;  // sfix13_En6
  output  signed [38:0] out_agc;  // sfix39_En36

  wire enb;
  wire [30:0] ALPHA4_out1;  // ufix31_En31
  wire [20:0] exponent_reduction_out1;  // ufix21_En21
  wire [25:0] ALPHA_out1;  // ufix26_En26
  wire [28:0] R_out1;  // ufix29_En26
  wire [1:0] exponent_multiplication_out1;  // ufix2
  wire exponent_adiition_out1;  // ufix1_En1
  reg signed [33:0] VGA_register_out1;  // sfix34_En27
  wire signed [67:0] Signal_power_mul_temp;  // sfix68_En54
  wire [28:0] Signal_power_out1;  // ufix29_En17
  reg [28:0] signal_power_register_out1;  // ufix29_En17
  wire [36:0] EXPONENTIAL_AVERAGING_FILTER_out1;  // ufix37_En28
  reg [36:0] exp_filter_out_register_out1;  // ufix37_En28
  wire signed [32:0] LN_X_MNK_0_001_to_5000_out1;  // sfix33_En29
  reg signed [32:0] ln_out_register_out1;  // sfix33_En29
  wire signed [32:0] Sum1_sub_cast;  // sfix33_En29
  wire signed [32:0] Sum1_sub_temp;  // sfix33_En29
  wire signed [28:0] Sum1_out1;  // sfix29_En26
  wire signed [26:0] time_const_product_cast;  // sfix27_En26
  wire signed [55:0] time_const_product_mul_temp;  // sfix56_En52
  wire signed [54:0] time_const_product_cast_1;  // sfix55_En52
  wire signed [31:0] time_const_product_out1;  // sfix32_En32
  reg signed [31:0] time_const_product_out_reg_out1;  // sfix32_En32
  reg signed [34:0] Delay_out1;  // sfix35_En32
  wire signed [35:0] Sum_add_cast;  // sfix36_En32
  wire signed [35:0] Sum_add_cast_1;  // sfix36_En32
  wire signed [35:0] Sum_add_temp;  // sfix36_En32
  wire signed [34:0] Sum_out1;  // sfix35_En32
  wire signed [35:0] Sum2_add_cast;  // sfix36_En32
  wire signed [35:0] Sum2_add_cast_1;  // sfix36_En32
  wire signed [35:0] Sum2_out1;  // sfix36_En32
  wire signed [35:0] exponent_product_in1;  // sfix36_En33
  wire signed [36:0] exponent_product_cast;  // sfix37_En33
  wire signed [35:0] exponent_product_out1;  // sfix36_En33
  reg signed [35:0] exponent_product_out_reg_out1;  // sfix36_En33
  wire [37:0] EXP_APPROX_CHEBYSHEV_out1;  // ufix38_En33
  reg [37:0] exp_approx_out_reg_out1;  // ufix38_En33
  wire [75:0] exponent_squared_mul_temp;  // ufix76_En66
  wire [36:0] exponent_squared_out1;  // ufix37_En28
  reg [36:0] exponent_squared_out_reg_out1;  // ufix37_En28
  wire [57:0] exponent_reduction_product_mul_temp;  // ufix58_En49
  wire [32:0] exponent_reduction_product_out1;  // ufix33_En27
  reg [32:0] exponent_reduction_product_out_reg_out1;  // ufix33_En27
  wire signed [33:0] VGA_cast;  // sfix34_En27
  wire signed [46:0] VGA_mul_temp;  // sfix47_En33
  wire signed [45:0] VGA_cast_1;  // sfix46_En33
  wire signed [33:0] VGA_out1;  // sfix34_En27
  wire signed [31:0] SCALING_cast;  // sfix32_En31
  wire signed [65:0] SCALING_mul_temp;  // sfix66_En58
  wire signed [64:0] SCALING_cast_1;  // sfix65_En58
  wire signed [38:0] SCALING_out1;  // sfix39_En36
  reg signed [38:0] out_agc_register_out1;  // sfix39_En36


  // <S1>/ALPHA4
  assign ALPHA4_out1 = 31'b0000110011001100110011001100110;



  // <S1>/exponent_reduction
  assign exponent_reduction_out1 = 21'b001000101010010101011;



  // <S1>/ALPHA
  assign ALPHA_out1 = 26'b00000011110101110000101001;



  // <S1>/R
  assign R_out1 = 29'b10011110011001100110011001101;



  assign enb = clk_enable;

  // <S1>/exponent_multiplication
  assign exponent_multiplication_out1 = 2'b10;



  // <S1>/exponent_adiition
  assign exponent_adiition_out1 = 1'b1;



  // <S1>/Signal power
  assign Signal_power_mul_temp = VGA_register_out1 * VGA_register_out1;
  assign Signal_power_out1 = ((Signal_power_mul_temp[67] == 1'b0) && (Signal_power_mul_temp[66] != 1'b0) ? 29'b11111111111111111111111111111 :
              (Signal_power_mul_temp[67] == 1'b1 ? 29'b00000000000000000000000000000 :
              Signal_power_mul_temp[65:37]));



  // <S1>/signal_power_register
  always @(posedge clk or posedge reset)
    begin : signal_power_register_process
      if (reset == 1'b1) begin
        signal_power_register_out1 <= 29'b00000000000000000000000000000;
      end
      else begin
        if (enb) begin
          signal_power_register_out1 <= Signal_power_out1;
        end
      end
    end



  // <S1>/EXPONENTIAL AVERAGING FILTER
  EXPONENTIAL_AVERAGING_FILTER   u_EXPONENTIAL_AVERAGING_FILTER   (.clk(clk),
                                                                   .reset(reset),
                                                                   .enb(clk_enable),
                                                                   .In1(signal_power_register_out1),  // ufix29_En17
                                                                   .Out1(EXPONENTIAL_AVERAGING_FILTER_out1)  // ufix37_En28
                                                                   );

  // <S1>/exp_filter_out_register
  always @(posedge clk or posedge reset)
    begin : exp_filter_out_register_process
      if (reset == 1'b1) begin
        exp_filter_out_register_out1 <= 37'h0000000000;
      end
      else begin
        if (enb) begin
          exp_filter_out_register_out1 <= EXPONENTIAL_AVERAGING_FILTER_out1;
        end
      end
    end



  // <S1>/LN(X) MNK 0.001 to 5000
  LN_X_MNK_0_001_to_5000   u_LN_X_MNK_0_001_to_5000   (.clk(clk),
                                                       .reset(reset),
                                                       .enb(clk_enable),
                                                       .In1(exp_filter_out_register_out1),  // ufix37_En28
                                                       .Out1(LN_X_MNK_0_001_to_5000_out1)  // sfix33_En29
                                                       );

  // <S1>/ln_out_register
  always @(posedge clk or posedge reset)
    begin : ln_out_register_process
      if (reset == 1'b1) begin
        ln_out_register_out1 <= 33'sh000000000;
      end
      else begin
        if (enb) begin
          ln_out_register_out1 <= LN_X_MNK_0_001_to_5000_out1;
        end
      end
    end



  // <S1>/Sum1
  assign Sum1_sub_cast = {1'b0, {R_out1, 3'b000}};
  assign Sum1_sub_temp = Sum1_sub_cast - ln_out_register_out1;
  assign Sum1_out1 = Sum1_sub_temp[31:3];



  // <S1>/time_const_product
  assign time_const_product_cast = {1'b0, ALPHA_out1};
  assign time_const_product_mul_temp = time_const_product_cast * Sum1_out1;
  assign time_const_product_cast_1 = time_const_product_mul_temp[54:0];
  assign time_const_product_out1 = time_const_product_cast_1[51:20];



  // <S1>/time_const_product_out_reg
  always @(posedge clk or posedge reset)
    begin : time_const_product_out_reg_process
      if (reset == 1'b1) begin
        time_const_product_out_reg_out1 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          time_const_product_out_reg_out1 <= time_const_product_out1;
        end
      end
    end



  // <S1>/Sum
  assign Sum_add_cast = {{4{time_const_product_out_reg_out1[31]}}, time_const_product_out_reg_out1};
  assign Sum_add_cast_1 = {Delay_out1[34], Delay_out1};
  assign Sum_add_temp = Sum_add_cast + Sum_add_cast_1;
  assign Sum_out1 = Sum_add_temp[34:0];



  // <S1>/Delay
  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 35'sh000000000;
      end
      else begin
        if (enb) begin
          Delay_out1 <= Sum_out1;
        end
      end
    end



  // <S1>/Sum2
  assign Sum2_add_cast = {Delay_out1[34], Delay_out1};
  assign Sum2_add_cast_1 = {2'b0, {exponent_multiplication_out1, 32'b00000000000000000000000000000000}};
  assign Sum2_out1 = Sum2_add_cast + Sum2_add_cast_1;



  // <S1>/exponent_product
  assign exponent_product_in1 = (exponent_adiition_out1 == 1'b1 ? Sum2_out1 :
              36'sh000000000);
  assign exponent_product_cast = {exponent_product_in1[35], exponent_product_in1};
  assign exponent_product_out1 = exponent_product_cast[35:0];



  // <S1>/exponent_product_out+reg
  always @(posedge clk or posedge reset)
    begin : exponent_product_out_reg_process
      if (reset == 1'b1) begin
        exponent_product_out_reg_out1 <= 36'sh000000000;
      end
      else begin
        if (enb) begin
          exponent_product_out_reg_out1 <= exponent_product_out1;
        end
      end
    end



  // <S1>/EXP APPROX CHEBYSHEV
  EXP_APPROX_CHEBYSHEV   u_EXP_APPROX_CHEBYSHEV   (.clk(clk),
                                                   .reset(reset),
                                                   .enb(clk_enable),
                                                   .In1(exponent_product_out_reg_out1),  // sfix36_En33
                                                   .Out1(EXP_APPROX_CHEBYSHEV_out1)  // ufix38_En33
                                                   );

  // <S1>/exp_approx_out_reg
  always @(posedge clk or posedge reset)
    begin : exp_approx_out_reg_process
      if (reset == 1'b1) begin
        exp_approx_out_reg_out1 <= 38'h0000000000;
      end
      else begin
        if (enb) begin
          exp_approx_out_reg_out1 <= EXP_APPROX_CHEBYSHEV_out1;
        end
      end
    end



  // <S1>/exponent_squared
  assign exponent_squared_mul_temp = exp_approx_out_reg_out1 * exp_approx_out_reg_out1;
  assign exponent_squared_out1 = exponent_squared_mul_temp[74:38];



  // <S1>/exponent_squared_out_reg
  always @(posedge clk or posedge reset)
    begin : exponent_squared_out_reg_process
      if (reset == 1'b1) begin
        exponent_squared_out_reg_out1 <= 37'h0000000000;
      end
      else begin
        if (enb) begin
          exponent_squared_out_reg_out1 <= exponent_squared_out1;
        end
      end
    end



  // <S1>/exponent_reduction_product
  assign exponent_reduction_product_mul_temp = exponent_reduction_out1 * exponent_squared_out_reg_out1;
  assign exponent_reduction_product_out1 = exponent_reduction_product_mul_temp[54:22];



  // <S1>/exponent_reduction_product_out_reg
  always @(posedge clk or posedge reset)
    begin : exponent_reduction_product_out_reg_process
      if (reset == 1'b1) begin
        exponent_reduction_product_out_reg_out1 <= 33'h000000000;
      end
      else begin
        if (enb) begin
          exponent_reduction_product_out_reg_out1 <= exponent_reduction_product_out1;
        end
      end
    end



  // <S1>/VGA
  assign VGA_cast = {1'b0, exponent_reduction_product_out_reg_out1};
  assign VGA_mul_temp = inp_agc * VGA_cast;
  assign VGA_cast_1 = VGA_mul_temp[45:0];
  assign VGA_out1 = VGA_cast_1[39:6];



  // <S1>/VGA_register
  always @(posedge clk or posedge reset)
    begin : VGA_register_process
      if (reset == 1'b1) begin
        VGA_register_out1 <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          VGA_register_out1 <= VGA_out1;
        end
      end
    end



  // <S1>/SCALING
  assign SCALING_cast = {1'b0, ALPHA4_out1};
  assign SCALING_mul_temp = SCALING_cast * VGA_register_out1;
  assign SCALING_cast_1 = SCALING_mul_temp[64:0];
  assign SCALING_out1 = SCALING_cast_1[60:22];



  // <S1>/out_agc_register
  always @(posedge clk or posedge reset)
    begin : out_agc_register_process
      if (reset == 1'b1) begin
        out_agc_register_out1 <= 39'sh0000000000;
      end
      else begin
        if (enb) begin
          out_agc_register_out1 <= SCALING_out1;
        end
      end
    end



  assign out_agc = out_agc_register_out1;


endmodule  // AGC
