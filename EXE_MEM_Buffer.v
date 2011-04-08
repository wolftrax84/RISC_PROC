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
								mem_alu_out,mem_reg2_val,mem_fwd_reg,mem_lb_const
    );
	 
	input clock,reset;
	input [2:0] exe_fwd_reg;
	input [15:0] exe_alu_out,exe_reg2_val,exe_lb_const;
	 
	output [2:0] mem_fwd_reg;
	output [15:0] mem_alu_out,mem_reg2_val,mem_lb_const;
	 
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

	
endmodule
