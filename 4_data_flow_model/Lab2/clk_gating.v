`timescale 1ns / 1ps

module clk_gating (in_clk, clk_en, out_clk);
	//port list
	input 	wire in_clk; // declarate possible output out_clk
	input 	wire clk_en;
	output 	wire out_clk;

	// port declaration
	assign out_clk = in_clk & clk_en;
	
endmodule
