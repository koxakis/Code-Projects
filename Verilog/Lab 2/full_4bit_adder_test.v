`timescale 1ns/10ps
module test;


  reg [3:0] a;
  reg [3:0] b;
  reg cin;
  
  wire [3:0] sum;
  wire cout;
  
  initial begin
     $dumpfile("full_4bit_adder_test.vcd");
     $dumpvars(0,test);
	 $monitor("At time %t,a = %b b = %b sum = %b cout = %b", $time, a, b, sum, cout);
	
	
	 # 0 cin = 0;
	 # 0 a = 4'b0000;
	 # 0 b = 4'b0000;
	 
	 # 10 cin = 1;
	 # 0 a = 4'b1111;
	 # 0 b = 4'b1111;
	 
	 # 5 cin = 0;
	 
	 # 10 cin = 0;
	 
	 # 15 cin = 0;
	 # 0 a = 4'b1001;
	 # 0 b = 4'b0110;
	 
     # 513 $finish;
  end

  full_4bit_adder c1 (a, b, cin, cout, sum);

    
endmodule // test
