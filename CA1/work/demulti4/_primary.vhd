library verilog;
use verilog.vl_types.all;
entity demulti4 is
    port(
        d               : in     vl_logic;
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        s2              : in     vl_logic;
        y0              : out    vl_logic;
        y1              : out    vl_logic;
        y2              : out    vl_logic;
        y3              : out    vl_logic
    );
end demulti4;
