`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:36 04/02/2011 
// Design Name: 
// Module Name:    Fwd_Reg_Mux 
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
module Fwd_Reg_Mux(exe_rt,exe_rd,fwd_reg_src,exe_fwd_reg
    );

	input fwd_reg_src;
	input [2:0] exe_rt,exe_rd;
	
	output [2:0] exe_fwd_reg;
	
	always@(*) begin
		case(fwd_reg_src)
			0: exe_fwd_reg = exe_rt;
			1: exe_fwd_reg = exe_rd;
		endcase
	end
	
endmodule
