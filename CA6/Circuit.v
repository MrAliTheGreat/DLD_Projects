module Circuit(input Clock , reset , start , input signed [16:0] x , input [7:0] y , output ready , output signed[16:0] Rout);
  wire signed [16:0] exp;
  wire [3:0] counteri , counteriplus;
  wire ldx , ldy , ldterm , ldexp , init_term , init_exp , minus1_en , x_en , i_en , iplus_en;
  Controller cut_controller(Clock , reset , start , y , exp , ready , ldx , ldy , ldterm , ldexp , init_term , init_exp , minus1_en , x_en , i_en , iplus_en , counteri , counteriplus);
  DataPath cut_datapath(Clock , reset , start , ldx , ldy , ldterm , ldexp , init_term , init_exp , minus1_en , x_en , i_en , iplus_en , x , y , counteri , counteriplus , exp);
  
  assign Rout = exp;
endmodule