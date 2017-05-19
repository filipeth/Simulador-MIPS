module multiplex_novopc (entradaA, entradaB, and_branch, saida, cont);
	input wire [31:0] entradaA;
	input wire [31:0] entradaB;
	input wire and_branch;
	input wire [3:0] cont;
	output reg [31:0] saida;

	always @(entradaA or entradaB) begin
		if (cont == 9) begin
			if(and_branch) begin
				saida <= entradaB;
			end else begin
				saida <= entradaA;
			end
		end
	end
endmodule