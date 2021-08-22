library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk             : in     vl_logic;
        I               : in     vl_logic;
        O               : out    vl_logic;
        smbs_enable     : out    vl_logic;
        port_enable     : out    vl_logic
    );
end controller;
