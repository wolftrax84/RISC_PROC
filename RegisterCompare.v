`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineer: Zach Thornton
// 
// Create Date:    11:38:32 04/08/2011 
// Module Name:    RegisterCompare
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
module RegisterCompare(reg1,reg2,equal);

//Inputs
input [15:0] reg1,reg2;

//Outputs
output reg equal;

always @(reg1,reg2)
begin
	if(reg1 == reg2)
		equal = 1;
	else
		equal = 0;
end//always


endmodule
