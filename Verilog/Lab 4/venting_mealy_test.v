`timescale 1ns/10ps
module venting_mealy_test;
	
	reg clk = 0;  
	reg reset = 1;
	reg in5 = 0;
	reg in10 = 0;
	
	wire door;
	
	always #1 clk = ~clk;
	
	initial 
	begin
		$dumpfile("venting_mealy_test.vcd");
		$dumpvars(0, venting_mealy_test);
		$monitor("in5 %b in10 %b door %b", in5, in10, door);
		
		# 5 reset <= 0;
		
		# 5 in10 <= 1;
		# 5 in10 <= 0;
		
		# 5 in5 <= 1;
		# 5 in5 <= 0;
		
		# 5 in5 <= 1;
		# 5 in5 <= 0;
		
		# 5 in10 <= 1;
		# 5 in10 <= 0;
		
		# 50 $finish; 
		
	end
	venting_mealy v1 (clk, reset, in5, in10, door);
endmodule
