`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineer: Sean Owens
// 
// Create Date:    10:05:16 03/29/2011 
// Module Name:    Adder_2 
// Project Name:   RISC_PROC
// Tool versions:  Xilinx ISE 12.4
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Adder_2(in_1,in_2,out
    );

	input [15:0] in_1,in_2;
	
	output [15:0] out;
	
	assign out = in_1 + in_2;

endmodule
