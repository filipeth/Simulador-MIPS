module shift_left_jump (entrada, saida);


    input wire [25:0] entrada;
    output reg [27:0] saida;
	
	always @ (entrada)
	
	saida <= entrada << 2;
	
endmodule