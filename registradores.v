module registradores (clk, rr1, rr2, wr, wd, rd1, rd2, regwrite, cont);

	input wire clk;
	input wire [3:0] cont;
	input wire regwrite;
	input wire [4:0] rr1;
	input wire [4:0] rr2;
	input wire [4:0] wr;
	input wire [31:0] wd;
	output reg [31:0] rd1;
	output reg [31:0] rd2;

	// CRIA MATRIX COM 32 REGISTRADORES
	reg [31:0] Mem[0:31];


	initial  $readmemb ("registradores.txt", Mem); 

	always @(posedge clk) begin
		if(cont == 5) begin
			rd1<=Mem[rr1];
			rd2<=Mem[rr2];
		end
		if (cont== 9 & regwrite==1) begin
			Mem[wr] = wd;
			$writememb("registradores.txt", Mem);
		end
	end

	always @(negedge clk) begin
		if(regwrite & cont==6) begin
			Mem[wr] = wd;
			$writememb("registradores.txt", Mem);
		end
	end

endmodule

// module teste ();
// 	reg clk;
// 	reg [3:0] cont;
// 	reg [4:0] rr1;
// 	reg [4:0] rr2;
// 	reg [4:0] wr;
// 	reg [31:0] wd;
// 	reg regwrite;
// 	wire [31:0] rd1;
// 	wire [31:0] rd2;

// 	initial begin
// 		$monitor("clk=%d, rd1=%d, rd2=%d", clk, rd1, rd2);
// 			clk=0;
// 			cont=6;
// 			rr1=0;
// 			rr2=1;
// 			wr=31;
// 			wd=0;
// 			regwrite =1;
// 			#4 $finish;
// 	end
// 	always begin
// 		#1 clk = !clk;
// 		cont = cont+1;

// 		if(cont == 10) begin
// 			cont = 0;
// 		end
// 	end
// 	registradores a(clk, rr1, rr2, wr, wd, rd1, rd2, regwrite, cont);

// endmodule
