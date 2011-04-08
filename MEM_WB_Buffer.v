`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:42 04/02/2011 
// Design Name: 
// Module Name:    MEM_WB_Buffer 
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
module MEM_WB_Buffer(clock,reset,mem_mem_out,mem_alu_out,mem_lb_const,mem_fwd_reg,
							wb_mem_oput,wb_alu_out,wb_lb_const,wb_fwd_reg
    );
	 
	input clock,reset;
	input [2:0] mem_fwd_reg;
	input [7:0] mem_lb_const;
	input [15:0] mem_mem_out,mem_alu_out;
	
	output [2:0] wb_fwd_reg;
	output [7:0] wb_lb_const;
	output [15:0] wb_mem_out,wb_alu_out;

	always@(posedge clock) begin
		if(reset)
			wb_fwd_reg = 'd0;
		else
			wb_fwd_reg = mem_fwd_reg;
	end
	
	always@(posedge clock) begin
		if(reset)
			wb_lb_const = 'd0;
		else
			wb_lb_const = mem_lb_const;
	end
	
	always@(posedge clock) begin
		if(reset)
			wb_mem_out = 'd0;
		else
			wb_mem_out = mem_mem_out;
	end
	
	always@(posedge clock) begin
		if(reset)
			wb_alu_out = 'd0;
		else
			wb_alu_out = mem_alu_out;
	end
	
	
endmodule
