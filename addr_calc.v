
module address_calc(
    input [15:0] instruction,
    input [15:0] pc,
    input [15:0] sr1,
    input addr1_sel,
    input [1:0] addr2_sel,
    input marmux_sel,
    output reg [15:0] addr,
    output reg [15:0] marmux_out
);

    reg [15:0] addr1;
    reg [15:0] addr2;
    reg [15:0] addr_sum;

    always @ (*) begin
        case (addr1_sel)
            1'b0: addr1 = sr1;
            1'b1: addr1 = pc;
        endcase

        case (addr2_sel)
            2'd0: addr2 = {{5{instruction[10]}}, instruction[10:0]};
            2'd1: addr2 = {{7{instruction[8]}}, instruction[8:0]};
            2'd2: addr2 = {{10{instruction[5]}}, instruction[5:0]};
            2'd3: addr2 = 16'd0;
        endcase

        addr_sum = addr1 + addr2;
        addr = addr_sum;

        case (marmux_sel)
            1'b0: marmux_out = addr_sum;
            1'b1: begin
                marmux_out[7:0] = instruction[7:0];
                marmux_out[15:8] = 8'b0;
            end
        endcase
    end

endmodule