module top_mod;
	wire [2:0] v;
	wire w;

	// module instantiation by name
	
	modB b1 (
		.wa	(w	), 
		.b	(v[2]	), 
		.c	(v[1]	), 
		.d	(v[0]	)
	);
	
	// module instantition by order
	modB b2 (w, v[2], v[1], v[0]);
endmodule
