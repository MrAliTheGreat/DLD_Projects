library verilog;
use verilog.vl_types.all;
entity gt_comparator is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        GT              : out    vl_logic
    );
end gt_comparator;
