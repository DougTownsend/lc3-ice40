
module memory(
    input [15:0] addr,
    input [15:0] w_data,
    input w_en,
    input clk,
    output reg [15:0] r_data
);

    reg [3:0] w_mask [0:3];
    wire [15:0] data_out [0:3];

    always @ (*) begin
        case (addr[15:14])
            2'd0: begin
                w_mask[0] = 4'b1111;
                w_mask[1] = 4'b0000;
                w_mask[2] = 4'b0000;
                w_mask[3] = 4'b0000;
                r_data = data_out[0];
            end
            2'd1: begin
                w_mask[0] = 4'b0000;
                w_mask[1] = 4'b1111;
                w_mask[2] = 4'b0000;
                w_mask[3] = 4'b0000;
                r_data = data_out[1];
            end
            2'd2: begin
                w_mask[0] = 4'b0000;
                w_mask[1] = 4'b0000;
                w_mask[2] = 4'b1111;
                w_mask[3] = 4'b0000;
                r_data = data_out[2];
            end
            2'd3: begin
                w_mask[0] = 4'b0000;
                w_mask[1] = 4'b0000;
                w_mask[2] = 4'b0000;
                w_mask[3] = 4'b1111;
                r_data = data_out[3];
            end
        endcase
    end

    SB_SPRAM256KA spram0(
        .ADDRESS(addr[13:0]),
        .MASKWREN(w_mask[0]),
        .WREN(w_en),
        .CHIPSELECT(1'b1),
        .CLOCK(clk),
        .STANDBY(1'b0),
        .SLEEP(1'b0),
        .POWEROFF(1'b1),
        .DATAOUT(data_out[0])
    );
    SB_SPRAM256KA spram1(
        .ADDRESS(addr[13:0]),
        .MASKWREN(w_mask[1]),
        .WREN(w_en),
        .CHIPSELECT(1'b1),
        .CLOCK(clk),
        .STANDBY(1'b0),
        .SLEEP(1'b0),
        .POWEROFF(1'b1),
        .DATAOUT(data_out[1])
    );
    SB_SPRAM256KA spram2(
        .ADDRESS(addr[13:0]),
        .MASKWREN(w_mask[2]),
        .WREN(w_en),
        .CHIPSELECT(1'b1),
        .CLOCK(clk),
        .STANDBY(1'b0),
        .SLEEP(1'b0),
        .POWEROFF(1'b1),
        .DATAOUT(data_out[2])
    );
    SB_SPRAM256KA spram3(
        .ADDRESS(addr[13:0]),
        .MASKWREN(w_mask[3]),
        .WREN(w_en),
        .CHIPSELECT(1'b1),
        .CLOCK(clk),
        .STANDBY(1'b0),
        .SLEEP(1'b0),
        .POWEROFF(1'b1),
        .DATAOUT(data_out[3])
    );

endmodule