module DataPath(input clk , rst , start , ldx , ldy , ldterm , ldexp , init_term , init_exp , minus1_en , x_en , i_en , iplus_en , input signed [16:0] x , input [7:0] y , input [3:0] counteri , counteriplus , output signed [16:0] Rout);
  wire signed [16:0] x_out , exp , term_out , mult_out , add_out;
  wire [7:0] y_out , rom_i , rom_iplus;
  
  Register x_reg(x , ldx , clk, rst , x_out);
  Register8 y_reg(y , ldy, clk, rst,  y_out);
  ROMi ROM_i(counteri , rom_i);
  ROMi ROM_iplus(counteriplus , rom_iplus);
  Register_init term_reg(mult_out , x , ldterm , clk , rst , init_term , term_out);
  Register_init exp_reg(add_out , x , ldexp , clk , rst , init_exp , exp);
  Multiply cut_multiply(minus1_en , x_en , i_en , iplus_en , term_out , x_out , rom_i , rom_iplus , mult_out);
  Adder cut_adder(term_out , exp , add_out);
  
  assign Rout = exp;
  
endmodule
