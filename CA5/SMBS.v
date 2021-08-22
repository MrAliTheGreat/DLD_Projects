`timescale 1ns/1ns
module smbs(input serIn, input [3:0] P_select, input [1:0] L_select, output reg [15:0] L_output);
  integer i = 0;
  always @ (P_select, L_select) begin
    #48;
    L_output = 16'b0000000000000000;
    for (i = 0; i < 4; i = i + 1) begin
      if (P_select[i] == 1) begin
        case(L_select)
          2'b00: L_output[4*i + 0] = serIn;
          2'b01: L_output[4*i + 1] = serIn;
          2'b10: L_output[4*i + 2] = serIn;
          2'b11: L_output[4*i + 3] = serIn;
          default: 
            begin 
              L_output[4*i] = 1'b0;
              L_output[4*i + 1] = 1'b0;
              L_output[4*i + 2] = 1'b0;
              L_output[4*i + 3] = 1'b0;
            end
        endcase
      end
    end
  end
endmodule