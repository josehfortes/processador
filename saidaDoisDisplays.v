module saidaDoisDisplays(
numero,
unidade,
dezena
);

input [31:0] numero;
output reg [3:0] unidade;
output reg [3:0] dezena;
reg [31:0] aux;
integer i;


always @ (numero) begin
	unidade = 4'b0000;
	dezena = 4'b0000;
	if(numero[7] == 0) begin
			for(i = 7; i >=0; i = i-1) begin
				if(dezena >= 5) dezena = dezena + 4'd3;
				if(unidade >= 5) unidade = unidade + 4'd3;
				dezena = dezena << 1;
				dezena[0] = unidade[3];
				unidade = unidade << 1;
				unidade[0] = numero[i];
			end
		end
end
endmodule
