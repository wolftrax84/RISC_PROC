`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:33:01 04/08/2011 
// Design Name: 
// Module Name:    Hazard_detection_unit 
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
module Hazard_detection_unit(Rs, Rt, Ex_rt, Ex_memread, Mem_memread, Mem_rt, Wb_rt, Wb_memread,brlegt, breq, 
										ctrl_flush, PCwrite, Id_write);

//Inputs
input [2:0] Rs, Rt;
input [2:0] Ex_rt;
input [2:0] Mem_rt;
input [2:0] Wb_rt;
input Ex_memread;
input Mem_memread;
input Wb_memread;
input brlegt;
input breq;



//Outputs
output reg ctrl_flush;
output reg PCwrite;
output reg Id_write;

always@(*)
	begin
		if(Ex_memread == 1)
			begin 
				if((Ex_rt == Rs) || (Ex_rt == Rt))
					begin
						ctrl_flush = 1;
						PCwrite = 0;
						Id_write = 0;
					end
			end
			
		if(Mem_memread == 1 && brlegt)
			begin
				if((Mem_rt == Rs) || (Mem_rt == Rt))
					begin
						ctrl_flush = 1;
						PCwrite = 0;
						Id_write = 0;
					end
			end
			
		if(Wb_memread == 1 && breq)
			begin
				if((Wb_rt == Rs) || (Wb_rt == Rt))
					begin
						ctrl_flush = 1;
						PCwrite = 0;
						Id_write = 0;
					end
			end
		
	end

endmodule
