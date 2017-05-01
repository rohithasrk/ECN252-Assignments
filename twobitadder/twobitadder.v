`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:25:28 05/01/2017 
// Design Name: 
// Module Name:    twobitadder 
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
module twobitadder(
	input [1:0] a,
	input [1:0] b,
	input cin,
	output [1:0] sum,
	output carry
);

wire c;

fulladder f1(.a(a[0]), .b(b[0]), .cin(0), .sum(sum	[0]), .carry(c));
fulladder f2(.a(a[1]), .b(b[1]), .cin(c), .sum(sum[1]), .carry(carry));

endmodule
