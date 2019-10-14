module mux_2_1(A, B, sel, out);
	
	input A, B; 
	input sel;
	output out;
	
	assign out = ~sel & A | sel & B;
	
endmodule
