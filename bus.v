
module bus_controller(
    input [1:0] select,
    input [15:0] marmux_out,
    input [15:0] pc_out,
    input [15:0] alu_out,
    input [15:0] mdr_out,
    output reg [15:0] bus
);
    always @ (*) begin
        case (select)
            2'd0: bus = marmux_out;
            2'd1: bus = pc_out;
            2'd2: bus = alu_out;
            2'd3: bus = mdr_out;
        endcase
    end
endmodule