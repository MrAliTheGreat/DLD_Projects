module multiplexer(input a, input b, input select, output Q);
  wire i0, i1, i2;
  not #(5, 7) cut_not (i0, select);
  nand #(10, 8) cut_nand_1 (i1, a, i0);
  nand #(10, 8) cut_nand_2 (i2, b, select);
  nand #(10, 8) cut_nand_3 (Q, i1, i2);
endmodule
