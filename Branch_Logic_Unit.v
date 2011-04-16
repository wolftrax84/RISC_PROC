`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineer: Sean Owens
// 
// Create Date:    13:11:05 04/02/2011 
// Module Name:    Branch_Logic_Unit 
// Project Name: 	 RISC_PROC
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
module Branch_Logic_Unit(gt_bra,le_bra,eq_bra,equal,zero,less,id_bra_pc,exe_bra_pc,pcsrc,
									bra_pc,pcsrc1,pcsrc2
    );
	 
	 input gt_bra,le_bra,eq_bra,equal,zero,less;
	 input [5:0] id_bra_pc,exe_bra_pc;
	 output pcsrc;
	 output reg [5:0] bra_pc;
	 
	 output pcsrc1,pcsrc2;
	 wire temp1,inv_temp1,temp2,temp3;
	 
	 //PCSrc1
	 and(pcsrc1,eq_bra,equal);
	 
	 //PCSrc2
	 assign inv_temp = ~temp1;
	 or(temp1, zero, less);
	 and(temp2, inv_temp, gt_bra);
	 and(temp3, temp1, le_bra);
	 or(pcsrc2, temp2, temp3);
	 
	 //PCSrc
	 or(pcsrc,pcsrc1,pcsrc2);
	 
	 //Branch_PC
	 always@(*) begin
		if(pcsrc2)
			bra_pc = exe_bra_pc;
		else
			bra_pc = id_bra_pc;
	end
		 
endmodule
