library verilog;
use verilog.vl_types.all;
entity DataPath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        ldx             : in     vl_logic;
        ldy             : in     vl_logic;
        ldterm          : in     vl_logic;
        ldexp           : in     vl_logic;
        init_term       : in     vl_logic;
        init_exp        : in     vl_logic;
        minus1_en       : in     vl_logic;
        x_en            : in     vl_logic;
        i_en            : in     vl_logic;
        iplus_en        : in     vl_logic;
        x               : in     vl_logic_vector(16 downto 0);
        y               : in     vl_logic_vector(7 downto 0);
        counteri        : in     vl_logic_vector(3 downto 0);
        counteriplus    : in     vl_logic_vector(3 downto 0);
        Rout            : out    vl_logic_vector(16 downto 0)
    );
end DataPath;
