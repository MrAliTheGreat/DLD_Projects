module Controller(input [0:5] size_chunk , input spacer , input serIn , input clk , output reg address_Sreg_en , output reg size_chunk_Sreg_en, output reg send_to_SMBS);
  integer counter;
  reg [2:0] ns;
  always @(posedge clk) begin
    case(ns)
      3'b000: begin
        if(serIn == 0) begin 
          ns = 3'b001;
        end
      end
      3'b001: begin
        counter = counter + 1;
        if(counter == 6) begin
          ns = 3'b010;
          size_chunk_Sreg_en = 0;
          address_Sreg_en = 1;
          counter = 0;
        end
      end
      3'b010: begin
        counter = counter + 1;
        if(counter == 6) begin
          ns = 3'b011;
          size_chunk_Sreg_en = 1;
          address_Sreg_en = 0;
          counter = size_chunk;
        end
      end
      3'b011: begin
        counter = counter - 1;
        send_to_SMBS = serIn;
        if(counter == 0) begin
          ns = 3'b100;
        end
      end
      3'b100: begin
        if(spacer == 0) ns = 3'b011;
        else ns = 3'b000;
      end
      default:
        begin
          ns = 3'b000;
          counter = 0;
        end
    endcase
  end
endmodule