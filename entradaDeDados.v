module entradaDeDados(
chave,
dado_reg
);

input [7:0] chave;

output reg [31:0] dado_reg;

always @ (*) begin
	dado_reg = {24'd0 , chave};
	//dado_reg = chave + 32'b00000000000000000000000000000000;
end



endmodule
