library verilog;
use verilog.vl_types.all;
entity other_eq_ae_comparator is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        eq              : in     vl_logic;
        ae              : in     vl_logic;
        \EQ\            : out    vl_logic;
        \AE\            : out    vl_logic
    );
end other_eq_ae_comparator;
