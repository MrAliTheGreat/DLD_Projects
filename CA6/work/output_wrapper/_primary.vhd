library verilog;
use verilog.vl_types.all;
entity output_wrapper is
    port(
        output_sin      : in     vl_logic_vector(16 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ready           : in     vl_logic;
        getdata         : in     vl_logic;
        gnt             : in     vl_logic;
        req             : out    vl_logic;
        sin_ready       : out    vl_logic;
        outputbus       : out    vl_logic_vector(7 downto 0)
    );
end output_wrapper;
