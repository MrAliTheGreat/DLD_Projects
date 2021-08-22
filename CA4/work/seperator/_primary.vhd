library verilog;
use verilog.vl_types.all;
entity seperator is
    port(
        Q               : in     vl_logic_vector(5 downto 0);
        PB              : out    vl_logic_vector(3 downto 0);
        LB              : out    vl_logic_vector(1 downto 0)
    );
end seperator;
