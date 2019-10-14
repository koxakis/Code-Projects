`timescale 1ns/10ps
module gray_counter(out,clk,clr);

	input clk, clr;

	output [3:0] out;

	reg [3:0] tmp;

	always @(posedge clk)
	begin

		if (clr)
			tmp <= 4'b0000;
		else
			tmp <= tmp + 1'b1;

	end

	assign out[3] = tmp[3];
	assign out[2] = tmp[3] ^ tmp[2];
	assign out[1] = tmp[2] ^ tmp[1];
	assign out[0] = tmp[1] ^ tmp[0];

endmodule
