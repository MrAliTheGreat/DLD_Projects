library verilog;
use verilog.vl_types.all;
entity demulti2_gate is
    port(
        d               : in     vl_logic;
        s               : in     vl_logic;
        y0              : out    vl_logic;
        y1              : out    vl_logic
    );
end demulti2_gate;
