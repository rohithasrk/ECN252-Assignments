`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:39:31 05/01/2017
// Design Name:   twobitadder
// Module Name:   /home/rohith/two-bit-adder/twobit_test.v
// Project Name:  two-bit-adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: twobitadder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module twobit_test;

	// Inputs
	reg [1:0] a;
	reg [1:0] b;
	reg cin;

	// Outputs
	wire [1:0] sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	twobitadder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.carry(carry)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		#10
		a = 2'b00;
		b = 2'b01;
		
		#10
		a = 2'b01;
		b = 2'b10;
		
		#10
		a = 2'b10;
		b = 2'b11;
		
		#10
		a = 2'b11;
		b = 2'b11;
		// Add stimulus here

	end
      
endmodule

