module memoria_instrucao (endEntrada, instrucao);

	input wire [31:0] endEntrada;
	output reg [31:0] instrucao;

	reg [31:0] Mem[0:31];

	initial $readmemb("instrucoes.txt", Mem);

	always @(endEntrada) begin
		instrucao <= Mem[endEntrada];
	end
endmodule

// module teste ();
// 	reg [31:0] endEntrada;

// 	wire [31:0] instrucao;
// 	initial begin
// 		$monitor("endEntrada=%d, instrucao=%b", endEntrada, instrucao);

// 			endEntrada=0;
// 			#2 endEntrada=1;
// 			#2 endEntrada=2;
// 			#2 endEntrada=3;
// 			#2 endEntrada=4;
// 			#1 $finish;
// 	end

// 	memoria_instrucao a(endEntrada, instrucao);
// endmodule

