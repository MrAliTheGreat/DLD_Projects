`timescale 1ns/1ns
module Register(input signed [16:0] serIn , input en, input clk, input rst, output reg signed [16:0] Q);
  always @ (posedge clk, posedge rst) begin
    //#145;
    if (rst) Q <= 17'b0;
    else
      if (en) Q <= serIn;
  end
endmodule