`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:27 03/29/2011 
// Design Name: 
// Module Name:    Instruction_Memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Instruction_Memory(address,out
    );

	input [15:0] address;
	
	output reg [15:0] out;
	
	always@(*)begin
		case(address)
			
			0:	out = 16'h0;
			1:	out = 16'h0;
			2:	out = 16'h0;
			3:	out = 16'h0;
			4:	out = 16'h0;
			5:	out = 16'h0;
			6:	out = 16'h0;
			7:	out = 16'h0;
			8:	out = 16'h0;
			9:	out = 16'h0;
			10:	out = 16'h0;
			11:	out = 16'h0;
			12:	out = 16'h0;
			13:	out = 16'h0;
			14:	out = 16'h0;
			15:	out = 16'h0;
			16:	out = 16'h0;
			17:	out = 16'h0;
			18:	out = 16'h0;
			19:	out = 16'h0;
			20:	out = 16'h0;
			21:	out = 16'h0;
			22:	out = 16'h0;
			23:	out = 16'h0;
			24:	out = 16'h0;
			25:	out = 16'h0;
			26:	out = 16'h0;
			27:	out = 16'h0;
			28:	out = 16'h0;
			29:	out = 16'h0;
			30:	out = 16'h0;
			31:	out = 16'h0;
			32:	out = 16'h0;
			33:	out = 16'h0;
			34:	out = 16'h0;
			35:	out = 16'h0;
			36:	out = 16'h0;
			37:	out = 16'h0;
			38:	out = 16'h0;
			39:	out = 16'h0;
			40:	out = 16'h0;
			41:	out = 16'h0;
			42:	out = 16'h0;
			43:	out = 16'h0;
			44:	out = 16'h0;
			45:	out = 16'h0;
			46:	out = 16'h0;
			47:	out = 16'h0;
			48:	out = 16'h0;
			49:	out = 16'h0;
			50:	out = 16'h0;
			51:	out = 16'h0;
			52:	out = 16'h0;
			53:	out = 16'h0;
			54:	out = 16'h0;
			55:	out = 16'h0;
			56:	out = 16'h0;
			57:	out = 16'h0;
			58:	out = 16'h0;
			60:	out = 16'h0;
			61:	out = 16'h0;
			62:	out = 16'h0;
			63:	out = 16'h0;
			default:	out = 16'h0;
		endcase
	end
			
endmodule
