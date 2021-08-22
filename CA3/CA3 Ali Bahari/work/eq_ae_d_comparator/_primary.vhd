library verilog;
use verilog.vl_types.all;
entity eq_ae_d_comparator is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        d               : out    vl_logic_vector(3 downto 0);
        EQ              : out    vl_logic;
        AE              : out    vl_logic
    );
end eq_ae_d_comparator;
