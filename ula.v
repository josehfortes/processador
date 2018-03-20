module ula(
dado_1,
dado_2,
result,
saida,
branch,
alu_op
);

input [31:0] dado_1;
input [31:0] dado_2;
input [5:0] alu_op;

output reg [31:0] result;
output reg [31:0] saida;
output reg branch;

always @ (*) begin
		case (alu_op[5:0])
			
			// Aritmetica
			6'b000000: begin result = dado_1 + dado_2; branch = 1'b0; saida = dado_1; end // soma com 2 regs
			6'b000001: begin result = dado_2; branch = 1'b0; saida = dado_1; end // soma de imediato com um reg
			6'b000010: begin result = dado_1 - dado_2; branch = 1'b0; saida = dado_1; end // subtrai com 2 regs
			6'b000011: begin result = dado_1 - dado_2; branch = 1'b0; saida = dado_1; end // subtrai um imediato com um reg
			6'b000100: begin result = dado_1 * dado_2; branch = 1'b0; saida = dado_1; end //multiplicacao
			6'b000101: begin result = dado_1 / dado_2; branch = 1'b0; saida = dado_1; end //divisao
			
			//logica
			6'b001000: begin result = dado_1 & dado_2; branch = 1'b0; saida = dado_1; end // AND
			6'b001001: begin result = dado_1 & dado_2; branch = 1'b0; saida = dado_1; end // ANDI
			6'b001010: begin result = dado_1 | dado_2; branch = 1'b0; saida = dado_1; end // OR
			6'b001011: begin result = dado_1 | dado_2; branch = 1'b0; saida = dado_1; end // ORI
			6'b001100: begin result = ~dado_1; branch = 1'b0; saida = dado_1; end // NOT
			6'b001101: begin result = dado_1 ^ dado_2; branch = 1'b0; saida = dado_1; end // XOR
			
			//deslocamento
			6'b010000: begin result = dado_1 << dado_2; branch = 1'b0; saida = dado_1; end // SLL
			6'b010001: begin result = dado_1 >> dado_2; branch = 1'b0; saida = dado_1; end // SRL
			6'b100010: begin result = dado_2;branch = 1'b0; saida = dado_1; end //MOV
			
			//lw e store
			
			6'b100000: begin
				result = dado_1;
				saida = dado_2;
				branch = 1'b0;
			end
			
			6'b100001: begin
				result = dado_1;
				saida = dado_2;
				branch = 1'b0;
			end
			
			//hdin e hdout
			6'b111100: begin
				result = dado_1;
				saida = dado_2;
				branch = 1'b0;
			end
			
			6'b111101: begin
				result = dado_1;
				saida = dado_2;
				branch = 1'b0;
			end
			//hdins
			6'b111110: begin
				result = dado_1;
				saida = dado_2;
				branch = 1'b0;
			end
			
			//ALTERCONTEXT
			6'b111111: begin
				result = dado_1;
				saida = dado_2;
				branch = 1'b1;
			end
			
			
			
			//branch
			6'b011000: begin
				result = dado_1;
				saida = dado_1;
				if (dado_1 == dado_2) branch = 1'b1;
				
				else branch = 1'b0;
			
			end
			
			
			6'b011001: begin 
			result = dado_1;
			saida = dado_1;
			if (dado_1 != dado_2) branch = 1'b1;
			else branch = 1'b0;
			
			end
			
			6'b011010: begin
			result = dado_1;
			saida = dado_1;
			if (dado_1 > dado_2) branch = 1'b1;
			else branch = 1'b0;
			
			end
			
			6'b011011: begin
			result = dado_1;
			saida = dado_1;
			if (dado_1 < dado_2) branch = 1'b1;
			else branch = 1'b0;
			
			end
			
			6'b011100: begin
			result = dado_1;
			branch = 1'b1;
			saida = dado_1;
			end
			
			6'b011101: begin
				branch = 1'b1;
				result = dado_1;
				saida = dado_1;
			end
			
			default: begin
				result = dado_1;
				branch = 1'b0;
				saida = dado_1;
			end
		endcase
		
	end
	


endmodule
