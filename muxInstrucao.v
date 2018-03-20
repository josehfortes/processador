module muxInstrucao(
controle,
branch,
endereco_branch,
endereco_instrucao,
endereco_antigo,
endereco_saida,
flag_pausa_contexto
);
	input branch;
	input [1:0] controle;
	input [31:0] endereco_branch;
	input [31:0] endereco_instrucao;
	input [31:0] endereco_antigo;
	output reg [31:0] endereco_saida;
	input flag_pausa_contexto;
	
	always @ (controle or branch or endereco_branch or endereco_instrucao) begin
		if(controle == 2'b11)
		begin
			if (branch == 1'b1)
				endereco_saida = endereco_branch;
			else begin
				if(flag_pausa_contexto == 1'b1) begin
					endereco_saida = endereco_antigo;
				end
				else begin
					endereco_saida = endereco_instrucao;
				end
			end
		end
		else begin
			if(flag_pausa_contexto == 1'b1) begin
				endereco_saida = endereco_antigo;
			end
			else begin
				if (controle == 2'b10)
				endereco_saida = endereco_antigo;
				else if (controle == 2'b01)
					endereco_saida = 31'd0;
				else
					endereco_saida = endereco_instrucao;
				end
			end
			
		end
		
		
endmodule
