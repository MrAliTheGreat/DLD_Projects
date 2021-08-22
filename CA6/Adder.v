`timescale 1ns/1ns
module Adder(input signed [16:0] term_out , input signed [16:0] exp_out , output signed [16:0] add_out);
  assign add_out = term_out + exp_out;
endmodule