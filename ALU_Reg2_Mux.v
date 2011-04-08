`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:33 04/02/2011 
// Design Name: 
// Module Name:    ALU_Reg2_Mux 
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
module ALU_Reg2_Mux(sel,reg2_val,mem_forward,wb_forward,se_const,alu_val2
    );

	input [1:0] sel;
	input [15:0] reg2_val,mem_forward,wb_forward,se_const;
	
	output reg [15:0] alu_val2;
	
	always@(*) begin
		case(sel)
			0: alu_val2 = reg2_val;
			1: alu_val2 = mem_forward;
			2: alu_val2 = wb_forward;
			3: alu_val2 = se_const;
		endcase
	end
endmodule
