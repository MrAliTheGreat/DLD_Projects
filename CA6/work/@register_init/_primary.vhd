library verilog;
use verilog.vl_types.all;
entity Register_init is
    port(
        serIn           : in     vl_logic_vector(16 downto 0);
        init_value      : in     vl_logic_vector(16 downto 0);
        en              : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        init            : in     vl_logic;
        Q               : out    vl_logic_vector(16 downto 0)
    );
end Register_init;
