module Controller(input clk , input rst , input start , input [7:0] y , input signed [16:0] exp , output reg ready , ldx , ldy , ldterm , ldexp , init_term , init_exp , minus1_en , x_en , i_en , iplus_en , output reg [3:0] counteri , output reg [3:0] counteriplus);
  reg [3:0] ps , ns;
  
  always @(ps , start) begin
    ns = 4'b0000;
    {ready , ldx , ldy , ldterm , ldexp , init_term , init_exp , minus1_en , x_en , i_en , iplus_en} = 11'b0;
    case(ps)
      4'b0000: begin
        {ready , ldx , ldy , ldterm , ldexp , init_term , init_exp , minus1_en , x_en , i_en , iplus_en} = 11'b0;
        counteri = 4'b0010;
        counteriplus = 4'b0011;
        ready = 1;
        ns = start ? 4'b0001 : 4'b0000;
      end
    
      4'b0001: ns = start ? 4'b0001 : 4'b0010;
    
      4'b0010: begin
        ldx = 1;
        ldy = 1;
        init_term = 1;
        init_exp = 1;
        ns = 4'b0011;
      end
    
      4'b0011: begin
        ldexp = 0;
        init_term = 0;
        init_exp = 0;
        x_en = 1;
        ldterm = 1;
        ns = 4'b0100;
      end
    
      4'b0100: begin
        x_en = 1;
        ldterm = 1;
        ns = 4'b0101;
      end
    
      4'b0101: begin
        x_en = 0;
        i_en = 1;
        ldterm = 1;
        ns = 4'b0110;
      end
    
      4'b0110: begin
        i_en = 0;
        iplus_en = 1;
        ldterm = 1;
        ns = 4'b0111;
      end
    
      4'b0111: begin
        iplus_en = 0;
        minus1_en = 1;
        ldterm = 1;
        ns = 4'b1000;
      end

      4'b1000: begin
        ldterm = 0;
        ldexp = 1;
        counteri = counteri + 2;
        counteriplus = counteri + 1;
        if(exp >= y) begin
            ns = 4'b0011;
          end
        else begin
            ns = 4'b0000;
          end
      end
      default: begin
        {ready , ldx , ldy , ldterm , ldexp , init_term , init_exp , minus1_en , x_en , i_en , iplus_en} = 11'b0;
        counteri = 4'b0010;
        counteriplus = 4'b0011;
        ns = 4'b0000;
      end
    endcase
  end
  
  always @(posedge clk , posedge rst) begin
    if(rst) ps <= 4'b0000;
    else ps <= ns;  
  end

endmodule
