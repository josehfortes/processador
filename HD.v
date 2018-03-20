module HD(
clk,
endereco,
dado_escrita,
dado_saida,
escrita,
contexto,
clk_50
);

input clk;
input clk_50;
input escrita;
input [31:0] endereco;
input [31:0] dado_escrita; //primeiro reg
input [31:0] contexto;
integer clockInicio = 0;
integer contador = 0;

output reg [31:0] dado_saida;

reg [31:0] HD[3:0][50:0];



always @ (posedge clk) begin
	if(escrita) begin
		HD[contexto][endereco] <= dado_escrita;
	end
	if (clockInicio == 0) begin
		/*HD[0][0] = {6'b000000, 26'd44}; //nop
		HD[0][1] = {6'b000000, 26'd0};
		HD[0][2] = {6'b000000, 26'd1};
		HD[0][3] = {6'b000000, 26'd0};
		HD[0][4] = {6'b000000, 26'd0};
		HD[0][19] = {6'b000000, 26'd2};
		
		HD[1][0] = {6'b000000, 26'd55}; 
		HD[1][1] = {6'b000001, 26'd0};
		HD[1][2] = {6'b000001, 26'd1};
		HD[1][3] = {6'b000001, 26'd0};
		HD[1][4] = {6'b000001, 26'd0};
		
		HD[2][0] = {6'b000000, 26'd66}; //nop
		*/
		clockInicio <= 1'b1;
	end
end

always @ (posedge clk_50) begin
	dado_saida <= HD[contexto][endereco];
end

endmodule