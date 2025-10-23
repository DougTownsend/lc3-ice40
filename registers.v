
module register_file_1bank(
    input [15:0] w_data,
    input [2:0] w_addr,
    input [2:0] r_addr,
    input w_en,
    input r_en,
    input clk,
    output reg [15:0] r_data
);
    reg [15:0] registers [0:7];

    always @ (posedge clk) begin
        if(w_en) begin
            registers[w_addr] <= w_data;
        end
        if(r_en) begin
            r_data <= registers[r_addr];
        end
    end

endmodule

module register_file(
    input [15:0] w_data,
    input [2:0] dst,
    input [2:0] sr1,
    input [2:0] sr2,
    input w_en,
    input clk,
    output [15:0] sr1_data,
    output [15:0] sr2_data
);
    register_file_1bank bank1(.w_data(w_data), .w_addr(dst), .w_en(w_en), .clk(clk), .r_addr(sr1), .r_data(sr1_data), .r_en(1'b1));
    register_file_1bank bank2(.w_data(w_data), .w_addr(dst), .w_en(w_en), .clk(clk), .r_addr(sr2), .r_data(sr2_data), .r_en(1'b1));
endmodule