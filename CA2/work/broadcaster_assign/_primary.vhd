library verilog;
use verilog.vl_types.all;
entity broadcaster_assign is
    port(
        serIn           : in     vl_logic;
        PB              : in     vl_logic_vector(3 downto 0);
        LB0             : in     vl_logic_vector(0 to 1);
        LB1             : in     vl_logic_vector(0 to 1);
        LB2             : in     vl_logic_vector(0 to 1);
        LB3             : in     vl_logic_vector(0 to 1);
        lines0          : out    vl_logic_vector(0 to 3);
        lines1          : out    vl_logic_vector(0 to 3);
        lines2          : out    vl_logic_vector(0 to 3);
        lines3          : out    vl_logic_vector(0 to 3)
    );
end broadcaster_assign;
