module mux_4_1(A, B, C, D, sel0, sel1, out);

	input A, B, C, D;
	input sel0, sel1;

	output out;

	assign out = ( (~sel1 & ~sel0 & A) 
			| (~sel1 & sel0 & B) 
			| (sel1 & ~sel0 & C) 
			| (sel1 & sel0 & D) );

endmodule
