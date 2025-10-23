
module nzp(
    input [15:0] bus,
    input ld_cc,
    input clk,
    output reg n, z, p
);

    reg next_n, next_p, next_z;

    always @ (posedge clk) begin
        if (ld_cc) begin
            n <= next_n;
            p <= next_p;
            z <= next_z;
        end
    end

    always @ (*) begin
        if(bus == 0) begin
            next_n = 0;
            next_z = 1;
            next_p = 0;
        end else if(bus > 0) begin
            next_n = 0;
            next_z = 0;
            next_p = 1;
        end else begin
            next_n = 1;
            next_z = 0;
            next_p = 0;
        end
    end

endmodule