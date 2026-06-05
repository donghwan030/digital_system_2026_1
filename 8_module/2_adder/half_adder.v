module half_adder (
	a,
	b,
	sum,
	cout
);

input a, b;
output sum, cout;

xor U0 (sum, a, b);
nand (cout_bar, a, b);
not (cout, cout_bar);

endmodule
