module modB (
	wa,
	b,
	c,
	d
);

output wa;
input b, c, d;

bufif1 g1 (wa, b, cinvert);
not #(2, 6) n1(cinvert, int);
not #(6, 5) g2(int, c, d);

endmodule
