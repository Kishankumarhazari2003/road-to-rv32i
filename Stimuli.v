`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2026 06:55:11 PM
// Design Name: 
// Module Name: Stimuli
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//module Stimuli( );

//reg[31:0]A;
//reg[31:0]B;
//reg[2:0]ALU_Sel;
//wire [31:0]ALU_Out;

//// instantiate the alu
//ALU_32bit uut(
//               .A(A),
//               .B(B),
//               .ALU_Sel(ALU_Sel),
//               .ALU_Out(ALU_Out)
//             );
            
// initial begin 
 
//     // test case where i have took A =7 , B = 1
//     A = 32'h00000007;  // basically each bit is of 4 bit so , 4+4+4+4+4+4+4+4 = 32 or say 8 x 4 = 32
//     B = 32'h00000001;
     
//     // not operation ALU_Sel = 000
//     ALU_Sel = 3'b000;
//    #10;
//     //OR operation (ALU_Sel = 001)
//     ALU_Sel = 3'b001;
//    #10;
//    // and operation (ALU_Sel = 010)
//      ALU_Sel = 3'b010;                        
//    #10;
//    ALU_Sel = 3'b011;                        
//    #10;
    
//    ALU_Sel = 3'b100;                        
//    #10;
    
//    ALU_Sel = 3'b101;                        
//    #10;
//    ALU_Sel = 3'b110;                        
//    #10;
//    ALU_Sel = 3'b111;                        
//    #10;
    
    
    
//    // my remaning test cases
//    $stop;
//    end

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
