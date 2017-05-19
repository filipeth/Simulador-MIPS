module multiplex_regdest (clk, cont, entradaA, entradaB, regdest, saida);
	input wire [4:0] entradaA;
	input wire [4:0] entradaB;
	input wire clk;
	input wire [3:0] cont;
	input wire regdest;
	output reg [4:0] saida;

	always @(negedge clk) begin
		if(cont==4) begin
			if(regdest==1) begin
				saida <= entradaB;
			end else begin
				saida <= entradaA;
			end
		end
	end
endmodule
