library verilog;
use verilog.vl_types.all;
entity gt_comp_component is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        eq              : in     vl_logic;
        gt              : in     vl_logic;
        \EQ\            : out    vl_logic;
        \GT\            : out    vl_logic
    );
end gt_comp_component;
