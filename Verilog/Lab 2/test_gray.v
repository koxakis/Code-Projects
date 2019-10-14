`timescale 1ns/10ps
`include "gray_counter.v"
module test;


  reg clr = 0;
  initial begin
     $dumpfile("gray_test.vcd");
     $dumpvars(0,test);
     //$monitor("At time %t, count = %d",$time, out);

	clr = 0;
	# 1 clr = 1;
	# 2 clr = 0;

	# 50 clr = 1;
	# 51 clr = 0;

    # 513 $finish;
  end

  reg clk = 0;
  always #1 clk = !clk;

  wire [3:0] out;
  gray_counter c1 (out,clk,clr);

  initial
     $monitor("At time %t, value = %b (%0d)",$time, out, out);
endmodule // test
