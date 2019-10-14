module muxB_4_1(A, B, C, D, sel0, sel1, out);

	input A, B, C, D;

	input sel0, sel1;
	output out;	

	wire mux0, mux1;

	mux_2_1 m0 (A, B, sel0, mux0);
	mux_2_1 m1 (C, D, sel0, mux1);
	mux_2_1 m2 (mux0, mux1, sel1, out);

endmodule

