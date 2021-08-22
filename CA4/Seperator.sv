`timescale 1ns/1ns
module seperator (input [5:0]Q, output [3:0]PB, output [1:0]LB);
  assign PB = Q[3:0];
  assign LB = Q[5:4];
endmodule