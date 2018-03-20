module muxInstrucoes(
dado_bios,
dado_inst,
controle,
saida,
flag_temporizador,
dado_temporizador
);

input [31:0] dado_bios, dado_inst, dado_temporizador;
input controle, flag_temporizador;

output reg [31:0] saida;

always @(dado_bios or dado_inst or controle) begin
	if(flag_temporizador == 1'b1) begin
		saida = dado_temporizador;
	end
	else begin
		if(controle == 1'b1)
			saida = dado_inst;
		else
			saida = dado_bios;
	end
	
end

endmodule
