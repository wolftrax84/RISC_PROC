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
module Top_Level(clock,reset
    );

input clock,reset;

//Control Wires
wire gt_bra,id_gt_bra,exe_gt_bra,le_bra,id_le_bra,exe_le_bra,eq_bra,id_eq_bra;
wire MemRead,id_MemRead,exe_MemRead,mem_MemRead,MemWrite,id_MemWrite,exe_MemWrite,mem_MemWrite;
wire RegWrite,id_RegWrite,exe_RegWrite,mem_RegWrite,wb_RegWrite;
wire jump,id_jump,seOp,id_seOp;
wire ifid_flush,idexe_flush;
wire [1:0] id_RegDst,exe_RegDst,id_MemtoReg,exe_MemtoReg,mem_MemtoReg,wb_MemtoReg;
wire [2:0] id_ALUOp,exe_ALUOp;

wire [15:0] next_pc_in,bra_pc,next_instr_addr;
wire [15:0] if_instr_addr,id_instr_addr;
wire PCSrc,PCSrc1,PCSrc2,PCWrite;
wire [15:0] if_instruction,id_instruction;
wire if_id_write;

wire [15:0] id_se_const;
wire [2:0] exe_fwd_reg,mem_fwd_reg,wb_fwd_reg;
wire [15:0] regWrite_val,id_reg1_val,id_reg2_val;
wire ctrl_flush,comp_equal;
wire [15:0] exe_bra_pc,exe_reg1_val,exe_reg2_val;
wire [2:0] exe_rs,exe_rt,exe_rd;
wire [7:0] exe_lb_const,mem_lb_const,wb_lb_const;
wire [15:0] exe_se_const;

wire [1:0] reg1_mux_sel,reg2_mux_sel;
wire [15:0] alu_input1,alu_input2,exe_alu_out,mem_alu_out;
wire [3:0] alu_control;
wire alu_zero,alu_less;
wire [15:0] mem_reg2_val;
wire [15:0] mem_mem_out,wb_mem_out;
Adder_2 Bra_Adder(.in_1(id_instr_addr),.in_2(id_se_const));

//////////////////////////////////////////////////////////////////////////////////
//
//		Instruction Fetch
//
//////////////////////////////////////////////////////////////////////////////////

pc_mux PC_mux(.control({id_jump,PCSrc}),.in_1(next_pc_in),.in_2(bra_pc),.in_3({next_pc_in[15:12],id_instruction[12:0]}),.out(next_instr_addr));

Reg_16 PC(.clock(clock),.reset(reset),.d(next_instr_addr),.q(if_instr_addr),.en(PCWrite));

