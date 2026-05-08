`timescale 1ns / 1ps

module ander_ff (
	
	in1,
	in2, 
	clk,
	out
);


input wire in1, in2, clk;
output reg out;

always @(posedge clk) 
begin
	out = in1 & in2;
end
endmodule
