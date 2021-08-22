library verilog;
use verilog.vl_types.all;
entity magnitude_diff_component is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        change1_in      : in     vl_logic;
        change2_in      : in     vl_logic;
        change1_out     : out    vl_logic;
        change2_out     : out    vl_logic;
        w               : out    vl_logic
    );
end magnitude_diff_component;
