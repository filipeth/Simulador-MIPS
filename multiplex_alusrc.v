module multiplex_alusrc (clk, entradaA, entradaB, alusrc, saida, cont);
	input wire [31:0] entradaA;
	input wire [31:0] entradaB;
	input wire alusrc;
	input wire clk;
	input wire [3:0] cont;
	output reg [31:0] saida;

	always @(negedge clk) begin
		if (cont == 6) begin
			if(alusrc==0) begin
				saida <= entradaA;
			end else begin
				saida <= entradaB;
			end
		end
	end
endmodule
