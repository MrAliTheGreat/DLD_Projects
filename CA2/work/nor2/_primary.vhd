library verilog;
use verilog.vl_types.all;
entity nor2 is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        w               : out    vl_logic
    );
end nor2;
