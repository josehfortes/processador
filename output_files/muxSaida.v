module muxSaida (
flag,
saidaReg,
saidaIn,
saidaDado
);

input [31:0] saidaReg;
input [31:0] saidaIn;
input flag;

output reg [31:0] saidaDado;

always @ (*) begin
	if(flag == 1'b0)
	saidaDado = saidaReg;
	else
	saidaDado = saidaIn;
end



endmodule