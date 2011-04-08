`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineers: 	Sean Owens
//					Troy Huguet
//					Zach Thornton
// 
// Create Date:    09:50:28 03/29/2011 
// Module Name:    Top_Level 
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
module Top_Level(
    );



//////////////////////////////////////////////////////////////////////////////////
//
//		Instruction Fetch
//
//////////////////////////////////////////////////////////////////////////////////
reg PCSrc,PCWrite;

wire [5:0] next_pc_in,instr_addr;

wire [15:0] if_instruction;

Mux_2 PC_mux(.control(PCSrc),.in_1(next_pc_in),.in_2(bra_pc),.out(next_instr_addr));

Reg_16 PC(.clock(clock),.reset(reset),.d(next_instr_addr),.q(if_instr_addr),.en(PCWrite));

Adder_2 PC_adder(.in_1(if_instr_addr),.in_2('d1),.out(next_pc_in));

Instruction_Memory i_instr_mem(.address(if_instr_addr),.out(if_instruction));

IF_ID_Buffer if_id_buf(.clock(clock),.if_id_write(if_id_write),.if_flush(if_flush),
								.instruction_in(if_instruction),.instr_addr_in(next_pc_in),
								.instruction_out(id_instruction),.instr_addr_out(id_instr_addr));
//////////////////////////////////////////////////////////////////////////////////
//
//		Instruction Decode
//
//////////////////////////////////////////////////////////////////////////////////
Adder_2 Bra_Adder(.in_1(id_instr_addr),.in_2(id_se_const));

Reg_Dest_Mux i_reg_dest_mux(.rs(id_instruction[11:9]),.rt(id_instruction[8:6]),.rd(id_instruction[5:3]),
										.write_addr(regwrite_addr),.regDest(regDest));

Register_File i_reg_file(.reg1_addr(id_instruction[11:9]),.reg2_addr(id_instruction[8:6]),
									.regwrite_addr(regwrite_addr),.write_in(regwrite_val),
									.reg_write(RegWrite),.reg1_out(id_reg1_val),.reg2_out(id_reg2_val)
								);
								
Sign_Ext i_sign_ext(.const_in(id_instruction[5:0]),.const_out(id_se_const),.SEOp(SEOp));

Control_Unit i_control_unit(.opcode(id_instruction[15:12]));

Hazard_Dectection_Unit i_haz_dec_unit(.id_rs(id_istruction[11:9]),.id_rt(id_instruction[8:6]),
													.exe_rt(exe_rt)
												);
												
Ctrl_Flush_Mux i_ctrl_flush_mux();

Reg_Compare i_reg_compare(.reg1(reg1_val),.reg2(reg2_val),.equal(comp_equal));

ID_EXE_Buffer i_id_exe_buf(.clock(clock),.id_bra_pc(id_bra_pc),.id_reg1_val(id_reg1_val),.id_reg2_val(id_reg2_val),
									.id_rs(id_instruction[11:9]),.id_rt(id_instruction[8:6]),.id_rd(id_instruction[5:3]),
									.id_lb_const(id_instruction[7:0]),.id_se_const(id_se_const),.exe_bra_pc(exe_bra_pc),
									.exe_reg1_val(exe_reg1_val),.exe_reg2_val(exe_reg2_val),.exe_rs(exe_rs),.exe_rt(exe_rt),
									.exe_rd(exe_rd),.exe_lb_const(exe_lb_const),.exe_se_const(exe_se_const)
					);
//////////////////////////////////////////////////////////////////////////////////
//
//		Execute
//
//////////////////////////////////////////////////////////////////////////////////

ALU_Reg1_Mux i_reg1_mux(.sel(reg1_mux_sel),.reg1_val(exe_reg1_val),.mem_forward(mem_alu_out),.wb_forward(regWrite_val),
								.alu_val1(alu_input1));
								
ALU_Reg2_Mux i_reg2_mux(.sel(reg2_mux_sel),.reg2_val(exe_reg2_val),.mem_forward(mem_alu_out),.wb_forward(regWrite_val),
								.alu_val2(alu_input2));
								
ALU i_alu();

Fwd_Reg_Mux i_fwd_reg_mux(.exe_rt(exe_rt),.exe_rd(exe_rd),.fwd_reg_src(fwdRegSrc),.exe_fwd_reg(exe_fwd_reg));

Branch_Logic_Unit i_bra_log_unit(.gt_bra(gt_bra),.le_bra(le_bra),.eq_bra(eq_bra),.equal(comp_equal),
											.zero(alu_zero),.less(alu_less),.id_bra_pc(id_bra_pc),
											.exe_bra_pc(exe_bra_pc),.pcsrc(PCSrc),.bra_pc(bra_pc));
											
EXE_MEM_Buffer i_exe_mem_buf(.clock(clock),.reset(reset),.exe_alu_out(exe_alu_out),.exe_reg2_val(exe_reg2_val),.exe_fwd_reg(exe_fwd_reg),
					.exe_lb_const(exe_lb_const),.mem_alu_out(mem_alu_out),.mem_reg2_val(mem_reg2_val),.mem_fwd_reg(mem_fwd_reg),
					.mem_lb_const(mem_lb_const)
    );

//////////////////////////////////////////////////////////////////////////////////
//
//		Memory Access
//
//////////////////////////////////////////////////////////////////////////////////

Data_Mem	i_data_mem(.addr(mem_alu_out),.val(mem_reg2_val),.out(mem_mem_out),.mem_write(memWrite),.mem_read(memRead));

MEM_WB_Buffer i_mem_wb_buf(


//////////////////////////////////////////////////////////////////////////////////
//
//		Write Back
//
//////////////////////////////////////////////////////////////////////////////////

Mux_2 wb_mux(.control(wb_MemtoReg),.in1(wb_alu_out),.in2(wb_mem_out),.out(regWrite_val));

endmodule
