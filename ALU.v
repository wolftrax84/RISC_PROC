`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineer: Zach Thornton
// 
// Create Date:    15:45:17 04/02/2011 
// Module Name:    ALU 
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
module ALU(aluInput1,aluInput2,aluControl,aluOutput,zero,less);

//Inputs
input [15:0] aluInput1,aluInput2;
input [3:0] aluControl;

//Outputs
output reg [15:0] aluOutput;
output reg zero,less;

always @ (aluInput1,aluInput2,aluControl)
begin
	case(aluControl)
	
	4'd0:		aluOutput = aluInput1 + aluInput2;
	
	4'd1:		aluOutput = aluInput1 - aluInput2;
	
	4'd2:		aluOutput = aluInput1 & aluInput2;
	
	4'd3:		aluOutput = aluInput1 | aluInput2;
	
	4'd4:		aluOutput = aluInput1 ^ aluInput2;
	
	4'd5:
	begin
		if(aluInput1 < aluInput2)
			aluOutput = 16'd1;
		else
			aluOutput = 16'd0;
	end
	
	4'd6: 	aluOutput = aluInput1 >> aluInput2;
	
	4'd7:		aluOutput = aluInput1 << aluInput2;
	
	4'd8:		aluOutput = aluInput1 >>> aluInput2;
	
	endcase	
end//always

always @(aluOutput)
begin
	if(aluOutput == 0)
		zero = 1;
	else
		zero = 0;
	if(aluOutput[15] == 1)
		less = 1;
	else 
		less = 0;
end//always
endmodule
