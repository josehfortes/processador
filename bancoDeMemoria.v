module bancoDeMemoria(
clk,
endereco,
dado_escrita,
dado_saida,
escrita,
contexto,
clk_50
);

input clk;
input escrita;
input [31:0] endereco;
input [31:0] dado_escrita; //primeiro reg
input [31:0] contexto;
input clk_50;
output reg [31:0] dado_saida;

reg [31:0] mem_ram[3:0][50:0];

always @ (posedge clk) begin
	if(escrita == 1'b1) begin
		mem_ram[contexto][endereco] <= dado_escrita;
	end
end


always @ (posedge clk_50) begin
	dado_saida <= mem_ram[contexto][endereco];
end

endmodule