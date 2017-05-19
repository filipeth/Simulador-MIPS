module multiplex_memtoreg (clk, memtoreg, resultadoUla, readdata, saida, cont);
	input wire clk;
	input wire memtoreg;
	input wire [3:0] cont;
	input wire [31:0] resultadoUla;
	input wire [31:0] readdata;
	output reg [31:0] saida;

	always @(posedge clk) begin
		if(memtoreg==0 & cont == 7) begin
			 saida <= resultadoUla;
		end if(memtoreg==1 & cont == 9) begin
			 saida <= readdata;
		end
	end

endmodule
