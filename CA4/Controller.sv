module controller (input clk, input I, output logic O, output logic smbs_enable, output logic port_enable);
  logic [3:0]ns;
  reg counter;
  always@(negedge clk) begin
    case (ns)
      default:
        begin
          ns = 2'b0;
          smbs_enable = 0;
          port_enable = 0;
        end
      2'b00: begin
        if(I)
          ns <= 2'b00;
        else
          ns <= 2'b01;
      end
      2'b01: begin
          port_enable = 1;
          counter = counter + 1;
          if(counter == 6) begin
            ns = 2'b10;
            counter = 0;
          end
      end      
      2'b10: begin
          port_enable = 0;
          smbs_enable = 1;
          counter = counter + 1;
          if(counter == 5) begin
            ns = 2'b11;
            counter = 0;
          end
      end
      2'b11: begin
          port_enable = 0;
          smbs_enable = 0;
          if(I)
            ns = 2'b00;
          else
            ns = 2'b10;
      end   
    endcase
      O <= I;
  end
endmodule


