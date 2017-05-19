module memoria_dados (clk, endereco, dado, memwrite, readdata, memread, cont);
	
	input wire [31:0] endereco;
	input wire clk;
	input wire [31:0] dado;
	input wire [3:0] cont;
	input wire memwrite;
	input wire memread;
	output reg [31:0] readdata;

	reg [31:0] Mem[0:31];

	initial $readmemb("memoria_dados.txt", Mem);

	always @(posedge clk) begin
		if(memread==1 & cont == 7)begin
			readdata <= Mem[endereco];
		end 
	end

	always @(negedge clk) begin
		if(memwrite==1 & cont == 8)begin
			Mem[endereco] = dado;
			$writememb("memoria_dados.txt", Mem);
		end
	end

endmodule
// module teste ();
// 	reg [31:0] endereco;
// 	reg [31:0] dado;
// 	reg memwrite;
// 	reg memread;
// 	wire [31:0] readdata;
// 	initial begin
// 		$monitor("end=%d, dado=%d, readdata=%d",endereco,dado,readdata);
// 		endereco=5;
// 		dado=1235;
// 		memread=1;
// 		memwrite=0;
// 		#1 endereco=3;
// 		memread=0;
// 		memwrite=1;
// 		$finish;
// 	end
// 	memoria_dados a(endereco, dado, memwrite, readdata, memread);
// endmodule