`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineer: Zach Thornton
// 
// Create Date:    15:09:32 04/02/2011 
// Module Name:    Control
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
module Control(OpCode,pcsrc1,pcsrc2,regDst,gt_bra,le_bra,eq_bra,memRead,memToReg,aluOp,memWrite,
					regWrite,jump,seOp,IF_ID_Flush,ID_EX_Flush);

//Inputs
input [3:0] OpCode;
input pcsrc1,pcsrc2;

//Outputs
output [1:0] regDst;
output gt_bra,le_bra,eq_bra;
output memRead;
output [1:0] memToReg;
output [2:0] aluOp;
output memWrite;
output regWrite;
output jump;
output seOp;
output reg IF_ID_Flush,ID_EX_Flush;

wire a,b,c,d;

assign a = OpCode[3];
assign b = OpCode[2];
assign c = OpCode[1];
assign d = OpCode[0];

assign regDst[0] = (a & b & c & d);

assign regDst[1] = (a & ~b & c & d);

assign gt_bra = (~a & ~b & c & d);

assign le_bra = (~a & b & ~c & ~d);		//problem

assign eq_bra = (~a & ~b & c & ~d);		//problem

assign memRead = (~a & b & ~c & d)
					 |
					 (a & ~b & c & d);
					 
assign memToReg[0] = (~a & b & ~c & d)
						   |
							(a & ~b & c & d);
							
assign memToReg[1] = (a & ~b & c & d);

assign aluOp[0] = (~a & ~b & c)			//problem
					  |
					  (b & ~c & ~d);
					  
assign aluOp[1] = (a & b & ~c & ~d)		//problem
						|
						(a & b & c & d);
						
assign aluOp[2] = (a & b & ~c & d);
		
assign memWrite = (~a & b & c & ~d);	//problem
		
assign regWrite = (a) |  (b & d);	//problem
		
assign jump = (~a & ~b & ~c & d);
		
assign seOp = (a & b & ~c);		//problem

assign IF_ID_Flush = pcsrc1 | pcsrc2;

assign ID_EX_Flush = pcsrc2;

endmodule
