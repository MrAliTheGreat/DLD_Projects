library verilog;
use verilog.vl_types.all;
entity comparator_behavioural is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        EQ              : out    vl_logic;
        AE              : out    vl_logic;
        GT              : out    vl_logic;
        d               : out    vl_logic_vector(3 downto 0)
    );
end comparator_behavioural;
