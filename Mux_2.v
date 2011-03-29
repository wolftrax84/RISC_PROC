`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineer: Sean Owens
// 
// Create Date:    09:56:07 03/29/2011
// Module Name:    Mux_2 
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
module Mux_2(control,in_1,in_2,out
    );
	
	input control;
	input [15:0] in_1,in_2;
	
	output reg [15:0] out;
	
	always@(*) begin
		if(control == 'd0)
			out <= in_1;
		else if(control == 'd1)
			out <= in_2;
		else
			out <= 'd0;
	end

endmodule
