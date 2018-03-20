module muxUla (
regOrExtensor,
saidaReg,
saidaExtensor,
saidaDado
);

input [31:0] saidaReg;
input [31:0] saidaExtensor;
input regOrExtensor;

output reg [31:0] saidaDado;

always @ (saidaReg or saidaExtensor) begin
	if(regOrExtensor == 1'b0)
	saidaDado = saidaReg;
	else
	saidaDado = saidaExtensor;
end



endmodule