`timescale 1ns/1ns
module output_wrapper(input signed [16:0] output_sin, input clk, rst, ready , getdata , gnt , output reg req , sin_ready , output reg[7:0] outputbus);
reg ld_out , en_out_1 , en_out_2;
wire signed [16:0] out_sin;

Register output_reg(output_sin , ld_out, clk, rst, out_sin);

always@(out_sin , en_out_1 , en_out_2)begin
  if(en_out_1) begin
      outputbus = out_sin[7:0];
  end
    
  if(en_out_2) begin
      outputbus = out_sin[15:8];
  end
end

reg [2:0] ns, ps;
always @(ps, getdata, gnt, ready)begin
  ns = 3'b0;
  {ld_out , en_out_1 , en_out_2 , req , sin_ready} = 5'b0;
  case(ps)
    3'b000: begin
      ns = ready ? 3'b001 : 3'b000;
    end
    3'b001:begin
      ns = 3'b010;
      ld_out = 1'b1;
    end
    3'b010: begin
      ns = getdata ? 3'b011 : 3'b010;
      sin_ready = 1'b1;
    end
    3'b011:begin
      ns = gnt ? 3'b100 : 3'b011;
      req = 1'b1;
    end
    3'b100:begin
      ns = 3'b101;
      req = 1'b1;
      en_out_1 = 1;
    end
    3'b101:begin
      ns = 3'b000;
      req = 1'b1;
      en_out_2 = 1'b1;
    end
 endcase
 end
 always @(posedge clk, posedge rst)begin
   if(rst) ps <= 3'b000;
   else ps <=ns;
   end
 endmodule
 
module output_wrapper_TB();
  reg clk, rst, ready ,getdata , gnt;
  wire [7:0] bus;
  reg signed [16:0] output_sin;
  wire req, sin_ready;
  output_wrapper cut_input_wrapper(output_sin , clk, rst, ready ,getdata ,gnt , req , sin_ready, bus);
  initial begin
    forever begin
    clk=0;
    #150
    clk=1;
    #150
    clk=0;
    end
  end
  initial begin
    rst = 1'b1;
    #10 rst = 1'b0;
    ready = 1'b0;
    #200 ready = 1'b1;
    #200 output_sin = 16'b0100010001000100;
    #200 getdata = 1'b0;
    #200 getdata = 1'b1;
    #200 gnt = 1'b0;
    #200 gnt = 1'b1;
    #1000 output_sin = 16'b0111110101110100;
    #200 ready = 1'b0;
    #200 ready = 1'b1;
    #200 getdata = 1'b0;
    #200 getdata = 1'b1;
    #200 gnt = 1'b0;
    #200 gnt = 1'b1;
    #4000 $stop;
  end
endmodule
