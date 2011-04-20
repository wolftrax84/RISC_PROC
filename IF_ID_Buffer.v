`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:57:41 03/29/2011 
// Design Name: 
// Module Name:    IF_ID_Buffer 
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
module IF_ID_Buffer(clock,reset,if_id_write,if_flush,instruction_in,instr_addr_in,instruction_out,
							instr_addr_out
    );

	input clock,reset;
	input if_id_write;
	input if_flush;
	input [15:0] instr_addr_in;
	input [15:0] instruction_in;
	
	output reg [15:0] instr_addr_out;
	output reg [15:0] instruction_out;
	
	always@(posedge clock) begin
		if(reset)
			instruction_out <= 'd0;
		else if(if_id_write == 'd0)
			instruction_out <= instruction_out;
		else if(if_flush)
			instruction_out <= 'd0;
		else
			instruction_out <= instruction_in;
	end
	
	always@(posedge clock) begin
		if(reset)
			instr_addr_out <= 'd0;
		else if(if_id_write == 'd0)
			instr_addr_out <= instr_addr_out;
		else if(if_flush)
			instr_addr_out <= 'd0;
		else
			instr_addr_out <= instr_addr_in;
	end
endmodule
