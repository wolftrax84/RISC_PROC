`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineer: Zach Thornton
// 
// Create Date:    10:59:17 04/08/2011 
// Module Name:    ControlFlushMux
// Project Name:   RISC_PROC
// Tool versions:  Xilinx ISE 12.4
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ControlFlushMux(select,regDst,gt_bra,le_bra,eq_bra,memRead,memToReg,aluOp,memWrite,regWrite,
							  jump,seOp,regDstOut,gt_braOut,le_braOut,eq_braOut,memReadOut,
							  memToRegOut,aluOpOut,memWriteOut,regWriteOut,jumpOut,seOpOut);
//Input
input select;
input [1:0] regDst;
input gt_bra,le_bra,eq_bra;
input memRead;
input [1:0] memToReg;
input [2:0] aluOp;
input memWrite;
input regWrite;
input jump;
input seOp;						  
							  
//Outputs
output reg [1:0] regDstOut;
output reg gt_braOut,le_braOut,eq_braOut;
output reg memReadOut;
output reg [1:0] memToRegOut;
output reg [2:0] aluOpOut;
output reg memWriteOut;
output reg regWriteOut;
output reg jumpOut;
output reg seOpOut;

always @(*)
begin
	case(select)
		'd0:	
		begin
			regDstOut = regDst;
			gt_braOut = gt_bra;
			le_braOut = le_bra;
			eq_braOut = eq_bra;
			memReadOut = memRead;
			memToRegOut = memToReg;
			aluOpOut = aluOp;
			memWriteOut = memWrite;
			regWriteOut = regWrite;
			jumpOut = jump;
			seOpOut = seOp;
		end
		
		'd1:
		begin
			regDstOut = 'd0;
			gt_braOut = 'd0;
			le_braOut = 'd0;
			eq_braOut = 'd0;
			memReadOut = 'd0;
			memToRegOut = 'd0;
			aluOpOut = 'd0;
			memWriteOut = 'd0;
			regWriteOut = 'd0;
			jumpOut = 'd0;
			seOpOut = 'd0;
		end
	endcase	
end //always
endmodule
