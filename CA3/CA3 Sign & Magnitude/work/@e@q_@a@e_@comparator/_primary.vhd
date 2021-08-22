library verilog;
use verilog.vl_types.all;
entity EQ_AE_Comparator is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        eq              : in     vl_logic;
        ae              : in     vl_logic;
        \EQ\            : out    vl_logic;
        \AE\            : out    vl_logic
    );
end EQ_AE_Comparator;
