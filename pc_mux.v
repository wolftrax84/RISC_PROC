`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:07 04/08/2011 
// Design Name: 
// Module Name:    pc_mux 
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
module mux_3(control,in_1,in_2,in_3,out
    );
	
	input [1:0] control;
	input [15:0] in_1,in_2,in_3;
	
	output reg [15:0] out;
	
	always@(*) begin
		if(control[1] == 'd1)
			out <= in_3;
		else
			if(control == 'd0)
				out <= in_1;
			else
				out <= in_2;
	end

endmodule
