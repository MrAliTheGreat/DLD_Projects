`timescale 1ns/1ns
module SReg6 (input en, input serIn, input clk, input rst, output logic [0:3] Q_port , output logic [0:1] Q_line);
  logic [0:5] Q;
  always @ (negedge clk, posedge rst) begin
    #145;
    if (rst) Q <= 5'b00000;
    else
      if (en) Q <= {serIn, Q[0:4]};
  end
  
  assign Q_port = Q[0:3];
  assign Q_line = Q[4:5];
  
endmodule
