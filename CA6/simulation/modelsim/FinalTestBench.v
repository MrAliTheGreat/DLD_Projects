`timescale 1 ps/ 1 ps

module FinalTestBench();

  reg Clock , reset , start;
  reg signed [16:0] x;
  reg [7:0] y;
  
  wire ready;
  wire signed [16:0] Rout;

  CA6_Quartus cut_circuit(ready , Clock , reset , start , x , y , Rout);
  initial begin
    x = 17'b000000000_00000100;
    y = 8'b0_0001000;
    start = 1'b0;
    reset = 1'b1;
    Clock = 1'b0;
    #100;
    start = 1'b1;
    reset = 1'b0;
    Clock = 1'b1;
    #100;
    start = 1'b0;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;

    $stop;
  end 
  
  
  
endmodule
