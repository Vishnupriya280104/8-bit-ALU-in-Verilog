`timescale 1ns/1ps
// alu.v - 8-bit ALU in Verilog (Warning-Free)

module alu (
    input  [7:0] a,
    input  [7:0] b,
    input  [2:0] op,
    output reg [7:0] y,
    output reg       carry,
    output           zero
);

    reg [8:0] tmp; // for add/sub with carry

    always @(*) begin
        y     = 8'b0;
        carry = 1'b0;
        tmp   = 9'b0;

        case (op)
            3'b000: begin // ADD
                tmp   = a + b;
                y     = tmp[7:0];
                carry = tmp[8];
            end

            3'b001: begin // SUB
                tmp   = {1'b0, a} - {1'b0, b};
                y     = tmp[7:0];
                carry = tmp[8];
            end

            3'b010: y = a & b;        // AND
            3'b011: y = a | b;        // OR
            3'b100: y = a ^ b;        // XOR
            3'b101: y = ~a;           // NOT
            3'b110: y = a << 1;       // SHIFT LEFT
            3'b111: y = a >> 1;       // SHIFT RIGHT

            default: begin
                y     = 8'b0;
                carry = 1'b0;
            end
        endcase
    end

    assign zero = (y == 8'b0);

endmodule
