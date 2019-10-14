`timescale 1ns/10ps 
module test_8_16;
	
	wire [15:0] sign_out;
	reg sign_in = 0;
	reg [7:0] unsigned_in = 8'b00000111;
	reg clk = 0;
	always #1 clk = ~clk;
	
	initial
	begin
		$dumpfile("8_16_test.vcd");
		$dumpvars(0,test_8_16);
		$monitor("At sign_in %b, value = %b", sign_in ,sign_out);
		
		# 5 sign_in = 1;
		# 5 sign_in = 0;
		
		# 500 $finish;
		
	end
	
	converter_8_16 c1 (unsigned_in, sign_in, sign_out);
endmodule
