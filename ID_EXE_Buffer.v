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
							id_se_const,exe_bra,pc,exe_reg1_val,exe_reg2_val,exe_rs,exe_rt,exe_rd,
							exe_lb_const,exe_se_const
    );

	input clock,reset;
	input [2:0] id_rs,id_rt,id_rd;
	input [5:0] id_bra_pc;
	input [7:0] id_lb_const;
	input [15:0] id_reg1_val,id_reg2_val,id_se_const;
	
	output reg [2:0] exe_rs,exe_rt,exe_rd;
	output reg [5:0] exe_bra_pc;
	output reg [7:0] exe_lb_const;
	output reg [15:0] exe_reg1_val,exe_reg2_val,exe_se_const;
	
	always@(posedge clock) begin
		if(reset)
			exe_rs = 'd0;
		else
			exe_rs = id_rs;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_rt = 'd0;
		else
			exe_rt = id_rt;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_rd = 'd0;
		else
			exe_rd = id_rd;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_bra_pc = 'd0;
		else
			exe_bra_pc = id_bra_pc;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_lb_const = 'd0;
		else
			exe_lb_const = id_lb_const;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_reg1_val = 'd0;
		else
			exe_reg1_val = id_reg1_val;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_reg2_val = 'd0;
		else
			exe_reg2_val = id_reg2_val;
	end
	
	always@(posedge clock) begin
		if(reset)
			exe_se_const = 'd0;
		else
			exe_se_const = id_se_const;
	end
endmodule
