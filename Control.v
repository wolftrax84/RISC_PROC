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
output reg [1:0] regDst;
output reg gt_bra,le_bra,eq_bra;
output reg memRead;
output reg [1:0] memToReg;
output reg [2:0] aluOp;
output reg memWrite;
output reg regWrite;
output reg jump;
output reg seOp;
output reg IF_ID_Flush,ID_EX_Flush;

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
					  
end//always

always @(pcsrc1,pcsrc2)
begin
	if(pcsrc1)
	begin
		IF_ID_Flush = 1;
		ID_EX_Flush = 0;
	end
	else if(pcsrc2)
	begin
		IF_ID_Flush = 1;
		ID_EX_Flush = 1;
	end
	else
	begin
		IF_ID_Flush = 0;
		ID_EX_Flush = 0;
	end

end//always
endmodule
