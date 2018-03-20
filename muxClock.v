module muxClock(
controle,
clkAutomatico,
clkBotao,
Saida
);

input controle;
input clkAutomatico;
input clkBotao;

output reg Saida;

always @ (controle or clkAutomatico or clkBotao) begin
	if (controle == 1'b0)
		Saida = clkAutomatico;
	else
		Saida = clkBotao;
end

endmodule
