`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mississippi State University
// ECE 4713 Computer Architecture
// Engineer: Zach Thornton
// 
// Create Date:    10:32:55 04/08/2011 
// Module Name:    Data_Memory
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
module Data_Memory(addra,din,wea,addrb,dout);

//Inputs
input [15:0] addra,addrb;
input [15:0] din;
input wea;

//Outputs
output reg [15:0] dout;

//internal regs
reg [15:0] mem0,mem1,mem2,mem3,mem4,mem5,mem6,mem7,mem8,mem9,
			  mem10,mem11,mem12,mem13,mem14,mem15,mem16,mem17,mem18,mem19,
			  mem20,mem21,mem22,mem23,mem24,mem25,mem26,mem27,mem28,mem29,
			  mem30,mem31,mem32,mem33,mem34,mem35,mem36,mem37,mem38,mem39,
			  mem40,mem41,mem42,mem43,mem44,mem45,mem46,mem47,mem48,mem49,
			  mem50,mem51,mem52,mem53,mem54,mem55,mem56,mem57,mem58,mem59,
			  mem60,mem61,mem62,mem63;
			  
always @(addra,din,wea,addrb)
begin
	if(wea)
	begin
		case(addra)
			'd0:	mem0 = din;
			'd1:	mem1 = din;
			'd2:	mem2 = din;
			'd3:	mem3 = din;
			'd4:	mem4 = din;
			'd5:	mem5 = din;
			'd6:	mem6 = din;
			'd7:	mem7 = din;
			'd8:	mem8 = din;
			'd9:	mem9 = din;
			'd10:	mem10 = din;
			'd11:	mem11 = din;
			'd12:	mem12 = din;
			'd13:	mem13 = din;
			'd14:	mem14 = din;
			'd15:	mem15 = din;
			'd16:	mem16 = din;
			'd17:	mem17 = din;
			'd18:	mem18 = din;
			'd19:	mem19 = din;
			'd20:	mem20 = din;
			'd21:	mem21 = din;
			'd22:	mem22 = din;
			'd23:	mem23 = din;
			'd24:	mem24 = din;
			'd25:	mem25 = din;
			'd26:	mem26 = din;
			'd27:	mem27 = din;
			'd28:	mem28 = din;
			'd29:	mem29 = din;
			'd30:	mem30 = din;
			'd31:	mem31 = din;
			'd32:	mem32 = din;
			'd33:	mem33 = din;
			'd34:	mem34 = din;
			'd35:	mem35 = din;
			'd36:	mem36 = din;
			'd37:	mem37 = din;
			'd38:	mem38 = din;
			'd39:	mem39 = din;
			'd40:	mem40 = din;
			'd41:	mem41 = din;
			'd42:	mem42 = din;
			'd43:	mem43 = din;
			'd44:	mem44 = din;
			'd45:	mem45 = din;
			'd46:	mem46 = din;
			'd47:	mem47 = din;
			'd48:	mem48 = din;
			'd49:	mem49 = din;
			'd50:	mem50 = din;
			'd51:	mem51 = din;
			'd52:	mem52 = din;
			'd53:	mem53 = din;
			'd54:	mem54 = din;
			'd55:	mem55 = din;
			'd56:	mem56 = din;
			'd57:	mem57 = din;
			'd58:	mem58 = din;
			'd59:	mem59 = din;
			'd60:	mem60 = din;
			'd61:	mem61 = din;
			'd62:	mem62 = din;
			'd63:	mem63 = din;
		endcase
	end//if(wea)
	
	case(addrb)
		'd0:	dout = mem0;
		'd1:	dout = mem1;
		'd2:	dout = mem2;
		'd3:	dout = mem3;
		'd4:	dout = mem4;
		'd5:	dout = mem5;
		'd6:	dout = mem6;
		'd7:	dout = mem7;
		'd8:	dout = mem8;
		'd9:	dout = mem9;
		'd10:	dout = mem10;
		'd11:	dout = mem11;
		'd12:	dout = mem12;
		'd13:	dout = mem13;
		'd14:	dout = mem14;
		'd15:	dout = mem15;
		'd16:	dout = mem16;
		'd17:	dout = mem17;
		'd18:	dout = mem18;
		'd19:	dout = mem19;
		'd20:	dout = mem20;
		'd21:	dout = mem21;
		'd22:	dout = mem22;
		'd23:	dout = mem23;
		'd24:	dout = mem24;
		'd25:	dout = mem25;
		'd26:	dout = mem26;
		'd27:	dout = mem27;
		'd28:	dout = mem28;
		'd29:	dout = mem29;
		'd30:	dout = mem30;
		'd31:	dout = mem31;
		'd32:	dout = mem32;
		'd33:	dout = mem33;
		'd34:	dout = mem34;
		'd35:	dout = mem35;
		'd36:	dout = mem36;
		'd37:	dout = mem37;
		'd38:	dout = mem38;
		'd39:	dout = mem39;
		'd40:	dout = mem40;
		'd41:	dout = mem41;
		'd42:	dout = mem42;
		'd43:	dout = mem43;
		'd44:	dout = mem44;
		'd45:	dout = mem45;
		'd46:	dout = mem46;
		'd47:	dout = mem47;
		'd48:	dout = mem48;
		'd49:	dout = mem49;
		'd50:	dout = mem50;
		'd51:	dout = mem51;
		'd52:	dout = mem52;
		'd53:	dout = mem53;
		'd54:	dout = mem54;
		'd55:	dout = mem55;
		'd56:	dout = mem56;
		'd57:	dout = mem57;
		'd58:	dout = mem58;
		'd59:	dout = mem59;
		'd60:	dout = mem60;
		'd61:	dout = mem61;
		'd62:	dout = mem62;
		'd63:	dout = mem63;
	endcase

end//always
endmodule
