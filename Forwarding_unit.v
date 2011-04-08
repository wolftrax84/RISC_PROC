`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:33:09 04/08/2011 
// Design Name: 
// Module Name:    Forwarding_unit 
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
module Forwarding_unit(Rs, Rt, Exmem_rd, Memwb_rd, Exmem_reg_write, Memwb_reg_write, Alu_src1, Alu_src2);

//Inputs
input [2:0] Rs, Rt;
input [2:0] Exmem_rd;
input [2:0] Memwb_rd;
input [2:0] Exmem_reg_write;
input [2:0] Memwb_reg_write;

//Outputs
output reg [1:0] Alu_src1;
output reg [1:0] Alu_src2;

always @(*)
	begin
	
		//EX hazards
		if(Exmem_reg_write)
			begin
				if(Exmem_rd == Rs)
					begin
						Alu_src1 = 2'b10;
					end
					
				if(Exmem_rd == Rt)
					begin
						Alu_src2 = 2'b10;
					end
			end

		//MEM hazards
		if(Memwb_reg_write)
			begin
				if(Exmem_reg_write == 0 && (Exmem_rd != Rs))
					begin
						if(Memwb_rd == Rs)
							begin
								Alu_src1 = 2'b01;
							end
					end
							
				if(Exmem_reg_write == 0 && (Exmem_rd != Rt))
					begin
						if(Memwb_rd == Rt)
							begin
								Alu_src2 = 2'b01;
							end
					end
			end
		
	end

endmodule
