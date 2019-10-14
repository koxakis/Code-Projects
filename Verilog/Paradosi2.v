module NAND3 (a, b, c, f);

	input a, b, c;
	output f;
	
	assign f = ~(a & b & c);

endmodule