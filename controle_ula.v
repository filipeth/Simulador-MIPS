module controle_ula(aluop, funct, saida);
	
    input wire [1:0] aluop;
    input wire [5:0] funct;
    output reg [3:0] saida;
	
	always @ (aluop or funct) begin
	
	//LW SW
	if (aluop == 0) begin
		saida = 2;
	end
    
	//BEQ
    else   if (aluop == 1) begin
        saida = 6;
	end
       
	//ADD
	else   if (aluop == 2 && funct == 32) begin
        saida = 2;
    end
	
	//SUB
	else   if (aluop == 2 && funct == 34) begin
        saida = 6;
	end

	//AND
    else   if (aluop == 2 && funct == 36) begin
        saida = 0;
    end

	//OR
    else   if (aluop == 2 && funct == 37) begin
        saida = 1;
    end

    //slt
	else   if (aluop == 2 && funct == 42) begin
        saida = 7;
    end

    end
	
endmodule
// module teste();
// 	reg [1:0] aluop;
// 	reg [5:0] funct;
// 	wire [3:0] saida;

// 	initial begin
// 		$monitor("aluop=%d, funct=%d, saida=%d",aluop,funct,saida);
// 		aluop = 0;
// 		#1 aluop =2;
// 		funct =42;

// 		$finish;
// 	end
// 	controle_ula adsf (aluop, funct, saida);
// endmodule