`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:34 04/02/2011 
// Design Name: 
// Module Name:    ALU_Reg1_Mux 
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
module ALU_Reg1_Mux(sel,reg1_val,mem_forward,wb_forward,alu_val1
    );

	input [1:0] sel;
	input [15:0] reg1_val,mem_forward,wb_forward;
	
	output reg [15:0] alu_val1;
	
	always@(*) begin
		case(sel)
			0:	alu_val1 = reg1_val;
			1: alu_val1 = mem_forward;
			2: alu_val1 = wb_forward;
		endcase
	end

endmodule
