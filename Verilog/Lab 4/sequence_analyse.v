module sequence_analyse( in, out, clk, rst);
	
	output reg out;
	input in, clk, rst;
	
	reg [1:0] c_state; 
	reg [1:0] n_state;
	
	parameter zero_0_1 = 2'b00, one_1 = 2'b10, one_0 = 2'b01; 
	
	always @ (in or c_state)
	begin
		
		n_state = c_state;
		out = 1'b0;
		
		case(c_state)
			
			zero_0_1: 
			begin
				if (in)
					begin
					n_state = one_1;
					out = 1'b0;
					end 
				else
					begin
					n_state = one_0;
					out = 1'b0;
					end 
			end
			
			one_1:
			begin
				if (in)
					begin
						n_state = one_1;
						out = 1'b1;
					end
				else
					begin
						n_state = one_0;
						out = 1'b0;
					end
			end
			
			one_0:
			begin
				if (in)
					begin
						n_state = one_1;
						out = 1'b0;
					end 
				else
					begin
						n_state = one_0;
						out = 1'b1;
					end
			end
			
			default:
			begin
				n_state = zero_0_1;
				out = 1'b0;
			end 
		endcase
	end
	
	always @ (posedge clk)
	begin
		if(rst)
			c_state <= zero_0_1;
		else
			c_state <= n_state;
	end  
	
endmodule
