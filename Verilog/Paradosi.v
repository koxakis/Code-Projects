module NAND2(a, b, z);

	input a, b;
	output z;
	
	assign z = ~(a & b); 

endmodule