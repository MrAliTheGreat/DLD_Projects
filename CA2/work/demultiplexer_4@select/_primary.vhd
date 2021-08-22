library verilog;
use verilog.vl_types.all;
entity demultiplexer_4Select is
    port(
        serIn           : in     vl_logic;
        PB              : in     vl_logic_vector(3 downto 0);
        P               : out    vl_logic_vector(3 downto 0)
    );
end demultiplexer_4Select;
