library verilog;
use verilog.vl_types.all;
entity encoder is
    port(
        num             : in     vl_logic_vector(15 downto 0);
        coded_num       : out    vl_logic_vector(3 downto 0)
    );
end encoder;
