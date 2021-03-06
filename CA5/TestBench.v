`timescale 1ns/1ns
module smbs_TB();
  reg serIn;
  reg [3:0] PB;
  reg [1:0] LB;
  wire [15:0] L;
  smbs cut_broadcaster (serIn, PB, LB, L);
  initial begin
    serIn = 1'b0;
    PB = 4'b0000;
    LB = 2'b00;
    #100;
    serIn = 1'b1;
    PB = 4'b0001;
    LB = 2'b10;
    #100;
    serIn = 1'b1;
    PB = 4'b0011;
    LB = 2'b01;
    #100;
    serIn = 1'b0;
    PB = 4'b1001;
    LB = 2'b11;
    #100;
    serIn = 1'b1;
    PB = 4'b0111;
    LB = 2'b01;
    #100;
    serIn = 1'b1;
    PB = 4'b1101;
    LB = 2'b10;
    #100;
    serIn = 1'b1;
    PB = 4'b1111;
    LB = 2'b11;
    #100;
    serIn = 1'b0;
    PB = 4'b0101;
    LB = 2'b10;
    #100;
    serIn = 1'b1;
    PB = 4'b1110;
    LB = 2'b00;
    #100;
    serIn = 1'b1;
    PB = 4'b0000;
    #100;
    serIn = 1'b1;
    PB = 4'b1100;
    #100;
    serIn = 1'b0;
    PB = 4'b1000;
    LB = 2'b10;
    #100;
    $stop;
  end
endmodule

module sreg6_TB();
  reg clk;
  reg rst;
  reg en;
  reg serIn;
  wire [0:3] Out_port;
  wire [0:1] Out_line;
  SReg6 cut_sreg6(en, serIn, clk, rst, Out_port , Out_line);
  initial begin
    serIn = 1'b1;
    rst = 1'b0;
    en = 1'b1;
    clk = 1'b0;
    #300;
    clk = 1'b1;
    #300;
    clk = 1'b0;
    #300;
    serIn = 1'b1;
    clk = 1'b1;
    #300;
    clk = 1'b0;
    #300;
    clk = 1'b1;
    #300;
    serIn = 1'b0;
    clk = 1'b0;
    #300;
    serIn = 1'b0;
    clk = 1'b1;
    #300;
    clk = 1'b0;
    #300;
    serIn = 1'b1;
    clk = 1'b1;
    #300;
    serIn = 1'b1;
    clk = 1'b0;
    #300;
    serIn = 1'b0;
    clk = 1'b1;
    #300;
    serIn = 1'b1;
    clk = 1'b0;
    #300;
    serIn = 1'b1;
    clk = 1'b1;
    #300;
    serIn = 1'b1;
    clk = 1'b0;
    #300;
    serIn = 1'b0;
    clk = 1'b1;
    #300;
    serIn = 1'b1;
    clk = 1'b0;
    #300;
    serIn = 1'b1;
    clk = 1'b1;
    #300;
    clk = 1'b0;
    #300;
    serIn = 1'b0;
    clk = 1'b1;
    #300;
    serIn = 1'b0;
    clk = 1'b0;
    #300;
    serIn = 1'b0;
    clk = 1'b1;
    #300;
    clk = 1'b0;
    #300;
    serIn = 1'b0;
    clk = 1'b1;
    #300;
    $stop;
  end
endmodule

module controller_TB();
reg in;
reg clk;
reg rst;
reg [5:0] size_chunk;
reg spacer;
wire address_en , chunk_en , send_smbs ;
Controller cut_controller(size_chunk ,spacer ,in, clk ,address_en, chunk_en, send_smbs);
initial begin
  #100 in = 1;
  rst = 0;
  size_chunk = 6'b000101;
  spacer = 1;
  clk = 0;
  #50 clk = 1;
  #50 clk = 0;
  in = 0;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 0;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 0;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 0;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 0;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 0;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 0;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 0;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 0;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 0;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 0;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50 in = 1;
  #50 clk = 1;
  #50 clk = 0;
  #50
  $stop;
  end
endmodule


