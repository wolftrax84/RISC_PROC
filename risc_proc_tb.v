`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:12:20 04/16/2011
// Design Name:   Top_Level
// Module Name:   C:/Users/Sean/Documents/MSU Files/Architecture/RISC_PROC/risc_proc_tb.v
// Project Name:  RISC_PROC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top_Level
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module risc_proc_tb;

	// Inputs
	reg clock;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	Top_Level uut (
		.clock(clock), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1;
		#15;
		reset = 0;
	end
      
	initial 
		forever #10 clock = ~clock;
endmodule

