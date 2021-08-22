library verilog;
use verilog.vl_types.all;
entity equal_comp is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        eq              : in     vl_logic;
        \EQ\            : out    vl_logic
    );
end equal_comp;
