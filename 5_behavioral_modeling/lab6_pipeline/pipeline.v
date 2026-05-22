`timescale 1ns / 1ps

module pipeline (
	// port list
	clk, 
	rst_n, 
	in1, 
	in2,
	in3,
	out
);

// port declaration
input wire clk;
input wire rst_n; // active low reset
input wire [9:0] in1; // 10-bit operand
input wire [9:0] in2;
input wire [9:0] in3;
output reg [11:0] out; // 12-bit output

// 10bit 0~1023, 11bit 0~2047, 12bit 0~4095
// 10bit + 10bit = 0~2046, 11bit + 10bit = 0~3070
// 12bit is enough to store the result of (in1+in2)+in3

/* 1st clock operation */
///////////////////////////////////////////////////////////////////////////////
// 1. add1: in1 + in2
reg [10:0] temp_add1; // 11bit temp_add1
always @(posedge clk, negedge rst_n) 
begin
	if ( ~rst_n ) temp_add1 <= 11'b0; // rst=ON(system=off)
	else temp_add1 <= {1'b0, in1} + {1'b0, in2}; // rst=OFF(system=on), load in1 and in2 to calc in the first clock
end

// 2. prepare to load in3
reg [9:0] temp_in3; // 10bit temp_in3
always @(posedge clk, negedge rst_n) 
begin
	if ( ~rst_n ) temp_in3 <= 10'b0; // rst=ON(system=off)
	else temp_in3 <= in3; // rst=OFF(system=on), load in3 to calc in the second clock
end
///////////////////////////////////////////////////////////////////////////////
/* End of 1st clock operation */


/* 2ed clock operation */
always @(posedge clk, negedge rst_n) 
begin
	if ( ~rst_n ) out <= 12'b0; // rst=ON(system=off)
	else out <= {1'b0, temp_add1} + {2'b0, temp_in3}; // rst=OFF(system=on), load temp_add1 and temp_in3 to calc in the third clock
end
/* End of 2ed clock operation */

	
endmodule