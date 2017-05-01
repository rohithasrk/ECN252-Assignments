`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:38:56 05/01/2017
// Design Name:   lcd_init
// Module Name:   /home/rohith/two-bit-adder/lcd_init_test.v
// Project Name:  two-bit-adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lcd_init
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lcd_init_test;

	// Inputs
	reg clk;

	// Outputs
	wire [11:8] SF_D;
	wire LCD_E;
	wire LCD_RS;
	wire LCD_RW;

	// Instantiate the Unit Under Test (UUT)
	lcd_init uut (
		.clk(clk), 
		.SF_D(SF_D), 
		.LCD_E(LCD_E), 
		.LCD_RS(LCD_RS), 
		.LCD_RW(LCD_RW)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		// Add stimulus here

	end
   
   always begin
		# 20 clk=~clk;
	end
	
endmodule

