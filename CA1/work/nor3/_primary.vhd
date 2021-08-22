library verilog;
use verilog.vl_types.all;
entity nor3 is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        w               : out    vl_logic
    );
end nor3;
