`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineer: 
// 
// Create Date:    10:05:25 04/02/2011 
// Design Name: 
// Module Name:    Sign_Ext 
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
module Sign_Ext(const_in,const_out,SEOp
    );
	 
	 input [5:0] const_in;
	 input SEOp;
	 output reg [15:0] const_out;
	 
	 
	 always@(*) begin
		if(SEOp) begin
			const_out = {11'd0,const_in[5:1]};
		end
		else begin
			if(const_in[5] == 'd1)
				const_out = {10'h3FF,const_in[5:0]};
			else
				const_out = {10'd0,const_in[5:0]};
		end
	end

endmodule
