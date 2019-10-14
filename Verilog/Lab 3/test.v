module test(signed_borat, unsigned_borat, is_nice, sexy_time);
	
	input [3:0] unsigned_borat;
	input sexy_time;
	reg [3:0] signed_tmp;
	output [3:0] signed_borat;
    input is_nice;
	
	always @ (posedge sexy_time)
	
		begin
		if (is_nice)
			begin
				signed_tmp <= unsigned_borat;
				signed_tmp[3] <= 1'b1;
			end
		else
			begin
				signed_tmp <=unsigned_borat;
				signed_tmp[3] <= 1'b0;
			end
		end
		
		assign signed_borat = signed_tmp;
		
	
endmodule