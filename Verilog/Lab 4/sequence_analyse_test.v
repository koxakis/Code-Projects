`timescale 1ns/10ps
module sequence_analyse_test;
	
	reg clk = 0;  
	reg rst = 1;
	reg in = 0;
	
	wire out;
	
	always #1 clk = ~clk;
	
	initial 
	begin
		$dumpfile("sequence_analyse_test.vcd");
		$dumpvars(0, sequence_analyse_test);
		$monitor("in %b out %b", in, out);
		 
		
		# 5 rst <= 0;
		
		# 0 in <= 1;
		# 5 in <= 0;
		# 5 in <= 1;
		# 5 in <= 1;
		# 5 in <= 0;
		# 5 in <= 0;
		# 5 in <= 1; 
		# 0 in <= 0;
		
		# 5 in <= 1;
		# 5 in <= 0; 
		# 0 in <= 1;
		
		# 500 $finish; 
		
	end
	sequence_analyse s1 ( in, out, clk, rst);
endmodule
