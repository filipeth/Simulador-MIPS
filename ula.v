module ula(clk, aluop, dado1, dado2, zero, resultado, cont);
 
    input wire [3:0] aluop;
    input wire clk;
    input wire [31:0] dado1;
    input wire [31:0] dado2;
    input wire [3:0] cont;
    output reg  zero;
    output reg [31:0] resultado; 
	
	always @ (dado1 or dado2) begin
	if(cont == 6) begin
		case(aluop)
		
		//add
		2:begin
		
			resultado = dado1 + dado2;
			
			if(resultado == 0)begin
				zero = 1;
			end
			
			else zero = 0;
		end
		
		//sub
		6:begin
			
			resultado = dado1 - dado2;
			
			if (resultado == 0)begin 
                zero = 1;
            end
            
			else zero = 0;
		end
		
		//or 		
		1:begin
		
			resultado = dado1 || dado2;

            if (resultado == 0)begin 
                zero = 1;
            end
			
            else zero = 0;
		end
			
		//and
		0:begin
		
			resultado = dado1 && dado2;

            if (resultado == 0)begin 
                zero = 1;
            end
			
            else zero = 0;
		end
			
		//slt
		7:begin
		
			resultado = dado1 < dado2;

            if (resultado == 0)begin 
                zero = 1;
            end
			
            else zero = 0;
        end
		
		default: begin
			zero=0;
		end
		
		endcase
	end
	end
	
endmodule

// module teste ();
// 	reg clk;
// 	reg [3:0] cont;
// 	reg [3:0] aluop;
// 	reg [31:0] dado1;
// 	reg [31:0] dado2;
// 	wire zero;
// 	wire [31:0] resultado;

// 	initial begin
// 		$monitor("clk=%d, cont=%d, aluop=%d, dado1=%d, dado2=%d, resultado=%d", clk, cont, aluop, dado1, dado2, resultado);
// 			clk=0;
// 			cont=5;
// 			aluop =2;
// 			dado1=0;
// 			dado2=1;
// 			#4 $finish;
// 	end
// 	always begin
// 		#1 clk = !clk;
// 		cont = cont+1;

// 		if(cont == 10) begin
// 			cont = 0;
// 		end
// 	end
// 	ula a(clk, aluop, dado1, dado2, zero, resultado, cont);

// endmodule
