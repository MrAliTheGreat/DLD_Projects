library verilog;
use verilog.vl_types.all;
entity complement_assign is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        complement_A    : out    vl_logic_vector(15 downto 0)
    );
end complement_assign;
