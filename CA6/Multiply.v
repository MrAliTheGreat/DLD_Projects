`timescale 1ns/1ns
module Multiply(input minus1_en , x_en , i_en , iplus_en , input signed [16:0] term_out , input signed [16:0] x_out , input [7:0] rom_out_i , input [7:0] rom_out_iplus , output signed [16:0] mult_out);
  assign mult_out = minus1_en ? (-1 * term_out) :
                    x_en ? (x_out * term_out) :
                    i_en ? (rom_out_i * term_out) :
                    iplus_en ? (rom_out_iplus * term_out) : term_out;

endmodule

