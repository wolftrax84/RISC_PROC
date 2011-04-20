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
module Forwarding_unit(Rs, Rt, Exmem_rd, Memwb_rd, Exmem_reg_write, Memwb_reg_write, Alu_src1, Alu_src2, EXE_OPCode,
									MEM_OPCode,lb_mux_sel,mem_write_sel);

//Inputs
input [2:0] Rs, Rt;
input [2:0] Exmem_rd;
input [2:0] Memwb_rd;
input Exmem_reg_write;
input Memwb_reg_write;
input [3:0] EXE_OPCode,MEM_OPCode;

//Outputs
output reg [1:0] Alu_src1;
output reg [1:0] Alu_src2;
output reg lb_mux_sel;
output reg [1:0] mem_write_sel;

always @(*)
	begin
		Alu_src1 = 'd0;
		Alu_src2 = 'd0;
		mem_write_sel = 2'd0;
		
		if(~EXE_OPCode[3]&EXE_OPCode[2]&EXE_OPCode[1] || ~EXE_OPCode[1]&EXE_OPCode[0] || EXE_OPCode[3]&~EXE_OPCode[0]) begin
			Alu_src2=2'b11;
		end
		//MEM hazards
		if(Memwb_reg_write)
			begin
				if(Exmem_reg_write == 0 || (Exmem_rd != Rs))
					begin
						if(Memwb_rd == Rs)
							begin
								Alu_src1 = 2'b10;
							end
					end
				
				if(~EXE_OPCode[3]&EXE_OPCode[2]&EXE_OPCode[1] || ~EXE_OPCode[1]&EXE_OPCode[0] || EXE_OPCode[3]&~EXE_OPCode[0]) begin
					mem_write_sel = 2'd2;
				end
				else if(Exmem_reg_write == 0 || (Exmem_rd != Rt))
					begin
						if(Memwb_rd == Rt)
							begin
								mem_write_sel = 2'd2;
								Alu_src2 = 2'b10;
							end
					end
			end
		
		//EX hazards
		if(Exmem_reg_write)
			begin
				if(Exmem_rd == Rs)
					begin
						Alu_src1 = 2'b01;
					end
					
				if(~EXE_OPCode[3]&EXE_OPCode[2]&EXE_OPCode[1] || ~EXE_OPCode[1]&EXE_OPCode[0] || EXE_OPCode[3]&~EXE_OPCode[0]) begin
					mem_write_sel = 2'd1;
				end
				else if(Exmem_rd == Rt)
					begin
						mem_write_sel = 2'd1;
						Alu_src2 = 2'b01;
					end
			end
		
	end
	
	always@(*) begin
		if(MEM_OPCode == 'b1011)
				lb_mux_sel = 'd1;
		else
			lb_mux_sel = 'd0;	
	end
	

endmodule
