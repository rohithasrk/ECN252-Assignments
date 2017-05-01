`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:12:37 05/01/2017 
// Design Name: 
// Module Name:    fulladder 
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
module fulladder(
    input a,
	 input b,
	 input cin,
	 output sum,
	 output carry
);

wire s1, c1, c2;

halfadder h1(.a(a), .b(b), .sum(s1), .carry(c1));
halfadder h2(.a(s1), .b(cin), .sum(sum), .carry(c2));
or o1(carry, c1, c2);

endmodule
