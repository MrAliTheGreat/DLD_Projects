library verilog;
use verilog.vl_types.all;
entity demultiplexer_2select_assign is
    port(
        serIn           : in     vl_logic;
        LB              : in     vl_logic_vector(0 to 1);
        L               : out    vl_logic_vector(0 to 3)
    );
end demultiplexer_2select_assign;
