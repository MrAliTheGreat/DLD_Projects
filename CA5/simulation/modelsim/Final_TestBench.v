`timescale 1 ns/ 1 ns
module Final_TestBench();

  reg serIn , spacer , Clock , reset;
  wire [15:0] smbs_output;

  CA5_Quartus cut_circuit(smbs_output , serIn , spacer , Clock , reset);
  initial begin
    serIn = 1'b1;
    spacer = 1'b1;
    reset = 1'b0;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    serIn = 1'b0;
    Clock = 1'b0;
    #200;
    serIn = 1'b1;
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
    serIn = 1'b1;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    Clock = 1'b1;
    #200;
    serIn = 1'b0;
    Clock = 1'b0;
    #200;
    serIn = 1'b0;
    Clock = 1'b1;
    #200;
    serIn = 1'b1;
    Clock = 1'b0;
    #200;
    serIn = 1'b0;
    Clock = 1'b1;
    #200;
    serIn = 1'b1;
    Clock = 1'b0;
    #200;
    serIn = 1'b1;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    serIn = 1'b0;
    Clock = 1'b1;
    #200;
    serIn = 1'b0;
    Clock = 1'b0;
    #200;
    serIn = 1'b0;
    Clock = 1'b1;
    #200;
    Clock = 1'b0;
    #200;
    serIn = 1'b0;
    Clock = 1'b1;
    #200;
    $stop;
  end

  
  
endmodule
