`timescale 1ns/10ps
module mux_2_1_test;
	
	wire out;
	reg A, B;
	reg sel;
	
	initial
	begin
		$dumpfile("mux_2_1_test.vcd");
		$dumpvars(0,mux_2_1_test);
		$monitor("sel %b out %b", sel, out);
		
		# 0 sel = 0;
		# 0 A = 1;
		# 0 B = 0;
		
		# 5 sel = 0;
		# 5 sel = 1;
		
		# 5 $finish;
		
	end
	
	mux_2_1 m1 (A, B, sel, out);
endmodule
