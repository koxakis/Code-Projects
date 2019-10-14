module converter_8_16 (unsigned_in, sign_in, sign_out);
	
	input [7:0] unsigned_in;
	input sign_in;
	
	output [15:0] sign_out;
	
	wire [15:0] unsigned_tmp = {16'b00000000 , unsigned_in};
	
	assign sign_out = sign_in ? (~unsigned_tmp) + 1'b1 : unsigned_tmp;
	
endmodule
