module divisor_sinal (clk, instrucao, opCode, rA, rB, rC, extensor, jump, funct, cont);
	input wire [31:0] instrucao;
	input wire clk;
	input wire [3:0] cont;
	output reg [5:0] opCode;
	output reg [4:0] rA;
	output reg [4:0] rB;
	output reg [4:0] rC;
	output reg [15:0] extensor;
	output reg [25:0] jump;
	output reg [5:0] funct;

	always @(posedge clk) begin 
		if (cont == 3) begin
			opCode 	 <= instrucao[31:26];
			rA	 <= instrucao[25:21];
			rB 	 <= instrucao[20:16];
			rC 	 <= instrucao[15:11];
			funct  <= instrucao[5:0];
			extensor   <= instrucao[15:0];
			jump  <= instrucao[25:0];
		end
	end
	
endmodule
// module teste ();
// 	reg [31:0] instrucao;
// 	reg clk;
// 	wire [5:0] opCode;
// 	wire [4:0] rA;
// 	wire [4:0] rB;
// 	wire [4:0] rC;
// 	wire [15:0] extensor;
// 	wire [25:0] jump;
// 	wire [5:0] ula;

// 	initial begin
// 		$monitor("clk=%d, instrucao=%d, opCode=%d, rA=%d, rB=%d, rC=%d, extensor=%d, jump=%d, ula=%d", clk, instrucao, opCode, rA, rB, rC, extensor, jump, ula);
// 			clk=0;
// 			instrucao=32'b00000000001000011111100000000000;
// 			#2 instrucao=32'b00000000000000010001100000000000;
// 			#2 instrucao=32'b00010000001000110000000000001111;
// 			#2 instrucao=32'b00001000000000000000000000010000;
// 			#2 instrucao=32'b10001110010100010000000001100100;
// 			#2 instrucao=32'b10101110010100010000000001100100;
// 			#1 $finish;
// 	end

// 	always begin
// 		#1 clk = !clk;

// 	end
// 	divisor_sinal a(clk, instrucao, opCode, rA, rB, rC, extensor, jump, ula);


// endmodule