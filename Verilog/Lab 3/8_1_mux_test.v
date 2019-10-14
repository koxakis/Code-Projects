`timescale 1ns/10ps
module mux_8_1_test;
	
	wire out;
	reg [7:0]in = 8'b01010101;
	reg [2:0]sel;
	
	initial
	begin
		$dumpfile("mux_8_1_test.vcd");
		$dumpvars(0,mux_8_1_test);
		$monitor("sel %b out %b", sel, out);
		
		# 0 sel = 3'b000;
		
		# 5 sel = 3'b001;
		
		# 5 sel = 3'b010;
		
		# 5 sel = 3'b011;
		
		# 5 sel = 3'b100;
		
		# 5 sel = 3'b101;
		
		# 5 sel = 3'b110;
		
		# 5 sel = 3'b111;
		
		# 5 $finish;
		
	end
	
	mux_8_1 m1 (in, sel, out);
endmodule
