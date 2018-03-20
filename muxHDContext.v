module muxHDContext(
dado_Reg,
dado_Context,
controle,
saida
);

input [31:0] dado_Reg, dado_Context;
input controle;

output reg [31:0] saida;

always @(dado_Reg or dado_Context or controle) begin
	if(controle)
		saida = dado_Context;
	else
		saida = dado_Reg;
end

endmodule
