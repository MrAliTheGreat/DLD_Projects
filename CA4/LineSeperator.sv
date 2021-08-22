`timescale 1ns/1ns
module line_seperator (input [3:0][3:0]L, output L0,output L1,output L2,output L3,output L4,output L5,output L6,output L7, output L8,output L9,output L10,output L11,output L12,output L13,output L14,output L15);
  assign L0 = L[0][0];
  assign L1 = L[0][1];
  assign L2 = L[0][2];
  assign L3 = L[0][3];
  assign L4 = L[1][0];
  assign L5 = L[1][1];
  assign L6 = L[1][2];
  assign L7 = L[1][3];
  assign L8 = L[2][0];
  assign L9 = L[2][1];
  assign L10 = L[2][2];
  assign L11 = L[2][3];
  assign L12 = L[3][0];
  assign L13 = L[3][1];
  assign L14 = L[3][2];
  assign L15 = L[3][3];
endmodule