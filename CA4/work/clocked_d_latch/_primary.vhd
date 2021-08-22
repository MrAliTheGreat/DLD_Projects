library verilog;
use verilog.vl_types.all;
entity clocked_d_latch is
    port(
        D               : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Q               : out    vl_logic
    );
end clocked_d_latch;
