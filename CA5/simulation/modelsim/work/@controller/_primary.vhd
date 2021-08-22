library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        size_chunk      : in     vl_logic_vector(0 to 5);
        spacer          : in     vl_logic;
        serIn           : in     vl_logic;
        clk             : in     vl_logic;
        address_Sreg_en : out    vl_logic;
        size_chunk_Sreg_en: out    vl_logic;
        send_to_SMBS    : out    vl_logic
    );
end Controller;
