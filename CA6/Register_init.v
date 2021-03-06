`timescale 1ns/1ns
module Register_init(input signed [16:0] serIn , input [16:0] init_value , input en, input clk, input rst , input init , output reg signed [16:0] Q);
  always @ (posedge clk, posedge rst) begin
    //#145;
    if(rst) Q <= 17'b0;
    else if(en) Q <= serIn;
    else if(init) Q <= init_value;
  end
endmodule
