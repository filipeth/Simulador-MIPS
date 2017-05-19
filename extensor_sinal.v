module extensor_sinal(extEntrada, extSaida);
	

	input wire [15:0] extEntrada;
	output reg [31:0] extSaida;

	always @ (extEntrada)

 extSaida <= { 16'b0000000000000000, extEntrada } ; 

endmodule
