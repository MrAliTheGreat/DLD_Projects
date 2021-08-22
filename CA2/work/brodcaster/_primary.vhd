library verilog;
use verilog.vl_types.all;
entity brodcaster is
    port(
        serIn           : in     vl_logic;
        PB              : in     vl_logic_vector(0 to 3);
        LB              : in     vl_logic_vector(0 to 1);
        lines0          : out    vl_logic_vector(0 to 3);
        lines1          : out    vl_logic_vector(0 to 3);
        lines2          : out    vl_logic_vector(0 to 3);
        lines3          : out    vl_logic_vector(0 to 3)
    );
end brodcaster;
