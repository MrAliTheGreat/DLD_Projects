`timescale 1ns/1ns

// Part 1 & 2

// Switch level inverter
module invclass(input a ,output w);
  supply1 vdd;
  supply0 gnd;
  pmos #(5,6,7) p1(w , vdd , a);
  nmos #(3,4,5) n1(w , gnd , a);
endmodule

// Switch level 2-input nor
module nor2(input a , b , output w);
  supply1 vdd;
  supply0 gnd;
  wire j;
  pmos#(5,6,7) p1(j , vdd , a),
               p2(w , j , b);
  nmos#(3,4,5) n1(w , gnd , a),
               n2(w , gnd , b);
endmodule

// Switch level 3-input nor
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

// Switch level inverter _ 2-input Nor _ 3-input Nor Test Bench
module inv_nor2_3TB();
  reg aa = 0 , bb = 0 , cc = 0;
  wire ww_inv , ww_nor2 , ww_nor3;
  invclass cut_inv(aa , ww_inv);
  nor2 cut_nor2(aa , bb , ww_nor2);
  nor3 cut_nor3(aa , bb , cc , ww_nor3);
  initial begin
    #20 aa = 1;
    bb = 1; cc = 1;
    #15 aa = 0;
    bb = 0 ; cc = 0;
    #20 aa = 1;
    cc = 1;
    #30 $stop;
  end
endmodule










// Part 3 & 4

// Switch level 1 to 2 demultiplexer using built NOR and Not from part 1
module demulti2(input d , s , output y0 , y1);
  wire j , k;
  invclass cut_invd(d , j);
  invclass cut_invs(s , k);
  nor2 cut_nor1(j , s , y0);
  nor2 cut_nor2(j , k , y1);
endmodule

// Switch level 1 to 2 demultiplexer Test Bench
module demulti2TB();
  reg dd = 0 , ss = 0;
  wire yy0 , yy1;
  
  demulti2 cut_demulti2(dd , ss , yy0 , yy1);
  initial begin
    #30 dd = 1;
    #25 ss = 1;
    #20 dd = 0;
    #25 ss = 0;
    #30 $stop;
  end
endmodule










// Part 5 & 6

// Switch level 1 to 4 demultiplexer
module demulti4(input d , s0 , s1 , s2 , output y0 , y1 , y2 , y3);
  wire j , k;
  demulti2 cut_demulti2_1(d , s0 , j , k);
  demulti2 cut_demulti2_2(j , s1 , y0 , y1);
  demulti2 cut_demulti2_3(k , s2 , y2 , y3);
endmodule

// Switch level 1 to 4 demultiplexer Test Bench
module demulti4TB();
  reg dd = 0 , ss0 = 0 , ss1 = 0 , ss2 = 0;
  wire yy0 , yy1 , yy2 , yy3;
  demulti4 cut_demulti4(dd , ss0 , ss1 , ss2 , yy0 , yy1 , yy2 , yy3);
  initial begin
    #30 dd = 1;
    #20 ss1 = 1;
    #20 ss0 = 1;
    #22 ss2 = 1;
    #20 dd = 0;
    #22 ss2 = 0;
    #30 ss0 = 0;
    #20 ss1 = 0;
    #40 $stop;
  end
endmodule










// Part 7 & 8

// Gate level 1 to 2 demultiplexer using NOR and NOT of the program (Not from part 1)
module demulti2_gate(input d , s , output y0 , y1);
  wire j , k;
  not #(5 , 7) cut_not1(j , d);
  not #(5 , 7) cut_not2(k , s);
  nor #(10 , 14) cut_nor1(y0 , j , s);
  nor #(10 , 14) cut_nor2(y1 , j , k);
endmodule

// Gate level & Switch level 1 to 2 demultiplexer Test Bench
module demulti2_gateTB();
  // Gate Level Circuit
  reg dd = 0 , ss = 0;
  wire yy0 , yy1;
  demulti2_gate cut_demulti2_gate(dd , ss , yy0 , yy1);
  
  // Switch Level Circuit
  reg dd_sl = 0 , ss_sl = 0;
  wire yy0_sl , yy1_sl;
  demulti2 cut_demulti2(dd_sl , ss_sl , yy0_sl , yy1_sl);
  
  initial begin
    #5 dd = 1; dd_sl = 1;
    #25 ss = 1; ss_sl = 1;
    #20 dd = 0; dd_sl = 0;
    #25 ss = 0; ss_sl = 0;
    #30 $stop;
  end
    
endmodule










// Part 9 & 10

// 1 to 4 demultiplexer using 3 built 1 to 2 gate level demultiplexers from part 7 (hierarchical structure)
module demulti4_gate(input d , s0 , s1 , s2 , output y0 , y1 , y2 , y3);
  wire j , k;
  demulti2_gate cut_demulti2_gate1(d , s0 , j , k);
  demulti2_gate cut_demulti2_gate2(j , s1 , y0 , y1);
  demulti2_gate cut_demulti2_gate3(k , s2 , y2 , y3);
endmodule

// 1 to 4 demultiplexer hierarchical structure & Switch level 1 to 4 demultiplexer Test Bench
module demulti4_gateTB();
  // Gate Level Circuit
  reg dd = 0 , ss0 = 0 , ss1 = 0 , ss2 = 0;
  wire yy0 , yy1 , yy2 , yy3;
  demulti4_gate cut_demulti4_gate(dd , ss0 , ss1 , ss2 , yy0 , yy1 , yy2 , yy3);
  
  // Switch Level Circuit
  reg dd_sl = 0 , ss0_sl = 0 , ss1_sl = 0 , ss2_sl = 0;
  wire yy0_sl , yy1_sl , yy2_sl , yy3_sl;
  demulti4 cut_demulti4(dd_sl , ss0_sl , ss1_sl , ss2_sl , yy0_sl , yy1_sl , yy2_sl , yy3_sl);
  
  initial begin
    #5 dd = 1; dd_sl = 1;
    #20 ss1 = 1; ss1_sl = 1;
    #20 ss0 = 1; ss0_sl = 1;
    #22 ss2 = 1; ss2_sl = 1;
    #20 dd = 0; dd_sl = 0;
    #22 ss2 = 0; ss2_sl = 0;
    #30 ss0 = 0; ss0_sl = 0;
    #20 ss1 = 0; ss1_sl = 0;
    #40 $stop;
  end
  
endmodule










// Part 11 & 12

// 1 to 4 demultiplexer flat structure using built 3-input NOR from part part 1
module demulti4_gate_flat(input d , s0 , s1 , output y0 , y1 , y2 , y3);
  wire j , k , t;
  not #(5 , 7) cut_not1(j , d);
  not #(5 , 7) cut_not2(t , s1);
  not #(5 , 7) cut_not3(k , s0);
  nor3 cut_nor3_1(j , s0 , s1 , y0); // The 3-input nor that we made was at switch level
  nor3 cut_nor3_2(j , s0 , t , y1);
  nor3 cut_nor3_3(j , k , s1 , y2);
  nor3 cut_nor3_4(j , k , t , y3);
  
endmodule

// All 1 to 4 demultiplexers Test Bench
module demulti4_gate_allTB();
  // 1 to 4 Demultiplexer _ Gate level _ Flat structure  (Part 11)
  reg dd_flat = 0 , ss0_flat = 0 , ss1_flat = 0 ;
  wire yy0_flat , yy1_flat , yy2_flat , yy3_flat;
  demulti4_gate_flat cut_demulti4_gate_flat(dd_flat , ss0_flat , ss1_flat , yy0_flat , yy1_flat , yy2_flat , yy3_flat);
  
  // 1 to 4 Demultiplexer _ Gate level _ Hierarchical structure (Part 9)
  reg dd_hier = 0 , ss0_hier = 0 , ss1_hier = 0  , ss2_hier = 0;
  wire yy0_hier , yy1_hier , yy2_hier , yy3_hier;
  demulti4_gate cut_demulti4_gate(dd_hier , ss0_hier , ss1_hier , ss2_hier , yy0_hier , yy1_hier , yy2_hier , yy3_hier);
  
  // 1 to 4 Demultiplexer _ Switch level _ Hierarchical structure (Part 5)
  reg dd_switch = 0 , ss0_switch = 0 , ss1_switch = 0  , ss2_switch = 0;
  wire yy0_switch , yy1_switch , yy2_switch , yy3_switch;
  demulti4 cut_demulti4(dd_switch , ss0_switch , ss1_switch , ss2_switch , yy0_switch , yy1_switch , yy2_switch , yy3_switch);
  
  initial begin
    #5 dd_flat = 1 ; dd_hier = 1 ; dd_switch = 1; // y0 = 1
    #25 ss1_flat = 1 ; ss1_hier = 1 ; ss1_switch = 1; // y1 = 1
    #25 ss0_flat = 1 ; ss1_flat = 0 ; ss0_hier = 1; ss0_switch = 1; // y2 = 1
    #30 ss0_flat = 1 ; ss1_flat = 1 ; ss2_hier = 1; ss2_switch = 1; // y3 = 1
    #25 dd_flat = 0 ; dd_hier = 0 ; dd_switch = 0; // y3 = 0
    #30 ss0_flat = 0 ; ss2_hier = 0 ; ss2_switch = 0; // y2 = 0
    #35 ss0_flat = 1 ; ss1_flat = 0 ; ss0_hier = 0; ss0_switch = 0; // y1 = 0
    #25 ss1_flat = 1 ; ss1_hier = 0 ; ss1_switch = 0; // y0 = 0
    #40 $stop;
  end
  
endmodule




