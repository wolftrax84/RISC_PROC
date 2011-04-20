`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:46 04/02/2011 
// Design Name: 
// Module Name:    EXE_MEM_Buffer 
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
module EXE_MEM_Buffer(clock,reset,exe_alu_out,exe_reg2_val,exe_fwd_reg,exe_lb_const,
								mem_alu_out,mem_reg2_val,mem_fwd_reg,mem_lb_const,exe_mem_read,
								exe_mem_write,exe_memtoreg,exe_regwrite,mem_mem_read,mem_mem_write,
								mem_memtoreg,mem_regwrite,exe_opcode,mem_opcode,exe_mem_write_data,
								mem_mem_write_data
    );
	 
	input clock,reset;
	input exe_regwrite,exe_mem_read,exe_mem_write;
	input [1:0] exe_memtoreg;
	input [2:0] exe_fwd_reg;
	input [7:0] exe_lb_const;
	input [15:0] exe_alu_out,exe_reg2_val;
	input [3:0] exe_opcode;
	input [15:0] exe_mem_write_data;
	 
	output reg mem_regwrite,mem_mem_read,mem_mem_write;
	output reg [1:0] mem_memtoreg;
	output reg [2:0] mem_fwd_reg;
	output reg [7:0] mem_lb_const;
	output reg [15:0] mem_alu_out,mem_reg2_val;
	output reg [3:0] mem_opcode;
	output reg [15:0] mem_mem_write_data;
	 
	always@(posedge clock) begin
		if(reset)
			mem_alu_out = 'd0;
		else
			mem_alu_out = exe_alu_out;
	end
	
	always@(posedge clock) begin
		if(reset)
			mem_reg2_val = 'd0;
		else
			mem_reg2_val = exe_reg2_val;
	end
	
	always@(posedge clock) begin
		if(reset)
			mem_fwd_reg = 'd0;
		else
			mem_fwd_reg = exe_fwd_reg;
	end
	
	always@(posedge clock) begin
		if(reset)
			mem_lb_const = 'd0;
		else
			mem_lb_const = exe_lb_const;
	end
	
	always@(posedge clock) begin
		if(reset)
			mem_mem_read = 'd0;
		else
			mem_mem_read = exe_mem_read;
	end
	
	always@(posedge clock) begin
		if(reset)
			mem_memtoreg = 'd0;
		else
			mem_memtoreg = exe_memtoreg;
	end
	
	always@(posedge clock) begin
		if(reset)
			mem_mem_write = 'd0;
		else
			mem_mem_write = exe_mem_write;
	end
	
	always@(posedge clock) begin
		if(reset)
			mem_regwrite = 'd0;
		else
			mem_regwrite = exe_regwrite;
	end

	always@(posedge clock) begin
		if(reset)
			mem_opcode = 'd0;
		else
			mem_opcode = exe_opcode;
	end
	
	always@(posedge clock) begin
		if(reset)
			mem_mem_write_data = 'd0;
		else
			mem_mem_write_data = exe_mem_write_data;
	end
	
endmodule
