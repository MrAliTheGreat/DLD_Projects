library verilog;
use verilog.vl_types.all;
entity DataPath is
    port(
        serIn           : in     vl_logic;
        spacer          : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Sreg1_en        : in     vl_logic;
        Sreg2_en        : in     vl_logic;
        send_to_smbs    : in     vl_logic;
        size_chunk      : out    vl_logic_vector(5 downto 0);
        smbs_output     : out    vl_logic_vector(15 downto 0)
    );
end DataPath;
