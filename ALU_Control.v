`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineer: Zach Thornton
// 
// Create Date:    15:30:20 04/02/2011 
// Module Name:    ALU_Control 
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
module ALU_Control(aluOp,func,shiftDirection,aluControl);

//Inputs
input [2:0] aluOp,func;
input shiftDirection;

//Outputs
output reg [3:0] aluControl;

always @(aluOp,func,shiftDirection)
begin
	
	case(aluOp)
	
	3'd0:		aluControl = 4'd0;
		
	3'd1: 	aluControl = 4'd1;
	
	3'd2:		aluControl = {1'd0,func[2:0]};
		
	3'd3:
	begin
	if (shiftDirection == 1)
				aluControl = 4'd6;		
	else if(shiftDirection == 0)
				aluControl = 4'd7;
	end
	
	3'd4:
		aluControl = 4'd8;	
		
	endcase
end//always
endmodule
