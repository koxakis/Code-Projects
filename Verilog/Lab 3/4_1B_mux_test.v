`timescale 1ns/10ps
module muxB_4_1_test;
	
	wire out;
	reg A=0, B=1, C=0, D=1;
	reg sel0, sel1;
	
	initial
	begin
		$dumpfile("mux_4_1B_test.vcd");
		$dumpvars(0,muxB_4_1_test);
		$monitor("sel1 %b sel0 %b out %b", sel1, sel0, out);
		
		# 0 sel0 = 0;
		# 0 sel1 = 0;
		
		# 5 sel0 = 1;
		# 0 sel1 = 0;
		
		# 5 sel0 = 0;
		# 0 sel1 = 1;
		
		# 5 sel0 = 1;
		# 0 sel1 = 1;
		
		# 5 $finish;
		
	end
	
	muxB_4_1 m1 (A, B, C, D, sel0, sel1, out);
endmodule
