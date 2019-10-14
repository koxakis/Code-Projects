module full_4bit_adder(a, b, cin, cout, sum);
	
	input [3:0]a;
	input [3:0]b;
	input cin;
	
	output [3:0]sum;
	output cout;
	
	wire cary1, cary2, cary3;
	
    full_adder add0(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .cout(cary1),
        .sum(sum[0])
    );

    full_adder add1(
        .a(a[1]),
        .b(b[1]),
        .cin(cin),
        .cout(cary2),
        .sum(sum[1])
    );

    full_adder add2(
        .a(a[2]),
        .b(b[2]),
        .cin(cin),
        .cout(cary3),
        .sum(sum[2])
    );

    full_adder add3(
        .a(a[3]),
        .b(b[3]),
        .cin(cin),
        .cout(cout),
        .sum(sum[3])
    );

	
endmodule
