module and_branch (branch, zero, saida);
	input wire branch;
	input wire zero;
	output reg saida;
	always @(branch or zero) begin
		if(branch == 1 & zero == 1) begin
			saida = 1;
		end else begin
			saida =0;
		end
	end
endmodule
// module teste ();

// 	reg branch;
// 	reg zero;
// 	wire saida;

// 	initial begin
// 		$monitor("branch=%d, zero=%d, saida=%d",branch,zero,saida);
// 		branch =1;
// 		zero =1;
// 		#1 zero=0;;
// 		$finish;
// 	end
// 	and_branch asdf (branch, zero, saida);

// endmodule