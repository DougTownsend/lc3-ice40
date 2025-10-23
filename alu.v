
module alu(
    input [15:0] instruction,
    input [15:0] sr1,
    input [15:0] sr2,
    output reg [15:0] alu_out
);

    reg [15:0] operand2;

    always @ (*) begin
        case (instruction[5])
            1'b0: operand2 = sr2;
            1'b1: operand2 = {{11{instruction[4]}}, instruction[4:0]};
        endcase

        case (instruction[15:12])
            4'b0001: alu_out = sr1 + operand2;
            4'b0101: alu_out = sr1 & operand2;
            4'b1001: alu_out = ~sr1;
            default: alu_out = ~sr1;
        endcase
    end

endmodule