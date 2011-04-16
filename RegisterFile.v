`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineer: Zach Thornton
// 
// Create Date:    11:59:40 04/08/2011 
// Module Name:    RegisterFile
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
module RegisterFile(reset,readAddr1,readAddr2,readData1,readData2,writeEn,writeAddr,writeData);

//Inputs
input reset;
input [2:0] readAddr1,readAddr2;
input writeEn;
input [2:0] writeAddr;
input [15:0] writeData;

//Outputs
output reg [15:0] readData1,readData2;

//internal regs
reg [15:0] v0;
reg [15:0] v1;
reg [15:0] v2;
reg [15:0] v3;
reg [15:0] t0;
reg [15:0] t1;
reg [15:0] a0;
reg [15:0] a1;

always @(readAddr1,readAddr2,writeEn,writeAddr,writeData)
begin

	if(reset)
	begin
		v0 = 16'd0;
		v1 = 16'd0;
		v2 = 16'd0;
		v3 = 16'd0;
		t0 = 16'd0;
		t1 = 16'd0;
		a0 = 16'd0;
		a1 = 16'd0;
	end
	else
	begin
		if(writeEn)
		begin
			case(writeAddr)
				'd0:	v0 = writeData;
				'd1:	v1 = writeData;
				'd2:	v2 = writeData;
				'd3:	v3 = writeData;
				'd4:	t0 = writeData;
				'd5:	t1 = writeData;
				'd6:  a0 = writeData;
				'd7:	a1 = writeData;
			endcase
		end	//if(writeEn)
		
		case(readAddr1)
				'd0:	readData1 = v0;
				'd1:	readData1 = v1;
				'd2:	readData1 = v2;
				'd3:	readData1 = v3;
				'd4:	readData1 = t0;
				'd5:	readData1 = t1;
				'd6:  readData1 = a0;
				'd7:	readData1 = a1;
		endcase
		
			case(readAddr2)
				'd0:	readData2 = v0;
				'd1:	readData2 = v1;
				'd2:	readData2 = v2;
				'd3:	readData2 = v3;
				'd4:	readData2 = t0;
				'd5:	readData2 = t1;
				'd6:  readData2 = a0;
				'd7:	readData2 = a1;
		endcase
	end//else
end//always

endmodule
