library verilog;
use verilog.vl_types.all;
entity incrementer_assign_component is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        Ci              : out    vl_logic;
        S               : out    vl_logic
    );
end incrementer_assign_component;
