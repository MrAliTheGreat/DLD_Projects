library verilog;
use verilog.vl_types.all;
entity CA5_Quartus is
    port(
        smbs_output     : out    vl_logic_vector(15 downto 0);
        serIn           : in     vl_logic;
        spacer          : in     vl_logic;
        Clock           : in     vl_logic;
        reset           : in     vl_logic
    );
end CA5_Quartus;
