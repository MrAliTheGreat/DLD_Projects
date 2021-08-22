library verilog;
use verilog.vl_types.all;
entity magnitude_diff is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        d               : out    vl_logic_vector(3 downto 0)
    );
end magnitude_diff;
