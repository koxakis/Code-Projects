module full_adder(a, b, cin, cout, sum);
	
	input a, b, cin;
	output cout, sum;
	
	wire x1, a1, a2;
	
	assign x1 = a ^ b;
	
	assign a1 = a & b;
	
	assign a2 = x1 & cin;
	
	assign sum = x1 ^ cin; 
	
	assign cout = a2 | a1;
	
	
endmodule
