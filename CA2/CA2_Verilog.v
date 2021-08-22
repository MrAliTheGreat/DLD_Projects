`timescale 1ns/1ns
// Part 1 , 2 , 3

// 2 Input NOR
module nor2(input a , b , output w);
  supply1 vdd;
  supply0 gnd;
  wire j;
  pmos#(5,6,7) p1(j , vdd , a),
               p2(w , j , b);
  nmos#(3,4,5) n1(w , gnd , a),
               n2(w , gnd , b);
endmodule

// 4 Select Demultiplexer
module demultiplexer_4Select(input serIn , [3:0] PB , output [3:0] P);
  wire k , j0 , j1 , j2 , j3;
  not #(5 , 7) not_k(k , serIn);
  not #(5 , 7) not_j0(j0 , PB[0]);
  not #(5 , 7) not_j1(j1 , PB[1]);
  not #(5 , 7) not_j2(j2 , PB[2]);
  not #(5 , 7) not_j3(j3 , PB[3]);
  //nor #(10 , 14) cut_nor(P[0] , j0 , k);
  nor2 nor_P0(j0 , k , P[0]);
  nor2 nor_P1(j1 , k , P[1]);
  nor2 nor_P2(j2 , k , P[2]);
  nor2 nor_P3(j3 , k , P[3]);
endmodule

// 4 Select Demultiplexer with assign statements
module demultiplexer_4Select_assign(input serIn , [3:0] PB , output [3:0] P);
  wire k , j0 , j1 , j2 , j3;
  assign #7 k = ~serIn;
  assign #7 j0 = ~PB[0];
  assign #7 j1 = ~PB[1];
  assign #7 j2 = ~PB[2];
  assign #7 j3 = ~PB[3];
  assign #14 P[0] = ~(k | j0);
  assign #14 P[1] = ~(k | j1);
  assign #14 P[2] = ~(k | j2);
  assign #14 P[3] = ~(k | j3);
endmodule

// 4 select demultiplexers Test Bench
module demultiplexer_4selectTB();
  reg serIn; 
  reg [3:0] PB;
  wire [3:0] P_normal;
  wire [3:0] P_assign;
  demultiplexer_4Select cut_normal_demulti(serIn , PB , P_normal);
  demultiplexer_4Select_assign cut_assign_demulti(serIn , PB , P_assign);
  initial begin
    #5 serIn = 1; PB[0] = 1; PB[1] = 0; PB[2] = 1; PB[3] = 0;
    #30 PB[0] = 0; PB[1] = 1; PB[2] = 0; PB[3] = 1;
    #25 PB[0] = 1; PB[2] = 1;
    #30 PB[0] = 0; PB[1] = 0; PB[2] = 0; PB[3] = 0;
    #25 serIn = 0; PB[0] = 1; PB[1] = 1; PB[2] = 1; PB[3] = 1;
    #40 $stop;
  end
  
endmodule















// Part 4 , 5 , 6

// 3 Input NOR
module nor3(input a , b , c , output w);
  supply1 vdd;
  supply0 gnd;
  wire j , k;
  pmos#(5,6,7) p1(j , vdd , a),
               p2(k , j , c),
               p3(w , k , b);
  nmos#(3,4,5) n1(w , gnd , a),
               n2(w , gnd , b),
               n3(w , gnd , c);
endmodule

// 2 select demultiplexer
module demultiplexer_2select(input serIn , [0:1] LB , output [0:3] L);
  wire k , j0 , j1;
  not #(5 , 7) not_k(k , serIn);
  not #(5 , 7) not_j0(j0 , LB[0]);
  not #(5 , 7) not_j1(j1 , LB[1]);
  //nor #(15 , 21) cut_nor(L[0] , LB[0] , LB[1] , k);
  nor3 nor_L0(LB[0] , LB[1] , k , L[0]);
  nor3 nor_L1(LB[0] , j1 , k , L[1]);
  nor3 nor_L2(j0 , j1 , k , L[2]);
  nor3 nor_L3(j0 , LB[1] , k , L[3]);
  
endmodule

// 2 select demultiplexer with assign statement
module demultiplexer_2select_assign(input serIn , [0:1] LB , output [0:3] L);
  wire k , j0 , j1;
  assign #7 k = ~serIn;
  assign #7 j0 = ~LB[0];
  assign #7 j1 = ~LB[1];
  assign #21 L[0] = ~(LB[0] | LB[1] | k);
  assign #21 L[1] = ~(LB[0] | j1 | k);
  assign #21 L[2] = ~(j0 | j1 | k);
  assign #21 L[3] = ~(j0 | LB[1] | k);
endmodule

// 2 select demultiplexers Test Bench
module demultiplexer_2selectTB();
  reg serIn; reg [0:1] LB;
  wire[0:3] L_normal;
  wire[0:3] L_assign;
  demultiplexer_2select cut_normal_demulti2(serIn , LB , L_normal);
  demultiplexer_2select_assign cut_assign_demulti2(serIn , LB , L_assign);
  initial begin
    #5 serIn = 1; LB[0] = 0; LB[1] = 0;
    #30 LB[1] = 1; 
    #35 LB[0] = 1;
    #30 LB[1] = 0;    
    #40 $stop;
  end
  
endmodule















// Part 7 , 8 , 9

// Broadcaster
module broadcaster(input serIn , [3:0] PB , [0:1] LB0 , [0:1] LB1 , [0:1] LB2 , [0:1] LB3 , output [0:3] lines0 , [0:3] lines1 , [0:3] lines2 , [0:3] lines3);
  wire [3:0] j;
  demultiplexer_4Select cut_demulti_4select_ports(serIn , PB , j);
  demultiplexer_2select cut_demulti_2select_0(j[0] , LB0 , lines0);
  demultiplexer_2select cut_demulti_2select_1(j[1] , LB1 , lines1);
  demultiplexer_2select cut_demulti_2select_2(j[2] , LB2 , lines2);
  demultiplexer_2select cut_demulti_2select_3(j[3] , LB3 , lines3);
  
endmodule

// Broadcaster with assign statements
module broadcaster_assign(input serIn , [3:0] PB , [0:1] LB0 , [0:1] LB1 , [0:1] LB2 , [0:1] LB3 , output [0:3] lines0 , [0:3] lines1 , [0:3] lines2 , [0:3] lines3);
  wire [0:3] j;
  assign j[0] = PB[0] ? serIn : 0;
  assign #21 j[1] = PB[1] ? serIn : 0;
  assign #21 j[2] = PB[2] ? serIn : 0;
  assign #21 j[3] = PB[3] ? serIn : 0;
  
  assign #28 lines0[0] = LB0[0] ? (LB0[1]? 0 : 0) : (LB0[1]? 0 : j[0]);
  assign #28 lines0[1] = LB0[0] ? (LB0[1]? 0 : j[0]) : (LB0[1]? 0 : 0);
  assign #28 lines0[2] = LB0[0] ? (LB0[1]? 0 : 0) : (LB0[1]? j[0] : 0);
  assign #28 lines0[3] = LB0[0] ? (LB0[1]? j[0] : 0) : (LB0[1]? 0 : 0);
  
  assign #28 lines1[0] = LB1[0] ? (LB1[1]? 0 : 0) : (LB1[1]? 0 : j[1]);
  assign #28 lines1[1] = LB1[0] ? (LB1[1]? 0 : j[1]) : (LB1[1]? 0 : 0);
  assign #28 lines1[2] = LB1[0] ? (LB1[1]? 0 : 0) : (LB1[1]? j[1] : 0);
  assign #28 lines1[3] = LB1[0] ? (LB1[1]? j[1] : 0) : (LB1[1]? 0 : 0);
  
  assign #28 lines2[0] = LB2[0] ? (LB2[1]? 0 : 0) : (LB2[1]? 0 : j[2]);
  assign #28 lines2[1] = LB2[0] ? (LB2[1]? 0 : j[2]) : (LB2[1]? 0 : 0);
  assign #28 lines2[2] = LB2[0] ? (LB2[1]? 0 : 0) : (LB2[1]? j[2] : 0);
  assign #28 lines2[3] = LB2[0] ? (LB2[1]? j[2] : 0) : (LB2[1]? 0 : 0);
  
  assign #28 lines3[0] = LB3[0] ? (LB3[1]? 0 : 0) : (LB3[1]? 0 : j[3]);
  assign #28 lines3[1] = LB3[0] ? (LB3[1]? 0 : j[3]) : (LB3[1]? 0 : 0);
  assign #28 lines3[2] = LB3[0] ? (LB3[1]? 0 : 0) : (LB3[1]? j[3] : 0);
  assign #28 lines3[3] = LB3[0] ? (LB3[1]? j[3] : 0) : (LB3[1]? 0 : 0);
  
endmodule

// Broadcasters Test Bench
module broadcasterTB();
  reg serIn = 1;
  reg [3:0] PB; reg [0:1] LB0 , LB1 , LB2 , LB3;
  wire [0:3] lines0_normal , lines1_normal , lines2_normal , lines3_normal;
  wire [0:3] lines0_assign , lines1_assign , lines2_assign , lines3_assign;
  broadcaster cut_broadcaster(serIn , PB , LB0 , LB1 , LB2 , LB3 , lines0_normal , lines1_normal , lines2_normal , lines3_normal);
  broadcaster_assign cut_assign_broadcaster(serIn , PB , LB0 , LB1 , LB2 , LB3 , lines0_assign , lines1_assign , lines2_assign , lines3_assign);
  initial begin
    #5 PB[0] = 1; PB[1] = 0; PB[2] = 0; PB[3] = 0; LB0[0] = 0 ; LB0[1] = 0;
    #50 LB0[0] = 1;
    #45 LB0[1] = 1 ; LB0[0] = 0;
    #50 LB0[0] = 1;
    
    #45 PB[1] = 1; LB1[0] = 0 ; LB1[1] = 0;
    #50 LB1[0] = 1;
    #55 LB1[1] = 1 ; LB1[0] = 0;
    #50 LB1[0] = 1;
    
    #45 PB[2] = 1; LB2[0] = 0 ; LB2[1] = 0;
    #50 LB2[0] = 1;
    #55 LB2[1] = 1 ; LB2[0] = 0;
    #50 LB2[0] = 1;
    
    #45 PB[3] = 1; LB3[0] = 0 ; LB3[1] = 0;
    #50 LB3[0] = 1;
    #55 LB3[1] = 1 ; LB3[0] = 0;
    #50 LB3[0] = 1;
    
    #45 serIn = 0;
    PB[0] = 1; LB0[0] = 1; LB0[1] = 1;
    PB[1] = 1; LB1[0] = 1; LB1[1] = 1;
    PB[2] = 1; LB2[0] = 1; LB2[1] = 1;
    PB[3] = 1; LB3[0] = 1; LB3[1] = 1;
    
    #50 serIn = 1;
    PB[1] = 0;
    LB0[0] = 1; LB0[1] = 0;
    LB1[0] = 1; LB1[1] = 1;
    LB2[0] = 0; LB2[1] = 1;
    LB3[0] = 0; LB3[1] = 0;
    
    #20;
    repeat(5) #60 serIn = ~serIn;
    
    #70 $stop;
  end
  
endmodule











  
  
  