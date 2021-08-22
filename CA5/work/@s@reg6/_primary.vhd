library verilog;
use verilog.vl_types.all;
entity SReg6 is
    port(
        en              : in     vl_logic;
        serIn           : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Q_port          : out    vl_logic_vector(3 downto 0);
        Q_line          : out    vl_logic_vector(1 downto 0)
    );
end SReg6;
