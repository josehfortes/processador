module saidaDeDados(
clk,
controle,
dado_reg_1,
dado_reg_2,
dado_reg_result,
saida_1,
saida_2,
saida_result
);

input clk;
input [1:0] controle;
input [31:0] dado_reg_1;
input [31:0] dado_reg_2;
input [31:0] dado_reg_result;

output reg [31:0] saida_1 = 32'b00000000000000000000000000000000;
output reg [31:0] saida_2 = 32'b00000000000000000000000000000000;
output reg [31:0] saida_result = 32'b00000000000000000000000000000000;

always @ (*) begin
	if (controle == 2'b01) begin
		saida_1 = dado_reg_1;
		saida_2 = dado_reg_2;
		saida_result = dado_reg_result;
	end
	else if (controle == 2'b10) begin
		saida_result = dado_reg_result;
	end
	else begin
		saida_result = dado_reg_result;
	end
	
end




endmodule

