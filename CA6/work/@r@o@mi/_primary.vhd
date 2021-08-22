library verilog;
use verilog.vl_types.all;
entity ROMi is
    port(
        pointer         : in     vl_logic;
        Q               : out    vl_logic_vector(7 downto 0)
    );
end ROMi;
