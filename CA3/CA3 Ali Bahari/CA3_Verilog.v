`timescale 1ns/1ns

// This is half adder that we need for complementation
module incrementer(input A , B , output Ci , S);
  wire [0:1] j; 
  xnor #(27) cut_xnor(j[0] , A , B);
  nand #(10 , 8) cut_nand(j[1] , A , B);
  not #(5 , 7) cut_not_1(S , j[0]);
  not #(5 , 7) cut_not_2(Ci , j[1]);
endmodule










// This is the complementation
// XOR each bit with sign bit and then increment by 1
// This way when we complement a positive it'll still be the same number
module complement(input [15:0] A , output [15:0] comp_A);
  wire [15:0] comp_wire;
  genvar i , j;
  generate
    for(i = 0 ; i <= 15 ; i = i+1) begin
      xor #(27) cut_xor(comp_wire[i] , A[i] , A[15]);
    end
  endgenerate
  wire [15:0] Ci_wire;
  assign Ci_wire[0] = A[15];
  generate
    for(i = 0 ; i <= 15 ; i = i+1) begin
      incrementer cut_increment(comp_wire[i] , Ci_wire[i] , Ci_wire[i + 1] , comp_A[i]);
    end
  endgenerate
endmodule









// This is for finding equality
// First half of comparator
module equal_comp(input A , B , eq , output EQ);
  wire [1:0] j;
  xnor #(27) cut_xnor(j[0] , A , B);
  nand #(10 , 8) cut_nand(j[1] , j[0] , eq);
  not #(5 , 7) cut_not(EQ , j[1]);
endmodule









// This is the encoder needed for getting d
module encoder(input [15:0] num , output[3:0] coded_num);
  wire [7:0] j;
  
  nor #(20 , 28) cut_nor1(j[0] , num[15] , num[14] , num[13] , num[12]);
  nor #(20 , 28) cut_nor2(j[1] , num[11] , num[10] , num[9] , num[8]);
  
  nor #(20 , 28) cut_nor3(j[2] , num[15] , num[14] , num[13] , num[12]);
  nor #(20 , 28) cut_nor4(j[3] , num[7] , num[6] , num[5] , num[4]);
  
  nor #(20 , 28) cut_nor5(j[4] , num[15] , num[14] , num[11] , num[10]);
  nor #(20 , 28) cut_nor6(j[5] , num[7] , num[6] , num[3] , num[2]);
  
  nor #(20 , 28) cut_nor7(j[6] , num[15] , num[13] , num[11] , num[9]);
  nor #(20 , 28) cut_nor8(j[7] , num[7] , num[5] , num[3] , num[1]);
  
  nand #(10 , 8) cut_nand1(coded_num[3] , j[0] , j[1]);
  nand #(10 , 8) cut_nand2(coded_num[2] , j[2] , j[3]);
  nand #(10 , 8) cut_nand3(coded_num[1] , j[4] , j[5]);
  nand #(10 , 8) cut_nand4(coded_num[0] , j[6] , j[7]);
endmodule









// This is for getting d
module magnitude_diff_component(input A , B , change1_in , change2_in , output change1_out , change2_out , w);
  wire [2:0] j;
  xor #(27) cut_xor(j[0] , A , B);
  nor #(10 , 14) cut_nor(j[1] , change1_in , j[0]);
  not #(5 , 7) cut_not1(change1_out , j[1]);
  not #(5 , 7) cut_not2(change2_out , change1_out);
  nand #(10 , 8) cut_nand(j[2] , change1_out , change2_in);
  not #(5 , 7) cut_not3(w , j[2]);
endmodule








// This is part 1 circuit
module eq_ae_d_comparator(input [15:0] A , B , output [3:0] d , output EQ , AE);
  wire [16:0] wire_change1 , wire_change2;
  wire [15:0] wire_w; 
  assign wire_change1[16] = 0;
  assign wire_change2[16] = 1;
  genvar i;
  generate
    for(i = 15 ; i >= 0 ; i = i-1) begin
      magnitude_diff_component cut_mag_diff_comp(A[i] , B[i] , wire_change1[i+1] , wire_change2[i+1] , wire_change1[i] , wire_change2[i] , wire_w[i]);
    end
  endgenerate
  
  encoder cut_encoder(wire_w , d);
  
  wire [15:0] comp_A , comp_B;
  complement cut_comp_A(A , comp_A);
  complement cut_comp_B(B , comp_B);
  
  wire [16:0] wire_eq , wire_ae;
  assign wire_eq[16] = 1;
  assign wire_ae[16] = 1;
  assign EQ = wire_eq[0];
  assign AE = wire_ae[0];
  genvar j;
  generate
    for(j = 15 ; j >= 0 ; j = j-1) begin
      equal_comp cut_equal_eq(A[j] , B[j] , wire_eq[j+1] , wire_eq[j]);
      equal_comp cut_equal_ae(comp_A[j] , comp_B[j] , wire_ae[j+1] , wire_ae[j]);
    end
  endgenerate
  
endmodule









// This is a comparator in which we just want GT
module gt_comp_component(input A , B , eq , gt , output EQ , GT);
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








// This is part 2 circuit
module gt_comparator(input [15:0] A , B , output GT);
  wire [16:0] wire_eq , wire_gt;
  assign wire_eq[16] = 1;
  assign wire_gt[16] = 0;
  
  wire [15:0] comp_A , comp_B;
  complement cut_comp_A(A , comp_A);
  complement cut_comp_B(B , comp_B);
  
  genvar i;
  generate
    for(i = 15 ; i >= 0 ; i = i-1) begin
      gt_comp_component cut_gt_comp(comp_A[i] , comp_B[i] , wire_eq[i+1] , wire_gt[i+1] , wire_eq[i] , wire_gt[i]);
    end
  endgenerate
  
  assign GT = (A[15] == 0) & (B[15] == 1) ? 1'b1 : 
              (A[15] == 0) & (B[15] == 0) ? wire_gt[0] :
              (A[15] == 1) & (B[15] == 0) ? 1'b0:
              (A[15] == 1) & (B[15] == 1) ? wire_eq[0] ? wire_gt[0] : ~wire_gt[0]:
                                            1'bX; 
endmodule









// Putting part 1 and 2 circuits together
// Gate level MFC
module comparator_gate(input [15:0] A , B , output EQ , AE , GT , output [3:0] d);
  eq_ae_d_comparator cut_equal_d_comp(A , B , d , EQ , AE);
  gt_comparator cut_gt_comp(A , B , GT);
endmodule










// =====================================================================================================================================
// =====================================================================================================================================
// =====================================================================================================================================
// =====================================================================================================================================
// =====================================================================================================================================

// This is half adder with assign statement
module incrementer_assign_component(input A , B , output Ci , S);
  wire j;
  assign #27 S = (A & ~B) | (~A & B);
  assign #10 j = ~(A & B);
  assign #7 Ci = ~j;
endmodule









// This is complementation of our input with assign and always statement
module complement_assign(input [15:0] A , output [15:0] complement_A);
  integer i;
  reg [15:0] comp_A;
  always @(A) begin
    for(i = 0 ; i <= 15 ; i = i+1) begin
      #27 comp_A[i] = (A[15] & ~A[i]) | (~A[15] & A[i]);
    end
  end
  
  wire [15:0] wire_Ci_A;
  assign wire_Ci_A[0] = A[15];

  genvar j;
  generate
    for(j = 0 ; j <= 15 ; j = j+1) begin
      incrementer_assign_component cut_inc_assign_A(comp_A[j] , wire_Ci_A[j] , wire_Ci_A[j + 1] , complement_A[j]);
    end
  endgenerate
endmodule









// This is the whole MFC but behavioural (with always and if-else statements)
// Part 4 circuit
module comparator_behavioural(input [15:0] A , B , output reg EQ , AE , GT , output reg [3:0] d);
  integer i;
  wire [15:0] comp_A , comp_B;
  
  complement_assign cut_comp_A(A , comp_A);
  complement_assign cut_comp_B(B , comp_B);
  
  always @(A , B , comp_A , comp_B) begin
    d = 4'b0000;
    for(i = 0 ; i <= 15 ; i = i+1) begin
      #299;
      if(A[i] != B[i]) begin 
        d = i;
      end
    end
    
    #299;
    if(A == B) begin
      EQ = 1;
    end else if(A != B) begin
      EQ = 0;
    end
    #299;
    if(comp_A == comp_B) begin
      AE = 1;
    end else if(comp_A != comp_B) begin
      AE = 0;
    end
    
    #374;
    if(A[15] == 0 & B[15] == 1) begin
      GT = 1;
    end else if(A[15] == 1 & B[15] == 0) begin
      GT = 0;
    end else if(A[15] == 0 & B[15] == 0) begin
      if(A > B) begin 
        GT = 1;
      end else
        GT = 0;
    end else if(A[15] == 1 & B[15] == 1) begin
      if(comp_A < comp_B) begin
        GT = 1;
      end else
        GT = 0;
    end
  end
endmodule









// The test bench for the 2 circuits (gate level & behavioural)
module testTB();
  reg [15:0] A , B;
  wire [3:0] d_gate , d_behavioural;
  wire EQ_gate , AE_gate , GT_gate , EQ_behavioural , AE_behavioural , GT_behavioural;
  comparator_gate cut_comparator_gate(A , B , EQ_gate , AE_gate , GT_gate , d_gate);
  comparator_behavioural cut_comparator_behavioural(A , B , EQ_behavioural , AE_behavioural , GT_behavioural , d_behavioural);
  initial begin
   #5 A = 16'b1001011110010110; B = 16'b1110100001101010;
   //#5 A = 16'b1111111111111111; B = 16'b1111111111111111;
   //#5 A = 16'b1011100111110001; B = 16'b0110000011111010;
   //#5 A = 16'b0011100111110001; B = 16'b1110000011111010;
   //#5 A = 16'b1101010111001100; B = 16'b0010101000110100;
   #10000 $stop;
  end
endmodule