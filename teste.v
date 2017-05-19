module teste (a, b, c);
	input wire [10:0] a;
	input wire [10:0] b;
	output reg [10:0] c;
	always @(a or b) begin
		if((a==5 | a==3) & b==5 ) begin
			c <= 0;
		end else begin
			c <= 15;
		end

	end

endmodule

module a();
	reg [10:0] a;
	reg [10:0] b;
	wire [10:0] c;
	initial begin
		$monitor("a=%d, b=%d, c=%d", a, b, c);
			a=2;
			b=3;
			#1 a=5;
			#1 a=4;
			b=5;

			#1 $finish;
	end
	teste asdf(a,b,c);
endmodule