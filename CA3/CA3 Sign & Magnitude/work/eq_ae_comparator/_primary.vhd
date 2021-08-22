library verilog;
use verilog.vl_types.all;
entity eq_ae_comparator is
    port(
        A               : in     vl_logic_vector(1 downto 0);
        B               : in     vl_logic_vector(1 downto 0);
        eq              : in     vl_logic;
        ae              : in     vl_logic;
        \EQ\            : out    vl_logic;
        \AE\            : out    vl_logic
    );
end eq_ae_comparator;
