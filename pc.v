
module program_counter(
    input [15:0] bus,
    input [15:0] addr,
    input [1:0] pc_sel,
    input ld_pc,
    input clk,
    input rst,
    output reg pc_out
);

    reg [15:0] next_pc;

    always @ (posedge clk or posedge rst) begin
        if (rst) pc_out = 16'b0;
        else if (ld_pc) pc_out <= next_pc;
    end

    always @ (*) begin
        case (pc_sel)
            2'd0: next_pc = pc_out + 16'd1;
            2'd1: next_pc = addr;
            2'd2: next_pc = bus;
            default: next_pc = pc_out + 16'd1;
        endcase
    end

endmodule