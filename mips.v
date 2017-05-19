`include "somador_pc.v"
`include "contador_programa.v"
`include "memoria_instrucao.v"
`include "divisor_sinal.v"
`include "unidade_controle.v"
`include "registradores.v"
`include "memoria_dados.v"
`include "extensor_sinal.v"
`include "shift_left_branch.v"
`include "shift_left_jump.v"
`include "ula.v"
`include "controle_ula.v"
`include "multiplex_memtoreg.v"
`include "somador_branch.v"
`include "and_branch.v"
`include "multiplex_novopc.v"
`include "multiplex_alusrc.v"
`include "multiplex_regdest.v"

module mips();

//CONTADOR DE PROGRAMA

	reg clk;
	reg [3:0] cont;
	wire [31:0] endEntrada;
	wire [31:0] endSaida;

//SOMADOR PC

	wire [31:0] endSaida1;

//MEMORIA DE INSTRUCAO

	wire[31:0] instrucao;

//DIVISOR DE SINAL

	wire [5:0] opCode;
	wire [4:0] rA;
	wire [4:0] rB;
	wire [4:0] rC;
	wire [15:0] extensor;
	wire [25:0] jump;
	wire [5:0] funct;

//UNIDADE DE CONTROLE

	wire regdst;
	wire jump1;
	wire branch;
	wire memread;
	wire memtoreg;
	wire [1:0] aluop;
	wire memwrite;
	wire alusrc;
	wire regwrite;

//BANCO DE REGISTRADORES

	wire [31:0] wd; //saida do multiplex memtoreg
	wire [31:0] rd1;
	wire [31:0] rd2;

//MEMORIA DE DADOS

	wire [31:0] readdata;

//ULA

	wire zero;
	wire [31:0] saidaULA;

//SHIFT LEFT BRANCH
	
	wire [31:0] shift_left_branch;

//SHIFT LEFT JUMP

	wire [27:0] shift_left_jump;

//EXTENSOR SINAL

	wire [31:0] extensor_sinal;

//CONTROLE ULA

	wire [3:0] controle_ula;

//SOMADOR BRANCH

	wire [31:0] somador_branch;

//PORTA AND BRANCH

	wire and_branch;
	
//MULTIPLEXADOR PC+4 E BRANCH
	
	wire [31:0] multiplex_novopc;

//MULTIPLEXADOR ALUSRC

	wire [31:0] multiplex_alusrc;

//MULTIPLEXADOR REGDEST
	
	wire [4:0] multiplex_regdest;

	initial begin

		$monitor("clk=%d, cont=%d, wd=%d, rd1=%d, rd2=%d, aluop=%d, saidaULA=%d, ula=%d", clk, cont, wd, rd1, rd2, aluop, saidaULA, funct);
			clk=0;
			cont=0;

			#10 $finish;
	end

	always begin
		#1 clk = !clk;
		cont = cont+1;

		if(cont == 10) begin
			cont = 0;
		end

	end


	contador_programa m1(
		.clk(clk),
		.endEntrada(endSaida1),
		.endSaida(endSaida),
		.cont(cont)
		);
	somador_pc m2(
		.endEntrada(endSaida),
		.endSaida(endSaida1)
		);
	memoria_instrucao m3(
		.endEntrada(endSaida),
		.instrucao(instrucao)
		);
	divisor_sinal m4(
		.clk(clk),
		.instrucao(instrucao),
		.opCode(opCode),
		.rA(rA),
		.rB(rB),
		.rC(rC),
		.extensor(extensor),
		.jump(jump),
		.funct(funct),
		.cont(cont)
		);
	unidade_controle m5(
		.opCode(opCode),
		.regdst(regdst),
		.jump(jump1),
		.branch(branch),
		.memtoreg(memtoreg),
		.memread(memread),
		.memwrite(memwrite),
		.aluop(aluop),
		.alusrc(alusrc),
		.regwrite(regwrite)
		);
	registradores m6(
		.clk(clk),
		.rr1(rA),
		.rr2(rB),
		.wr(multiplex_regdest),
		.wd(wd),
		.rd1(rd1),
		.rd2(rd2),
		.regwrite(regwrite),
		.cont(cont)
		);
	multiplex_alusrc m17(
		.clk(clk),
		.entradaA(rd2),
		.entradaB(extensor_sinal),
		.alusrc(alusrc),
		.saida(multiplex_alusrc),
		.cont(cont)
		);
	memoria_dados m7(
		.clk(clk),
		.endereco(saidaULA),
		.dado(rd2),
		.memwrite(memwrite),
		.memread(memread),
		.readdata(readdata),
		.cont(cont)
		);
	ula m8(
		.clk(clk),
		.aluop(controle_ula),
		.dado1(rd1),
		.dado2(multiplex_alusrc),
		.zero(zero),
		.resultado(saidaULA),
		.cont(cont)
		);
	extensor_sinal m9(
		.extEntrada(extensor),
		.extSaida(extensor_sinal)
		);
	shift_left_jump m10(
		.entrada(jump),
		.saida(shift_left_jump)
		);
	shift_left_branch m11(
		.entrada(extensor_sinal),
		.saida(shift_left_branch)
		);
	controle_ula m12(
		.aluop(aluop),
		.funct(funct),
		.saida(controle_ula)
		);
	multiplex_memtoreg m13(
		.clk(clk),
		.memtoreg(memtoreg),
		.resultadoUla(saidaULA),
		.readdata(readdata),
		.saida(wd),
		.cont(cont)
		);
	somador_branch m14(
		.entradaA(endSaida1),
		.entradaB(shift_left_branch),
		.saida(somador_branch)
		);
	and_branch m15(
		.branch(branch),
		.zero(zero),
		.saida(and_branch)
		);
	multiplex_novopc m16(
		.entradaA(endSaida1),
		.entradaB(somador_branch),
		.and_branch(and_branch),
		.saida(endEntrada),
		.cont(cont)
		);
	multiplex_regdest m18(
		.clk(clk),
		.cont(cont),
		.entradaA(rB),
		.entradaB(rC),
		.regdest(regdst),
		.saida(multiplex_regdest)
		);
endmodule
