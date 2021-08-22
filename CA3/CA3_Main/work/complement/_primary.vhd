library verilog;
use verilog.vl_types.all;
entity complement is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        comp_A          : out    vl_logic_vector(15 downto 0)
    );
end complement;
