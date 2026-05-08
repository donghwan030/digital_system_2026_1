`timescale 1ns/1ps

module tb_ander ();

	reg in1, in2;
	wire out;

ander ander_dut(
	.in1(in1),
       	.in2(in2), 
	.out(out)
);

initial 
	begin
		$monitor("Time=%0t | in1=%b, in2=%b | out=%b",
			 $time, in1, in2, out);
		in1 = 1'b0; in2 = 1'b0; #10
		in1 = 1'b0; in2 = 1'b1; #10
		in1 = 1'b1; in2 = 1'b0; #10
		in1 = 1'b1; in2 = 1'b1; #10
	       	$finish;
	end
endmodule
