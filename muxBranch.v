module muxBranch(
controle,
endereco_extensor,
endereco_ula,
endereco_saida
);

input controle;
input [31:0] endereco_extensor;
input [31:0] endereco_ula;

output reg [31:0] endereco_saida;

always @ (controle or endereco_extensor or endereco_ula) begin
	if (controle == 1'b0)
		endereco_saida = endereco_extensor;
	else
		endereco_saida = endereco_ula;
end

endmodule
