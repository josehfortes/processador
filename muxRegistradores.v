module muxRegistradores(
dado_ula,
dado_memoria,
controle,
saida,
dado_input,
dado_HD,
dado_PC
);

	input [31:0] dado_ula;
	input [31:0] dado_memoria;
	input [31:0] dado_input;
	input [31:0] dado_HD;
	input [31:0] dado_PC;
	input [2:0] controle;
	
	output reg [31:0] saida;
	always @ (*) begin

		if(controle == 3'b000)
			saida = dado_ula;
		else if (controle == 3'b001)
			saida = dado_memoria;
		else if (controle == 3'b011)
			saida = dado_input;
		else if (controle == 3'b010)
			saida = dado_HD;
		else if (controle == 3'b100)
			saida = dado_PC;
		else
			saida = dado_PC;

	end


endmodule
