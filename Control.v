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
module Control(OpCode,regDst,gt_bra,le_bra,eq_bra,memRead,memToReg,aluOp,memWrite,regWrite,jump,
				   seOp,fwdRegSource);

//Inputs
input [3:0] OpCode;

//Outputs
output reg [1:0] regDst;
output reg gt_bra,le_bra,eq_bra;
output reg memRead;
output reg [1:0] memToReg;
output reg [2:0] aluOp;
output reg memWrite;
output reg regWrite;
output reg jump;
output reg seOp;
output reg fwdRegSource;

wire a,b,c,d;

assign a = OpCode[3];
assign b = OpCode[2];
assign c = OpCode[1];
assign d = OpCode[0];

always @(OpCode)
begin

		regDst[0] = (a & b & c & d);
		
		regDst[1] = (a & ~b & c & d);
		
		gt_bra = (~a & ~b & c & d);
		
		le_bra = (~a & b & ~c & ~d);
		
		eq_bra = (~a & ~b & c & ~d);
		
		memRead = (~a & b & ~c & d)
					 |
					 (a & ~b & c & d);
					 
		memToReg[0] = (~a & b & ~c & d)
						   |
							(a & ~b & c & d);
							
		memToReg[1] = (a & ~b & c & d);
		
		aluOp[0] = (~a & ~b & c)
					  |
					  (b & ~c & ~d);
		
		aluOp[1] = (a & b & ~c & ~d)
						|
						(a & b & c & d);
		
		aluOp[2] = (a & b & ~c & d);
		
		memWrite = (~a & b & c & ~d);
		
		regWrite = (a) |  (b & d);
		
		jump = (~a & ~b & ~c & d);
		
		seOp = (a & b & ~c);
		
		fwdRegSource = (a & b & c & d);
					  
end//always


endmodule
