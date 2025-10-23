
module main(
    input clk,
    input [15:0] addr,
    input w_en,
    output [15:0] data
);
    //wire [15:0] w_data;
    register_file registers(.clk(clk), .w_en(w_en), .sr1(addr[2:0]), .sr2(addr[5:3]), .dst(addr[8:6]), .w_data(data), .sr1_data(data[7:0]), .sr2_data(data[15:8]));
    //memory mem(.clk(clk), .w_en(w_en), .addr(addr), .r_data(data), .w_data(w_data));
endmodule