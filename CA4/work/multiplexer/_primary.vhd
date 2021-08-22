library verilog;
use verilog.vl_types.all;
entity multiplexer is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        \select\        : in     vl_logic;
        Q               : out    vl_logic
    );
end multiplexer;
