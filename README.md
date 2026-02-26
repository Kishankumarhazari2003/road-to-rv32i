

This project provides a detailed RTL design of a 32-bit Arithmetic Logic Unit (ALU) written in Verilog, implemented and tested using AMD Vivado. The design is primarily synthesized for the Artix-7 FPGA family, but it can be adapted for other FPGA families as well.



(ALU_32bit.v) – Contains the main Verilog code for the 32-bit ALU. This is where all arithmetic and logic operations are implemented.  
(Stimuli.v) – Testbench file used to verify the ALU functionality. Different input values are applied here to check the correctness of operations.  
(rtl_design.png) – containing the RTL schematic results generated in Vivado.  
(waveform.png) – Contains PNG image of the simulation waveforms showing the ALU output for various operations. 





The 32-bit ALU supports the following operations:  
Arithmetic Operations: Addition, Subtraction, Multiplication, Negative  
Logic Operations: NOT, AND, XOR  
Status Flags: Carry, Zero, Overflow  



Usage :  
Open the project in Vivado.  
Add ALU_32bit.v and Stimuli.v to your project.  
Run simulation to verify ALU functionality.  
Synthesize for your target FPGA board.  
Check rtl_design.png and waveform.png for results.  


In the future, I plan to take this project to Level 2, where I will integrate this basic 32-bit ALU design into a 32-bit single-cycle RISC-V processor. I will update this README with more details and explanations as the project progresses.

For any questions or help regarding this project, feel free to reach out to me. 

Kishan kumar hazari – Electronics & Communication Engineering student focused on FPGA and Verilog design.
