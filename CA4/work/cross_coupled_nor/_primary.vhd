library verilog;
use verilog.vl_types.all;
entity cross_coupled_nor is
    port(
        set             : in     vl_logic;
        reset           : in     vl_logic;
        rst             : in     vl_logic;
        Q               : out    vl_logic
    );
end cross_coupled_nor;
