`timescale 1ns/1ns
module input_wrapper(input clk, rst, ready , datain , input [7:0] bus , output reg data_accept , output reg [15:0] x, output reg[7:0] y, output reg start);

reg ld_x1 , ld_x2 , ld_y;
wire [7:0] x1_out , x2_out , y_out;

Register8 x1_reg(bus , ld_x1 , clk , rst , x1_out);
Register8 x2_reg(bus , ld_x2 , clk , rst , x2_out);
Register8 y_reg(bus , ld_y , clk , rst , y_out);

always@(x2_out, x1_out)begin
  x = {x2_out, x1_out};
end
always@(y_out)begin
  y = y_out;
end

  reg [2:0] ns, ps;
  always @(ps, ready, datain)begin
    ns = 3'b0;
    {ld_x1 , ld_x2 , ld_y , data_accept , start} = 5'b0;
    case(ps)
      3'b000: begin
        ns = datain ? 3'b001 : 3'b000;
      end
      3'b001: begin
        ns = 3'b010;
        ld_x1 = 1'b1;
      end
      3'b010: begin
        ns = 3'b011;
        ld_x2 = 1'b1;
      end
      3'b011:begin
        ns = 3'b100;
        ld_y = 1'b1;
      end
      3'b100:begin
        ns = datain ? 3'b100 : 3'b101;
        data_accept = 1;
      end
      3'b101:begin
        ns = ready ? 3'b101 : 3'b000;
        start = 1;
      end
   endcase
 end
 always@(posedge clk, posedge rst)begin
   if(rst) ps <= 3'b000;
   else ps <= ns;
 end
endmodule

module input_wrapper_TB();
  reg clk, rst, ready ,datain;
  reg [7:0] bus;
  wire [15:0] x;
  wire [7:0] y;
  wire start, data_accept;
  input_wrapper cut_input_wrapper(clk, rst, ready ,datain ,bus , data_accept , x, y, start);
  initial begin
    forever begin
    clk=0;
    #100
    clk=1;
    #100
    clk=0;
    end
  end
  initial begin
    rst = 1'b1;
    #10 rst = 1'b0;
    datain = 1'b0;
    #200 datain = 1'b1;
    #200 bus = 8'b01000100;
    #200 datain = 1'b0;
    #200 datain = 1'b1;
    #200 datain = 1'b0;
    #200 bus = 8'b00110000;
    #200 datain = 1'b0;
    #200 datain = 1'b1;
    #200 datain = 1'b0;
    #200 bus = 8'b00000001;
    #200 datain = 1'b0;
    #200 datain = 1'b1;
    #200 datain = 1'b0;
    #200 ready = 1'b1;
    #200 ready = 1'b0;
    #200 ready = 1'b1;
    #500 ready = 1'b0;
    #4000 ready = 1'b1;
    #4000 $stop;
  end
endmodule


