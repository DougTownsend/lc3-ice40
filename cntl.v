
module control_unit(
    input [15:0] instruction,
    input n, z, p,
    input rst,
    input clk,
    output reg marmux_sel,
    output reg [1:0] pc_sel,
    output reg addr1_sel,
    output reg [1:0] addr2_sel,
    output reg [1:0] bus_sel,
    output reg mem_w_en,
    output reg reg_w_en,
    output reg ld_pc,
    output reg ld_ir,
    output reg ld_cc,
    output reg ld_mdr,
    output reg ld_mar
);


endmodule