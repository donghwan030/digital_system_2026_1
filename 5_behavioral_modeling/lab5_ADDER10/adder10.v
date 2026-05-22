`timescale 1ns / 1ps

module adder (
	// port list
	rst_n		, 
	clk			, 
	in1			, 
	in2			, 
	out			,
);

// port declaration and set IO direction
input wire rst_n			;
input wire clk				;
input wire [9:0] in1		;
input wire [9:0] in2		;
output reg [10:0] out		;


/* case1 */

/*
// temp var add as wire to store addition result
wire [10:0] add = {1'b0, in1} + {1'b0, in2};

always @(posedge clk, negedge rst_n) 
begin
	if (rst_n == 0) out <= 11'b0 	; // active low
	else 			out <= add		;
end
*/

/* case2 */
always @(posedge clk, negedge rst_n) 
begin
	if (~rst_n) out <= 11'b0;
	else out <= {1'b0, in1} + {1'b0, in2};
end


	
endmodule