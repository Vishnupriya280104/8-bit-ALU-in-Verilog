`timescale 1ns/1ps
// alu_tb.v - Testbench for 8-bit ALU

module alu_tb;

    reg  [7:0] a, b;
    reg  [2:0] op;
    wire [7:0] y;
    wire       carry;
    wire       zero;

    alu dut (
        .a(a),
        .b(b),
        .op(op),
        .y(y),
        .carry(carry),
        .zero(zero)
    );

    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        a = 8'd10; b = 8'd5;  op = 3'b000; #10; // ADD
        a = 8'd10; b = 8'd3;  op = 3'b001; #10; // SUB
        a = 8'b10101010; b = 8'b11001100; op = 3'b010; #10; // AND
        op = 3'b011; #10; // OR
        op = 3'b100; #10; // XOR
        a = 8'b00001111; op = 3'b101; #10; // NOT
        a = 8'b00000011; op = 3'b110; #10; // SHL
        op = 3'b111; #10; // SHR
        a = 8'd5; b = 8'd5;  op = 3'b001; #10; // ZERO FLAG TEST

        $finish;
    end

    initial begin
        $display(" time | op a       b       | y       carry zero");
        $monitor("%4t | %b  %b %b | %b   %b     %b",
                 $time, op, a, b, y, carry, zero);
    end

endmodule
