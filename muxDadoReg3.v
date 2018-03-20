module muxDadoReg3(
dado_1,
dado_2,
controle,
saida
);

input [4:0] dado_1, dado_2;
input controle;

output reg [4:0] saida;

always @(dado_1 or dado_2 or controle) begin
	if(controle == 1'b1)
		saida = dado_2;
	else
		saida = dado_1;
end

endmodule
