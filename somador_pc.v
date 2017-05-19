module somador_pc (endEntrada, endSaida);

	input wire [31:0] endEntrada;
	output reg [31:0] endSaida;

	always @(endEntrada) begin
		 endSaida <= endEntrada + 1;
	end



endmodule
// module teste ();
// 	reg [31:0] endEntrada;
// 	wire [31:0] endSaida;

// 	initial begin
// 		$monitor("endEntrada=%d, endSaida=%d", endEntrada, endSaida);
// 			endEntrada=1;
// 			#2 endEntrada=2;
// 			#1 $finish;
// 	end

// 	somador_pc ua(endEntrada,endSaida);
// endmodule
