`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:07:05 05/01/2017 
// Design Name: 
// Module Name:    lcd_init 
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
module lcd_init(
    input clk,
	 output reg [11:8] SF_D,
	 output reg LCD_E,
	 output reg LCD_RS,
	 output reg LCD_RW
);

reg [3:0] init_stage_counter;
reg [19:0] init_counter;

parameter cinit = 750000;
parameter cp = 12;
parameter c4p1ms = 205000;
parameter c100us = 5000;
parameter c40us = 2000;

initial
begin
	init_counter = 0;
	init_stage_counter = 0;
	SF_D = 0;
	LCD_E = 0;
	LCD_RS = 0;
	LCD_RW = 0;
end

// Power on init
always @(posedge clk)
begin
	if(init_stage_counter==0 && init_counter>=cinit)
		begin
			init_stage_counter = 1;
			init_counter = 0;
			SF_D = 4'h3;
			LCD_E = 1;
		end
	if(init_stage_counter==1 && init_counter>=cp)
		begin
			init_stage_counter = 2;
			init_counter = 0;
			SF_D = 4'h0;
			LCD_E = 0;
		end
	if(init_stage_counter==2 && init_counter>=c4p1ms)
		begin
			init_stage_counter = 3;
			init_counter = 0;
			SF_D = 4'h3;
			LCD_E = 1;
		end
	if(init_stage_counter==3 && init_counter>=cp)
		begin
			init_stage_counter = 4;
			init_counter = 0;
			SF_D = 4'h0;
			LCD_E = 0;
		end
	if(init_stage_counter==4 && init_counter>=c100us)
		begin
			init_stage_counter = 5;
			init_counter = 0;
			SF_D = 4'h3;
			LCD_E = 1;
		end
	if(init_stage_counter==5 && init_counter>=cp)
		begin
			init_stage_counter = 6;
			init_counter = 0;
			SF_D = 4'h0;
			LCD_E = 0;
		end
	if(init_stage_counter==6 && init_counter>=c40us)
		begin
			init_stage_counter = 7;
			init_counter = 0;
			LCD_E = 1;
			SF_D = 4'h3;
		end
	if(init_stage_counter==7 && init_counter>=cp)
		begin
			init_stage_counter = 8;
			init_counter = 0;
			SF_D = 4'h0;
			LCD_E = 0;
		end
	if(init_stage_counter==8 && init_counter>=c40us)
		begin
			init_stage_counter = 9;
			init_counter = 0;
		end
	
	// Configure display
	if(init_stage_counter==9)
		begin
			if(init_counter==1)
				begin
					LCD_E = 0;
					SF_D = 4'b0010;
				end
			if(init_counter==3)
				begin
					LCD_E = 1;
				end
			if(init_counter==15)
				begin
					LCD_E = 0;
					SF_D = 4'b1000;
				end
			if(init_counter==65)
				begin
					LCD_E = 1;
				end
			if(init_counter==2065)
				begin
					init_counter = 0;
					init_stage_counter = 10;
				end
		end
	
	// Entry mode
	if(init_stage_counter==10)
		begin
			if(init_counter==1)
				begin
					LCD_E = 0;
					SF_D = 4'b0000;
				end
			if(init_counter==3)
				begin
					LCD_E = 1;
				end
			if(init_counter==15)
				begin
					LCD_E = 0;
					SF_D = 4'hC;
				end
			if(init_counter==65)
				begin
					LCD_E = 1;
				end
			if(init_counter==2065)
				begin
					init_counter = 0;
					init_stage_counter = 11;
				end
		end
	
	// Display on/off
	if(init_stage_counter==11)
		begin
			if(init_counter==1)
				begin
					LCD_E = 0;
					SF_D = 4'b0000;
				end
			if(init_counter==3)
				begin
					LCD_E = 1;
				end
			if(init_counter==15)
				begin
					LCD_E = 0;
					SF_D = 4'hC;
				end
			if(init_counter==65)
				begin
					LCD_E = 1;
				end
			if(init_counter==2065)
				begin
					init_counter = 0;
					init_stage_counter = 12;
				end
		end
	
	//Clear Display
	if(init_stage_counter==12)
		begin
			if(init_counter==1)
				begin
					LCD_E = 0;
					SF_D = 4'b0000;
				end
			if(init_counter==3)
				begin
					LCD_E = 1;
				end
			if(init_counter==15)
				begin
					LCD_E = 0;
					SF_D = 4'b0001;
				end
			if(init_counter==65)
				begin
					LCD_E = 1;
				end
			if(init_counter==101)
				begin
					LCD_E = 0;
				end
			if(init_counter>=100000)
				begin
					init_counter = 0;
					init_stage_counter = 13;
					DONE = 1;
				end
		end
	
	if(init_stage_counter!=13)
		begin
			init_counter = init_counter + 1;
		end
	
end
endmodule
