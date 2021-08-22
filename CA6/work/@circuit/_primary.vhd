library verilog;
use verilog.vl_types.all;
entity Circuit is
    port(
        Clock           : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        x               : in     vl_logic_vector(16 downto 0);
        y               : in     vl_logic_vector(7 downto 0);
        ready           : out    vl_logic;
        Rout            : out    vl_logic_vector(16 downto 0)
    );
end Circuit;
