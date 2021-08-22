`timescale 1ns/1ns
module Register8(input [7:0] serIn , input en, input clk, input rst, output reg [7:0] Q);
  always @ (posedge clk, posedge rst) begin
    //#145;
    if (rst) Q <= 8'b0;
    else
      if (en) Q <= serIn;
  end
endmodule