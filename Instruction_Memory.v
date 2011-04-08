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

	input [5:0] address;
	
	output [15:0] out;
	
	always@(*)begin
		case(address)
			
			0:	out = 16'hB040;
			1:	out = 16'hB210;
			2:	out = 16'hC250;
			3:	out = 16'hB210;
			4:	out = 16'hB40F;
			5:	out = 16'hB6F0;
			6:	out = 16'hBC10;
			7:	out = 16'hBE05;
			8:	out = 16'h4F59;
			9:	out = 16'h7FC1;
			10:	out = 16'h5D00;
			11:	out = 16'hBA01;
			12:	out = 16'hCB48;
			13:	out = 16'h4953;
			14:	out = 16'hD006;
			15:	out = 16'hF20B;
			16:	out = 16'hBAFF;
			17:	out = 16'h6D40;
			18:	out = 16'h1017;
			19:	out = 16'hC484;
			20:	out = 16'hF69C;
			21:	out = 16'hBAFF;
			22:	out = 16'h6D40;
			23:	out = 16'h7D82;
			24:	out = 16'h1008;
			25:	out = 16'h0000;
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
