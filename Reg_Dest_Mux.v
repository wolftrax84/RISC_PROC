`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:56 04/02/2011 
// Design Name: 
// Module Name:    Reg_Dest_Mux 
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
module Reg_Dest_Mux(rs,rt,rd,write_addr,regDest
    );


	input [1:0] regDest;
	input [2:0] rs,rt,rd;
	output reg [2:0] write_addr;
	
	always@(*) begin
		if(regDest[1] == 'd1) begin
			write_addr = rs;
		end
		else begin
			if(regDest[0] == 'd1)
				write_addr = rd;
			else
				write_addr = rt;
		end
	end
			
endmodule
