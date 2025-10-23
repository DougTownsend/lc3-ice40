
module instruction_reg(
    input [15:0] bus,
    input ld_ir,
    input clk,
    output reg [15:0] instruction
);

    always @ (posedge clk) begin
        if(ld_ir) instruction <= bus;
    end

endmodule