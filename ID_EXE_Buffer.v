`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:34 04/02/2011 
// Design Name: 
// Module Name:    ID_EXE_Buffer 
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
module ID_EXE_Buffer(clock,reset,id_bra_pc,id_reg1_val,id_reg2_val,id_rs,id_rt,id_rd,id_lb_const,
							id_se_const,exe_bra_pc,exe_reg1_val,exe_reg2_val,exe_rs,exe_rt,exe_rd,
							exe_lb_const,exe_se_const,id_gt_bra,id_le_bra,id_alu_op,id_reg_dst,id_mem_read,
							id_mem_write,id_memtoreg,id_regwrite,exe_gt_bra,exe_le_bra,exe_alu_op,
							exe_reg_dst,exe_mem_read,exe_mem_write,exe_memtoreg,exe_regwrite,id_opcode,
							exe_opcode,flush
    );

	input clock,reset,flush;
	input [2:0] id_rs,id_rt,id_rd;
	input [15:0] id_bra_pc;
	input [7:0] id_lb_const;
	input [15:0] id_reg1_val,id_reg2_val,id_se_const;
	input id_gt_bra,id_le_bra,id_mem_read,id_mem_write,id_regwrite;
	input [1:0] id_reg_dst,id_memtoreg;
	input [2:0] id_alu_op;
	input [3:0] id_opcode;
	
	output reg [2:0] exe_rs,exe_rt,exe_rd;
	output reg [15:0] exe_bra_pc;
	output reg [7:0] exe_lb_const;
	output reg [15:0] exe_reg1_val,exe_reg2_val,exe_se_const;
	output reg exe_gt_bra,exe_le_bra,exe_mem_read,exe_mem_write,exe_regwrite;
	output reg [1:0] exe_reg_dst,exe_memtoreg;
	output reg [2:0] exe_alu_op;
	output reg [3:0] exe_opcode;
	
	always@(posedge clock) begin
		if(reset)
			exe_rs = 'd0;
		else if(flush)
			exe_rs = 'd0;
		else
			exe_rs = id_rs;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_rt = 'd0;
		else if(flush)
			exe_rt = 'd0;
		else
			exe_rt = id_rt;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_rd = 'd0;
		else if(flush)
			exe_rd = 'd0;
		else
			exe_rd = id_rd;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_bra_pc = 'd0;
		else if(flush)
			exe_bra_pc = 'd0;
		else
			exe_bra_pc = id_bra_pc;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_lb_const = 'd0;
		else if(flush)
			exe_lb_const = 'd0;
		else
			exe_lb_const = id_lb_const;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_reg1_val = 'd0;
		else if(flush)
			exe_reg1_val = 'd0;
		else
			exe_reg1_val = id_reg1_val;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_reg2_val = 'd0;
		else if(flush)
			exe_reg2_val = 'd0;
		else
			exe_reg2_val = id_reg2_val;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_se_const = 'd0;
		else if(flush)
			exe_se_const = 'd0;
		else
			exe_se_const = id_se_const;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_gt_bra = 'd0;
		else if(flush)
			exe_gt_bra = 'd0;
		else
			exe_gt_bra = id_gt_bra;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_le_bra = 'd0;
		else if(flush)
			exe_le_bra = 'd0;
		else
			exe_le_bra = id_le_bra;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_alu_op = 'd0;
		else if(flush)
			exe_alu_op = 'd0;
		else
			exe_alu_op = id_alu_op;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_reg_dst = 'd0;
		else if(flush)
			exe_reg_dst = 'd0;
		else
			exe_reg_dst = id_reg_dst;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_mem_read = 'd0;
		else if(flush)
			exe_mem_read = 'd0;
		else
			exe_mem_read = id_mem_read;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_mem_write = 'd0;
		else if(flush)
			exe_mem_write = 'd0;
		else
			exe_mem_write = id_mem_write;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_memtoreg = 'd0;
		else if(flush)
			exe_memtoreg = 'd0;
		else
			exe_memtoreg = id_memtoreg;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_regwrite = 'd0;
		else if(flush)
			exe_regwrite = 'd0;
		else
			exe_regwrite = id_regwrite;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_opcode = 'd0;
		else if(flush)
			exe_opcode = 'd0;
		else
			exe_opcode = id_opcode;
	end
endmodule
