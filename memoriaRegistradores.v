module memoriaRegistradores (
clk,

end_reg_1,
saida_dado_1,
dado_escrita,

end_reg_2,
saida_dado_2,

end_reg_3,
saida_dado_3,

escrita
);

// VARIAVEIS INTERNAS
parameter tamanho_palavra = 32;
parameter tam_memoria = 32;
integer i;

// INPUTS
input clk;
input [4:0] end_reg_1;
input [tamanho_palavra-1:0] dado_escrita; //?
input [4:0] end_reg_2;
input [4:0] end_reg_3;
input escrita;


// OUTPUTS
output [tamanho_palavra-1:0] saida_dado_1;
output [tamanho_palavra-1:0] saida_dado_2;
output [tamanho_palavra-1:0] saida_dado_3;

reg[tamanho_palavra-1:0] mem [0:tam_memoria-1];

always @ (posedge clk) begin
	if (escrita) begin
		mem[end_reg_3] = dado_escrita;
	end
end

assign saida_dado_1 = mem[end_reg_1];
assign saida_dado_2 = mem[end_reg_2];
assign saida_dado_3 = mem[end_reg_3];

endmodule

