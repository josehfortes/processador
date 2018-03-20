module extensorDeBits(
entrada,
saida
);

input [15:0] entrada;
output reg [31:0] saida;

	always @ (entrada) begin
		if(entrada[15] == 1'b1) saida = entrada + 32'b11111111111111110000000000000000; //negativo
		else saida = entrada + 32'b00000000000000000000000000000000;
	end

endmodule