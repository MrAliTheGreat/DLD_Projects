library verilog;
use verilog.vl_types.all;
entity Register16 is
    port(
        serIn           : in     vl_logic_vector(15 downto 0);
        en              : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Q               : out    vl_logic_vector(15 downto 0)
    );
end Register16;
