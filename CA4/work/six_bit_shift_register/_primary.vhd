library verilog;
use verilog.vl_types.all;
entity six_bit_shift_register is
    port(
        serIn           : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        Q               : out    vl_logic_vector(0 to 5)
    );
end six_bit_shift_register;
