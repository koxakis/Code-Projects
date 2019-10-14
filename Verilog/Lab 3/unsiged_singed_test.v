`timescale 1ns/10ps 
module test_8_16;
	
	wire [3:0] signed_borat;
	reg is_nice = 0;
	reg [3:0] unsigned_borat = 4'b0000;
	reg sexy_time = 0;
	always #1 sexy_time = ~sexy_time;
	
	initial
	begin
		$dumpfile("8_16_test.vcd");
		$dumpvars(0,test_8_16);
		
		# 10 is_nice = 1;
		# 20 unsigned_borat = 4'b1111;
		
		# 500 $finish;
		
	end
	
	test c1 (signed_borat, unsigned_borat, is_nice, sexy_time);
endmodule