`timescale 1ns/1ns
module cross_coupled_nor(input set, input reset, input rst, output Q);
  wire i0, i1, i2, i3 , i4 , i5;
  not #(5, 7) cut_not_1 (i0 , rst);
  nand #(10, 8) cut_nand_1 (i1, set, i0);
  nor #(10, 14) cut_nor_1 (i2, reset, rst);
  not #(5, 7) cut_not_2 (i3, i1);
  not #(5, 7) cut_not_3 (i4, i2);
  nor #(10, 14)cut_nor_2 (i5, Q , i3);
  nor #(10, 14) cut_nor_3 (Q, i4, i5);
endmodule

module clocked_d_latch(input D, input clk, input rst, output Q);
  wire i0, i1, i2 , i3 , i4;
  nand #(10, 8) cut_nand_1 (i0, D, clk);
  not #(5, 7) cut_not_1 (i1, D);
  nand #(10, 8) cut_nand_2 (i2, i1, clk);
  not #(5, 7) cut_not_2 (i3, i0);
  not #(5, 7) cut_not_3 (i4, i2);
  cross_coupled_nor cut_cross_coupled_nor (i3, i4, rst, Q);
endmodule

module multiplexer(input a, input b, input select, output Q);
  wire i0, i1, i2;
  not #(5, 7) cut_not (i0, select);
  nand #(10, 8) cut_nand_1 (i1, a, i0);
  nand #(10, 8) cut_nand_2 (i2, b, select);
  nand #(10, 8) cut_nand_3 (Q, i1, i2);
endmodule

module D_flipflop (input D, input clk, input rst, input en, output Q);
  wire i0, i1, i2;
  multiplexer cut_mux_1 (Q, D, en, i0);
  clocked_d_latch cut_latch_1 (i0, clk, rst, i1);
  not #(5, 7) cut_not_1 (i2, clk);
  clocked_d_latch c3 (i1, i2, rst, Q);
endmodule

module six_bit_shift_register (input serIn, input clk, input rst, input en, output [0:5] Q);
  D_flipflop cut_flipflop_1 (serIn, clk, rst, en, Q[0]);
  D_flipflop cut_flipflop_2 (Q[0], clk, rst, en, Q[1]);
  D_flipflop cut_flipflop_3 (Q[1], clk, rst, en, Q[2]);
  D_flipflop cut_flipflop_4 (Q[2], clk, rst, en, Q[3]);
  D_flipflop cut_flipflop_5 (Q[3], clk, rst, en, Q[4]);
  D_flipflop cut_flipflop_6 (Q[4], clk, rst, en, Q[5]);
endmodule