Adder_2 PC_adder(.in_1(if_instr_addr),.in_2('d1),.out(next_pc_in));

Instruction_Memory i_instr_mem(.address(if_instr_addr),.out(if_instruction));

IF_ID_Buffer if_id_buf(.clock(clock),.reset(reset),.if_id_write(if_id_write),.if_flush(ifid_flush),
								.instruction_in(if_instruction),.instr_addr_in(next_pc_in),
								.instruction_out(id_instruction),.instr_addr_out(id_instr_addr));
//////////////////////////////////////////////////////////////////////////////////
//
//		Instruction Decode
//
//////////////////////////////////////////////////////////////////////////////////

RegisterFile i_reg_file(.readAddr1(id_instruction[11:9]),.readAddr2(id_instruction[8:6]),.readData1(id_reg1_val),
								.readData2(id_reg2_val),.writeEn(wb_RegWrite),.writeAddr(wb_fwd_reg),.writeData(regWrite_val)
								);
								
								
								
Sign_Ext i_sign_ext(.const_in(id_instruction[5:0]),.const_out(id_se_const),.SEOp(id_seOp));

Control i_control_unit(.OpCode(id_instruction[15:12]),.regDst(RegDst),.gt_bra(gt_bra),.le_bra(le_bra),.eq_bra(eq_bra),
								.memRead(MemRead),.memToReg(MemtoReg),.aluOp(ALUOp),.memWrite(MemWrite),.regWrite(RegWrite),
								.jump(jump),.seOp(seOp),.IF_ID_Flush(ifid_flush),.ID_EX_Flush(idexe_flush),.pcsrc1(PCSrc1),.pcsrc2(PCSrc2));

Hazard_detection_unit i_haz_dec_unit(.Rs(id_instruction[11:9]),.Rt(id_instruction[8:6]),.Ex_rt(exe_rt),.Ex_memread(exe_MemRead),
													.Mem_memread(mem_MemRead),.Mem_rt(mem_fwd_reg),.Wb_rt(wb_fwd_reg),.Wb_memread(wb_MemRead),
													.brlegt(PCSrc2),.breq(PCScr1),.ctrl_flush(ctrl_flush),.PCwrite(PCWrite),.Id_write(if_id_write));
												
ControlFlushMux i_ctrl_flush_mux(.select(ctrl_flush),.regDst(RegDst),.gt_bra(gt_bra),.le_bra(le_bra),.eq_bra(eq_bra),.memRead(MemRead),
											.memToReg(MemtoReg),.aluOp(ALUOp),.memWrite(MemWrite),.regWrite(RegWrite),.jump(jump),.seOp(seOp),
											.regDstOut(id_RegDst),.gt_braOut(id_gt_bra),.le_braOut(id_le_bra),.eq_braOut(id_eq_bra),
											.memReadOut(id_MemRead),.memToRegOut(id_MemtoReg),.aluOpOut(id_ALUOp),.memWriteOut(id_MemWrite),
											.regWriteOut(id_RegWrite),.jumpOut(id_jump),.seOpOut(id_seOp));

RegisterCompare i_reg_compare(.reg1(reg1_val),.reg2(reg2_val),.equal(comp_equal));

ID_EXE_Buffer i_id_exe_buf(.clock(clock),.reset(reset),.id_bra_pc(id_bra_pc),.id_reg1_val(id_reg1_val),.id_reg2_val(id_reg2_val),
									.id_rs(id_instruction[11:9]),.id_rt(id_instruction[8:6]),.id_rd(id_instruction[5:3]),
									.id_lb_const(id_instruction[7:0]),.id_se_const(id_se_const),.exe_bra_pc(exe_bra_pc),
									.exe_reg1_val(exe_reg1_val),.exe_reg2_val(exe_reg2_val),.exe_rs(exe_rs),.exe_rt(exe_rt),
									.exe_rd(exe_rd),.exe_lb_const(exe_lb_const),.exe_se_const(exe_se_const),.id_gt_bra(id_gt_bra),
									.id_le_bra(id_le_bra),.id_alu_op(id_ALUOp),.id_reg_dst(id_RegDst),.id_mem_read(id_MemRead),
									.id_mem_write(id_MemWrite),.id_memtoreg(id_MemtoReg),.id_regwrite(id_RegWrite),.exe_gt_bra(exe_gt_bra),
									.exe_le_bra(exe_le_bra),.exe_alu_op(exe_ALUOp),.exe_reg_dst(exe_RegDst),.exe_mem_read(exe_MemRead),
									.exe_mem_write(exe_MemWrite),.exe_memtoreg(exe_MemtoReg),.exe_regwrite(exe_RegWrite)
					);
//////////////////////////////////////////////////////////////////////////////////
//
//		Execute
//
//////////////////////////////////////////////////////////////////////////////////

Reg_Dest_Mux i_reg_dest_mux(.rs(exe_rs),.rt(exe_rt),.rd(exe_rd),
										.write_addr(exe_fwd_reg),.regDest(exe_RegDst));

ALU_Reg1_Mux i_reg1_mux(.sel(reg1_mux_sel),.reg1_val(exe_reg1_val),.mem_forward(mem_alu_out),.wb_forward(regWrite_val),
								.alu_val1(alu_input1));
								
ALU_Reg2_Mux i_reg2_mux(.sel(reg2_mux_sel),.reg2_val(exe_reg2_val),.mem_forward(mem_alu_out),.wb_forward(regWrite_val),
								.alu_val2(alu_input2),.se_const(exe_se_const));
		
ALU_Control i_alu_constrol(.aluOp(exe_ALUOp),.func(exe_lb_const[2:0]),.shiftDirection(exe_lb_const[0]),.aluControl(alu_control));
		
ALU i_alu(.aluInput1(alu_input1),.aluInput2(alu_input2),.aluControl(alu_control),.aluOutput(exe_alu_out),.zero(alu_zero),.less(alu_less));

Branch_Logic_Unit i_bra_log_unit(.gt_bra(exe_gt_bra),.le_bra(exe_le_bra),.eq_bra(id_eq_bra),.equal(comp_equal),
											.zero(alu_zero),.less(alu_less),.id_bra_pc(id_bra_pc),
											.exe_bra_pc(exe_bra_pc),.pcsrc(PCSrc),.bra_pc(bra_pc),.pcsrc1(PCSrc1),.pcsrc2(PCSrc2));
											
Forwarding_unit i_forwarding_unit(.Rs(exe_rs),.Rt(exe_rt),.Exmem_rd(mem_fwd_reg),.Memwb_rd(wb_fwd_reg),.Exmem_reg_write(mem_RegWrite),
												.Memwb_reg_write(wb_RegWrite),.Alu_src1(reg1_mux_sel),.Alu_src2(reg2_mux_sel));
											
EXE_MEM_Buffer i_exe_mem_buf(.clock(clock),.reset(reset),.exe_alu_out(exe_alu_out),.exe_reg2_val(exe_reg2_val),.exe_fwd_reg(exe_fwd_reg),
					.exe_lb_const(exe_lb_const),.mem_alu_out(mem_alu_out),.mem_reg2_val(mem_reg2_val),.mem_fwd_reg(mem_fwd_reg),
					.mem_lb_const(mem_lb_const),.exe_mem_read(exe_MemRead),.exe_mem_write(exe_MemWrite),.exe_memtoreg(exe_MemtoReg),
					.exe_regwrite(exe_RegWrite),.mem_mem_read(mem_MemRead),.mem_mem_write(mem_MemWrite),.mem_memtoreg(mem_MemtoReg),
					.mem_regwrite(mem_RegWrite)
    );

//////////////////////////////////////////////////////////////////////////////////
//
//		Memory Access
//
//////////////////////////////////////////////////////////////////////////////////


Data_Memory	i_data_mem(.addr(mem_alu_out),.din(mem_reg2_val),.dout(mem_mem_out),.wea(MemWrite));


MEM_WB_Buffer i_mem_wb_buf(.clock(clock),.reset(reset),.mem_mem_out(mem_mem_out),.mem_alu_out(mem_alu_out),.mem_lb_const(mem_lb_const),
									.mem_fwd_reg(mem_fwd_reg),.wb_mem_out(wb_mem_out),.wb_alu_out(wb_alu_out),.wb_lb_const(wb_lb_const),
									.wb_fwd_reg(wb_fwd_reg),.mem_memtoreg(mem_MemtoReg),.mem_regwrite(mem_RegWrite),.wb_memtoreg(wb_MemtoReg),
									.wb_regwrite(wb_RegWrite),.mem_mem_read(mem_MemRead),.wb_mem_read(wb_MemRead)
							);	


//////////////////////////////////////////////////////////////////////////////////
//
//		Write Back
//
//////////////////////////////////////////////////////////////////////////////////

Mux_2 wb_mux(.control(wb_MemtoReg),.in_1(wb_alu_out),.in_2(wb_mem_out),.out(regWrite_val));

endmodule
