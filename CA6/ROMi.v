`timescale 1ns/1ns
module ROMi(input pointer , output reg [7:0] Q);
  always@(pointer) begin
    case(pointer)
      1: Q = 1_0000000;
      2: Q = 0_1000000;
      3: Q = 0_0101010;
      4: Q = 0_0100000;
      5: Q = 0_0011001;
      6: Q = 0_0010101;
      7: Q = 0_0010010;
      8: Q = 0_0010000;
      9: Q = 0_0001110;
      10: Q = 0_0001100;
      11: Q = 0_0001011;
      12: Q = 0_0001010;
      13: Q = 0_0001001;
      14: Q = 0_0001001;
      15: Q = 0_0001000;
      16: Q = 0_0001000;
      default Q = 0_1000000;
    endcase
  end
  
endmodule
