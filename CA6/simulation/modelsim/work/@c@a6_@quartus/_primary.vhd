library verilog;
use verilog.vl_types.all;
entity CA6_Quartus is
    port(
        ready           : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        x               : in     vl_logic_vector(16 downto 0);
        y               : in     vl_logic_vector(7 downto 0);
        Rout            : out    vl_logic_vector(16 downto 0)
    );
end CA6_Quartus;
