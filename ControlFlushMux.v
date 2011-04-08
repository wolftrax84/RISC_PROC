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
							  jump,seOp,fwdRegSource,regDstOut,gt_braOut,le_braOut,eq_braOut,memReadOut,
							  memToRegOut,aluOpOut,memWriteOut,regWriteOut,jumpOut,seOpOut,fwdRegSourceOut);
//Input
input select;
input [1:0] regDst;
input gt_bra,le_bra,eq_bra;
input memRead;
input [15:0] memToReg;
input [2:0] aluOp;
input memWrite;
input regWrite;
input jump;
input seOp;
input fwdRegSource;							  
							  
//Outputs
output [1:0] regDstOut;
output gt_braOut,le_braOut,eq_braOut;
output memReadOut;
output [15:0] memToRegOut;
output [2:0] aluOpOut;
output memWriteOut;
output regWriteOut;
output jumpOut;
output seOpOut;
output fwdRegSourceOut;

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
			memWriteOut = memWriteOut;
			regWriteOut = regWrite;
			jumpOut = jump;
			seOpOut = seOp;
			fwdRegSourceOut = fwdRegSource;
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
			fwdRegSourceOut = 'd0;
		end
	endcase	
end //always
endmodule
