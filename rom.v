
module rom(
    input [7:0] addr,
    input clk,
    output reg [15:0] r_data
);

    reg [15:0] mem [0:255];

    initial begin
        $readmemh("bootloader.hex", mem, 0, 4);
    end

    always @ (posedge clk) begin
        r_data <= mem[addr];
    end

endmodule