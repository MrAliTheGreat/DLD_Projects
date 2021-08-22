`timescale 1ns/1ns
module SReg6(input en, input serIn, input clk, input rst, output [3:0] Q_port , output [1:0] Q_line);
  reg [5:0] Q;
  always @ (negedge clk, posedge rst) begin
    #145;
    if (rst) Q <= 5'b00000;
    else
      if (en) Q <= {serIn, Q[4:0]};
  end
  
  assign Q_port = Q[3:0];
  assign Q_line = Q[5:4];
  
endmodule