module somadorInstrucoes(
end_atual,
end_saida
);
	input [31:0] end_atual;
	
	output reg [31:0] end_saida;

	always @ (end_atual or end_saida) begin
		end_saida <= end_atual+1;
	end


endmodule