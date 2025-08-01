module char_rom #(
    parameter DATA_WIDTH = 35,     // Width of ROM data (35 bits for each character)
    parameter ADDR_WIDTH = 7,      // Address width
    parameter ADDR_MIN = 32,
    parameter ADDR_MAX = 127
)(
    input wire [ADDR_WIDTH-1:0] address,
    output wire [DATA_WIDTH-1:0] data
);

reg [DATA_WIDTH-1:0] mem [0:ADDR_MAX-ADDR_MIN];

initial begin
    $readmemb("font_ledstrip.bin", mem);  // load char bitmaps from file

end
    

assign data = |address[ADDR_WIDTH-1:5] ? mem[address-ADDR_MIN] : '1;

endmodule
