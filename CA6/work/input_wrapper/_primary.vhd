library verilog;
use verilog.vl_types.all;
entity input_wrapper is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ready           : in     vl_logic;
        datain          : in     vl_logic;
        \bus\           : in     vl_logic_vector(7 downto 0);
        data_accept     : out    vl_logic;
        x               : out    vl_logic_vector(15 downto 0);
        y               : out    vl_logic_vector(7 downto 0);
        start           : out    vl_logic
    );
end input_wrapper;
