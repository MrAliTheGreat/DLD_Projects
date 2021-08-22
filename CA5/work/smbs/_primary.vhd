library verilog;
use verilog.vl_types.all;
entity smbs is
    port(
        serIn           : in     vl_logic;
        P_select        : in     vl_logic_vector(3 downto 0);
        L_select        : in     vl_logic_vector(1 downto 0);
        L_output        : out    vl_logic_vector(15 downto 0)
    );
end smbs;
