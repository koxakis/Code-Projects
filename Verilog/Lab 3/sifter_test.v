`timescale 1ns/10ps
module Shifter_test;

	reg clk = 0;
	reg left_in = 0;
	reg LOAD = 0;
	reg [7:0] in;
	
	wire [7:0] out;
	
	always #1 clk = ~clk;
	
	initial 
	begin
	
		$dumpfile("Shifter_test.vcd");
		$dumpvars(0, Shifter_test);
		$monitor("in %b, left_in %b, out %b", in, left_in, out);
		
		# 0 in = 8'b00011000;
		//# 0 LOAD = 1; 
		//# 1 LOAD = 0;
		# 10 left_in = 1;
		
		# 25 in = 8'b11100111;
		
		# 5 left_in = 1;
		
		# 5 left_in = 0;
		
		# 5 left_in = 0;
		
		# 500 $finish;
	end
	
	shifter_8bit c1 (clk, left_in, LOAD, out, in);
endmodule
