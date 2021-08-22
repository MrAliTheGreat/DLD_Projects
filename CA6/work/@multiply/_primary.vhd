library verilog;
use verilog.vl_types.all;
entity Multiply is
    port(
        minus1_en       : in     vl_logic;
        x_en            : in     vl_logic;
        i_en            : in     vl_logic;
        iplus_en        : in     vl_logic;
        term_out        : in     vl_logic_vector(16 downto 0);
        x_out           : in     vl_logic_vector(16 downto 0);
        rom_out_i       : in     vl_logic_vector(7 downto 0);
        rom_out_iplus   : in     vl_logic_vector(7 downto 0);
        mult_out        : out    vl_logic_vector(16 downto 0)
    );
end Multiply;
