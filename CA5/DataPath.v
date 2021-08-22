module DataPath(input serIn , input spacer , input clk , input rst , input Sreg1_en , input Sreg2_en , input send_to_smbs , output [5:0] size_chunk , output [15:0] smbs_output);
  wire [3:0] Q_port;
  wire [1:0] Q_line;
  wire [3:0] size_chunk_part_1;
  wire [1:0] size_chunk_part_2;
  SReg6 address_finder_Sreg(Sreg1_en , serIn , clk , rst , Q_port , Q_line);
  SReg6 size_chunk_Sreg(Sreg2_en , serIn , clk , rst , size_chunk_part_1 , size_chunk_part_2);
  assign size_chunk = { size_chunk_part_1 , size_chunk_part_2 };
  smbs cut_smbs(send_to_smbs , Q_port , Q_line , smbs_output);
endmodule
