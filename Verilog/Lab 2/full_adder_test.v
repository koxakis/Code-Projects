`timescale 1ns/10ps
module test;

  reg a=0;
  reg b=0;
  reg cin=0;
  
  wire sum;
  wire cout;
  
  initial begin
     $dumpfile("full_adder_test.vcd");
     $dumpvars(0,test);
	 $monitor("At time %t,a = %b b = %b sum = %b cout = %b", $time, a, b, sum, cout);
	
	  # 10 a = 1;
	  # 10 b = 1;
	  # 15 cin = 1;
	  # 20 a = 0;
	  # 15 b = 0;
	  # 15 cin = 0;
	  
     # 513 $finish;
  end

  full_adder c1 (a, b, cin, cout, sum);
    
endmodule // test
