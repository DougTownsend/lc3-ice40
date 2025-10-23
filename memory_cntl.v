
module memory_cntl(
    input [15:0] bus,
    input w_mar,
    input w_mdr,
    input w_mem,
    input rw, //0 for read 1 for write
    input clk,
    output [15:0] mdr_out 
);

    reg [15:0] mar, mdr;
    wire [15:0] mdr_mem_r;
    reg [15:0] mdr_mem_w;
    wire [15:0] mdr_rom_r;


    memory mem(.addr(mar), .r_data(mdr_mem_r), .w_data(mdr_mem_w), .w_en(w_mem), .clk(clk));
    rom bootloader(.addr(mar[7:0]), .r_data(mdr_rom_r), .clk(clk));

    always @ (posedge clk) begin
        if(w_mar) mar <= bus;
        if(w_mdr) begin
            if(rw) begin
                mdr <= bus;
            end else begin
                if(mar >= 16'h100) //TODO: move the bootloader away from this address range to not interfere with TRAP vectors
                    mdr <= mdr_mem_r;
                else
                    mdr <= mdr_rom_r;
            end
        end
    end

endmodule