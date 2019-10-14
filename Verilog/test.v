module test;

	
	reg a, b, c;
	wire f;
	initial 
	begin 
		$dumpfile("test.vcd");
		$dumpvars(0,test);
		//$monitor("At time %t, value = %h (%0d)",$time, out, out);
	
		# 10 a = 1;
		# 10 b = 1;
		# 15 c = 1;
		# 20 a = 0;
		# 15 b = 0;
		# 15 c = 0;
	  
     # 513 $finish;
  end

	match_gate m1 (a, b, c, f);
endmodule