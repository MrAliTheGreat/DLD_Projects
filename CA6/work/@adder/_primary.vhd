library verilog;
use verilog.vl_types.all;
entity Adder is
    port(
        term_out        : in     vl_logic_vector(16 downto 0);
        exp_out         : in     vl_logic_vector(16 downto 0);
        add_out         : out    vl_logic_vector(16 downto 0)
    );
end Adder;
