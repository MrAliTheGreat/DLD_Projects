`timescale 1ns/1ns

module twoBitComparator(input A , B , input eq , gt , output EQ , GT);
  wire [0:6] j;
  not #(5 , 7) cut_not_1(j[0] , B);
  nand #(10 , 8) cut_nand_1(j[1] , j[0] , A);
  xnor #(27) cut_xnor(j[2] , A , B);
  not #(5 , 7) cut_not_2(j[3] , eq);
  nor #(10 , 14) cut_nor_1(j[4] , j[3] , j[1]);
  nand #(10 , 8) cut_nand_2(j[6] , eq , j[2]);
  not #(5 , 7) cut_not_3(EQ , j[6]);
  nor #(10 , 14) cut_nor_2(j[5] , j[4] , gt);
  not #(5 , 7) cut_not_4(GT , j[5]);
endmodule

module gt_cascadable_comparator(input A , B , input eq , gt , output EQ , GT);
  wire [0:6] j;
  assign #7 j[0] = ~B;
  assign #10 j[1] = ~(A & j[0]);
  assign #27 j[2] = ((A & B) | (~A & ~B));
  assign #7 j[3] = ~eq;
  assign #14 j[4] = ~(j[1] | j[3]);
  assign #10 j[5] = ~(j[4] | gt);
  assign #10 j[6] = ~(j[2] & eq);
  assign #7 EQ = ~j[6]; 
  assign #7 GT = ~j[5];
endmodule

module GT_Comparator(input [15:0] A , B , input eq , gt , output GT);
  wire [16:0] gt_wire , eq_wire;
  assign gt_wire[16] = 0;
  assign eq_wire[16] = 1;
  assign GT = gt_wire[0];
  genvar i;
  generate
    for(i = 15 ; i >= 0 ; i = i - 1) begin
      gt_cascadable_comparator cut_gt_component(A[i] , B[i] , eq_wire[i + 1] , gt_wire[i + 1] , eq_wire[i] , gt_wire[i]);
    end
  endgenerate
endmodule


module first_eq_ae_comparator(input[1:0] A , B , input eq , ae , output EQ , AE);
  wire [0:5] j;
  xnor #(27) cut_xnor_1(j[0] , A[1] , B[1]);
  xnor #(27) cut_xnor_2(j[1] , A[0] , B[0]);
  nand #(10 , 8) cut_nand_1(j[2] , j[0] , eq);
  not #(5 , 7) cut_not_1(j[3] , j[2]);
  nand #(10 , 8) cut_nand_2(j[4] , j[3] , j[1]);
  not #(5 , 7) cut_not_2(EQ , j[4]);
  nand #(10 , 8) cut_nand_3(j[5] , j[1] , ae);
  not #(5 , 7) cut_not_3(AE , j[5]); 
endmodule

module other_eq_ae_comparator(input A , B , input eq , ae , output EQ , AE);
  wire [0:2] j;
  xnor #(27) cut_xnor(j[0] , A , B);
  nand #(10 , 8) cut_nand_1(j[1] , j[0] , eq);
  nand #(10 , 8) cut_nand_2(j[2] , j[0] , ae);
  not #(5 , 7) cut_not_1(EQ , j[1]);
  not #(5 , 7) cut_not_2(AE , j[2]);
endmodule

module EQ_AE_Comparator(input [15:0] A , B , input eq , ae , output EQ , AE);
  wire[15:0] eq_wire , ae_wire;
  assign eq_wire[15] = 1;
  assign ae_wire[15] = 1;
  assign EQ = eq_wire[0];
  assign AE = ae_wire[0];
  first_eq_ae_comparator cut_first_component(A[15:14] , B[15:14] , eq_wire[15] , ae_wire[15] , eq_wire[14] , ae_wire[14]);
  genvar i;
  generate
    for(i = 13 ; i >= 0 ; i=i-1) begin
      other_eq_ae_comparator cut_other_components(A[i] , B[i] , eq_wire[i+1] , ae_wire[i+1] , eq_wire[i] , ae_wire[i]);
    end
  endgenerate
endmodule

module testTB();
  reg [15:0] A , B;
  reg eq = 1 , gt = 0;
  wire GT;
  GT_Comparator cut_test(A , B , eq , gt , GT);
  initial begin
    #10 A = 16'b1000000000000000 ; B = 16'b0000000000000000;
    #250 A = 16'b000000000000000 ; B = 16'b0000001000000000;
    #350 $stop;
  end
endmodule



