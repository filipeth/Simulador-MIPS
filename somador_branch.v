module somador_branch (entradaA, entradaB, saida);
	input wire [31:0] entradaA;
	input wire [31:0] entradaB;
	output reg [31:0] saida;

	always @(entradaA or entradaB) begin
		saida <= entradaA + entradaB;
	end

endmodule
// module teste ();

// 	reg [31:0] entradaA;
// 	reg [31:0] entradaB;
// 	wire [31:0] saida;

// 	initial begin
// 		$monitor("entradaA=%d, entradaB=%d, saida=%d",entradaA,entradaB,saida);
// 		entradaA = 10;
// 		entradaB = 5;
// 		#1 entradaA=3;
// 		entradaB=0;
// 		$finish;
// 	end
// 	somador_branch asdf (entradaA, entradaB, saida);

// endmodule