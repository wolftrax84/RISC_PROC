`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineer: Sean Owens
// 
// Create Date:    10:11:04 03/29/2011 
// Module Name:    Reg_16 
// Project Name: 	 RISC_PROC
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
module Reg_16(clock,reset,d,q,en
    );

	input clock,reset,en;
	
	input [15:0] d;
	
	output reg [15:0] q;
	
	always@(posedge clock) begin
		if(reset)
			q <= 0;
		else if(en)
			q <= d;
		else
			q <= q;
	end
	
endmodule
