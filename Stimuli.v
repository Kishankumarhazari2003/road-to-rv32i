`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module Stimuli;

reg  signed [31:0] A;
reg  signed [31:0] B;
reg  [2:0] ALU_Sel;

wire signed [31:0] ALU_Out;
wire Zero;
wire Negative;
wire Carry;
wire Overflow;

// Instantiate updated ALU
ALU_32bit uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .Zero(Zero),
    .Negative(Negative),
    .Carry(Carry),
    .Overflow(Overflow)
);

initial begin

    $display("Time\tA\tB\tSel\tResult\tZero\tNeg\tCarry\tOverflow");
    $monitor("%0t\t%d\t%d\t%b\t%d\t%b\t%b\t%b\t%b",
              $time, A, B, ALU_Sel, ALU_Out,
              Zero, Negative, Carry, Overflow);

    // ===============================
    // Test Case 1: Basic Operations
    // ===============================
    A = 7;  
    B = 1;

    ALU_Sel = 3'b000; #10;  // NOT
    ALU_Sel = 3'b001; #10;  // OR
    ALU_Sel = 3'b010; #10;  // AND
    ALU_Sel = 3'b011; #10;  // NEGATE
    ALU_Sel = 3'b100; #10;  // ADD
    ALU_Sel = 3'b101; #10;  // SUB
    ALU_Sel = 3'b110; #10;  // MUL
    ALU_Sel = 3'b111; #10;  // XOR

    // ===============================
    // Test Case 2: Zero Detection
    // ===============================
    A = 5;
    B = -5;
    ALU_Sel = 3'b100; #10;  // ADD → result = 0

    // ===============================
    // Test Case 3: Negative Result
    // ===============================
    A = 3;
    B = 10;
    ALU_Sel = 3'b101; #10;  // SUB → negative

    // ===============================
    // Test Case 4: Overflow Case
    // ===============================
    A = 32'sd2147483647;  // Max positive
    B = 1;
    ALU_Sel = 3'b100; #10;  // ADD → overflow

    // ===============================
    // Test Case 5: Large Multiplication
    // ===============================
    A = 1000;
    B = 2000;
    ALU_Sel = 3'b110; #10;

    $stop;

end

endmodule





















//endmodule
