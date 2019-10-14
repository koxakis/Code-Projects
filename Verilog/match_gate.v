module match_gate(a, b, c, f);

	input a, b, c;
	output f;
	
	wire x, y, z;
	
	NAND2 U1 (a, b, x);
	
	NAND2 U2 (b, c, y);
	
	NAND2 U3 (a ,c , z);
	
	NAND3 U4 (x, y, z, f);
	
endmodule