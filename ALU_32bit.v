`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// ============================================================
// 32-bit Signed ALU with Status Flags
// ============================================================
// ALU_Sel Encoding:
// 000 : NOT (A)
// 001 : OR
// 010 : AND
// 011 : NEGATE (Two's Complement)
// 100 : ADD
// 101 : SUB
// 110 : MUL
// 111 : XOR
// ============================================================

module ALU_32bit(
    input  signed [31:0] A,
    input  signed [31:0] B,
    input  [2:0] ALU_Sel,
    output reg signed [31:0] ALU_Out,
    output Zero,
    output Negative,
    output Carry,
    output Overflow
    );

    reg [32:0] temp;   // For carry detection

    always @(*) begin
        temp = 33'b0;  // default

        case (ALU_Sel)

            3'b000: begin
                ALU_Out = ~A;
            end

            3'b001: begin
                ALU_Out = A | B;
            end

            3'b010: begin
                ALU_Out = A & B;
            end

            3'b011: begin
                ALU_Out = -A;
            end

            3'b100: begin   // ADD
                temp = A + B;
                ALU_Out = temp[31:0];
            end

            3'b101: begin   // SUB
                temp = A - B;
                ALU_Out = temp[31:0];
            end

            3'b110: begin   // MUL
                ALU_Out = A * B;
            end

            3'b111: begin   // XOR
                ALU_Out = A ^ B;
            end

            default: begin
                ALU_Out = 32'b0;
            end

        endcase
    end

    // ============================
    // Status Flags
    // ============================

    assign Zero     = (ALU_Out == 32'b0);
    assign Negative = ALU_Out[31];
    assign Carry    = temp[32];  // valid for ADD/SUB
    assign Overflow = (ALU_Sel == 3'b100) &&
                      ((A[31] == B[31]) && (ALU_Out[31] != A[31])) ||
                      (ALU_Sel == 3'b101) &&
                      ((A[31] != B[31]) && (ALU_Out[31] != A[31]));

endmodule
