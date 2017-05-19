module contador_programa (clk, endEntrada, endSaida, cont);
	input wire clk;
	input wire [3:0] cont;
	input wire [31:0] endEntrada;
	output reg [31:0] endSaida;
	reg inicio=1;

	
	always @(posedge clk) begin
			if(inicio) begin
				endSaida =0;
				inicio=0;
			end else begin
				if(cont == 1) begin 
					endSaida = endEntrada;
				end
			end
	end
	
endmodule

// module teste ();
// 	reg [31:0] endEntrada;
// 	reg clk;
// 	wire [31:0] endSaida;
// 	initial begin
// 		$monitor("clk=%d, endEntrada=%d, endSaida=%d", clk, endEntrada, endSaida);
// 			clk=0;
// 			endEntrada=0;
// 			#2 endEntrada=1;
// 			#2 endEntrada=2;
// 			#2 endEntrada=3;
// 			#2 endEntrada=4;
// 			#1 $finish;
// 	end
// 	always begin
// 		#1 clk = !clk;
// 	end
// 	contador_programa a(clk, endEntrada, endSaida);
// endmodule