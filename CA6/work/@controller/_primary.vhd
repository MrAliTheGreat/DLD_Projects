library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        y               : in     vl_logic_vector(7 downto 0);
        exp             : in     vl_logic_vector(16 downto 0);
        ready           : out    vl_logic;
        ldx             : out    vl_logic;
        ldy             : out    vl_logic;
        ldterm          : out    vl_logic;
        ldexp           : out    vl_logic;
        init_term       : out    vl_logic;
        init_exp        : out    vl_logic;
        minus1_en       : out    vl_logic;
        x_en            : out    vl_logic;
        i_en            : out    vl_logic;
        iplus_en        : out    vl_logic;
        counteri        : out    vl_logic_vector(3 downto 0);
        counteriplus    : out    vl_logic_vector(3 downto 0)
    );
end Controller;
