module unidade_controle (opCode, regdst, jump, branch, memtoreg, memread, memwrite, aluop, alusrc, regwrite);
	input wire [5:0] opCode;
	output reg regdst;
	output reg jump;
	output reg branch;
	output reg memread;
	output reg memtoreg;
	output reg [1:0] aluop;
	output reg memwrite;
	output reg alusrc;
	output reg regwrite;

	always @(opCode) begin
		case (opCode)

			//INSTRUCAO TIPO R
			0:begin
				regdst 	 = 1;
				jump   	 = 0;
				branch 	 = 0;
				memtoreg = 1;
				memread  = 0;
				memwrite = 0;
				aluop  	 = 2'b10;
				alusrc   = 0;
				regwrite = 1;
			end
			//INSTRUCAO TIPO SW
			43:begin
				jump   	 = 0;
				branch 	 = 0;
				memread  = 0;
				memwrite = 1;
				aluop  	 = 2'b00;
				alusrc   = 1;
				regwrite = 0;
			end
			//INSTRUCAO TIPO LW
			35:begin
				regdst 	 = 0;
				jump   	 = 0;
				branch 	 = 0;
				memtoreg = 1;
				memread  = 1;
				aluop  	 = 2'b00;
				alusrc   = 1;
				regwrite = 1;
			end
			//INSTRUCAO BRANCH
			4:begin
				jump   	 = 0;
				branch 	 = 1;
				memread  = 0;
				memwrite = 0;
				aluop  	 = 2'b01;
				alusrc   = 0;
				regwrite = 0;
			end


			//INSTRUCAO JUMP
			2:begin
				jump 	 = 1;
			end
			default:begin
				regdst 	 = 0;
				jump   	 = 0;
				branch 	 = 0;
				memtoreg = 0;
				memread  = 0;
				memwrite = 0;
				aluop  	 = 2'b00;
				alusrc   = 0;
				regwrite = 0;
			end
		endcase
	end

endmodule
// module teste ();
// 	reg [5:0] opCode;
// 	wire regdst;
// 	wire jump;
// 	wire branch;
// 	wire memread;
// 	wire memtoreg;
// 	wire [1:0] aluop;
// 	wire memwrite;
// 	wire alusrc;
// 	wire regwrite;

// 	initial begin
// 		$monitor("opCode=%d, regdst=%d, jump=%d, branch=%d, memtoreg=%d, memread=%d, memwrite=%d, aluop=%d, alusrc=%d, regwrite=%d", opCode, regdst, jump, branch, memtoreg, memread, memwrite, aluop, alusrc, regwrite);
// 			opCode=0;
// 			#1 opCode=43;
// 			#1 opCode=35;
// 			#1 opCode=4;
// 			#1 opCode=2;

// 			#2 $finish;
// 	end

// 	unidade_controle m2(
// 		.opCode(opCode),
// 		.regdst(regdst),
// 		.jump(jump),
// 		.branch(branch),
// 		.memtoreg(memtoreg),
// 		.memread(memread),
// 		.memwrite(memwrite),
// 		.aluop(aluop),
// 		.alusrc(alusrc),
// 		.regwrite(regwrite)
// 		);
// endmodule