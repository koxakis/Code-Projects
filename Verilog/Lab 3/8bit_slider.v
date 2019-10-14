module shifter_8bit(clk, left_in, LOAD, out, in);
	
	input clk, LOAD;
	input left_in;
	input [7:0] in;
	
	output [7:0] out;
	
	reg [7:0] tmp;
	
	always @ (posedge clk)
	begin
		
		if (LOAD)
			tmp = in;
		else
			if (left_in)
				tmp = {in[6:0], in[7]};
			else
				tmp = {in[0], in[7:1]};
	end
	
	assign out = tmp;
	
endmodule
