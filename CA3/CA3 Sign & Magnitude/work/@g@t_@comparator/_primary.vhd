library verilog;
use verilog.vl_types.all;
entity GT_Comparator is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        eq              : in     vl_logic;
        gt              : in     vl_logic;
        \GT\            : out    vl_logic
    );
end GT_Comparator;
