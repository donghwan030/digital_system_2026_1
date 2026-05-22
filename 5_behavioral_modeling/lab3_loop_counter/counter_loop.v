`timescale 1ns / 1ps

module counter_loop (
	// port list
	clk, 
	rst_n, 
	cnt
);

// port declaration
input clk;
input rst_n;
output [6:0] cnt;

// behaviral modeling
reg [6:0] cnt; // output -> reg, overrioing
always @(posedge clk, negedge rst_n) 
begin
	if (~rst_n) cnt <= 7'b0; // similar to loop exit condition
	else if (cnt == 99) cnt <= 7'b0; // rst=off. system on
	else cnt <= cnt + 1; // cnt != 99
end
	
endmodule