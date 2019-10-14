module venting_mealy (clk, reset, in5, in10, door);
	
	input clk, in5, in10, reset;
	
	output reg door;
	
	reg [1:0] state;
	reg [1:0] n_state;
	
	parameter zero_cents = 2'b00, five_cents = 2'b01, ten_cents = 2'b10, fifteen_cents = 2'b11; 
	
	always @ (in5 or in10 or state)
		
		case (state)
			zero_cents:
			begin
				if (in10)
				begin
					n_state = ten_cents;
					door = 0;
				end
				
				else if (in5)
				begin
					n_state = five_cents;
					door = 0;
				end
				
				else
				begin
					n_state = zero_cents;
					door = 0;
				end
			end
			
			five_cents:
			begin
				if (in5)
				begin
					n_state = ten_cents;
					door = 0;
				end
				
				else if (in10)
				begin
					n_state = fifteen_cents;
					door = 0;
				end
				
				else 
				begin
					n_state = five_cents;
					door = 0;
				end
			end
			
			ten_cents:
			begin
				if (in5)
				begin
					n_state = fifteen_cents;
					door = 0;
				end
				
				else if(in10)
				begin
					n_state = zero_cents;
					door = 1;
				end
				
				else
				begin
					n_state = ten_cents;
					door = 0;
				end
			end
			
			fifteen_cents:
			begin
				if (in5 || in10)
				begin
					n_state = zero_cents;
					door = 1;
				end
				
				else 
				begin
					n_state = fifteen_cents;
					door = 0;
				end
				
			end
		endcase
		
	always @ (posedge clk)
		if (reset)
			state <= zero_cents;
		else
			state <= n_state;
	
endmodule
