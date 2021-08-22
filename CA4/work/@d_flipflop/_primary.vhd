library verilog;
use verilog.vl_types.all;
entity D_flipflop is
    port(
        D               : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        Q               : out    vl_logic
    );
end D_flipflop;
