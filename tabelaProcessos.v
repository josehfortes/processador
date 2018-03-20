module tabelaProcessos(
clk
);

input clk;

reg [31:0] tabela[11:0][10:0];
integer clockInicio = 0;

always @ (posedge clk) begin
	if (clockInicio == 0) begin
	
		tabela[1][0] = 0; //PC
		tabela[2][0] = 0; //PC
		
		tabela[1][1] = 1; //Executando?
		tabela[2][1] = 1; //Executando?
		
	end
end

endmodule