`timescale 1ns/1ps

module tb_orer_ff ();

	reg in1, in2, clk;
	wire out;

orer_ff orer_ff_dut(
	.in1(in1),
       	.in2(in2), 
	.out(out),
	.clk(clk)
);
initial clk = 1'b0;
always #10 clk = ~clk;
initial 
	begin
		$monitor("Time=%0t | in1=%b, in2=%b | clk=%b | out=%b",
			 $time, in1, in2, clk, out);
		in1 = 1'b0; in2 = 1'b0; #10
		in1 = 1'b0; in2 = 1'b0; #10
		in1 = 1'b0; in2 = 1'b1; #10
		in1 = 1'b0; in2 = 1'b1; #10
		in1 = 1'b1; in2 = 1'b0; #10
		in1 = 1'b1; in2 = 1'b0; #10
		in1 = 1'b1; in2 = 1'b1; #10
		in1 = 1'b1; in2 = 1'b1; #10
	       	$finish;
	end
endmodule
