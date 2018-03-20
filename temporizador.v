module temporizador (
clk,
end_pc,
saida_instrucao,
flag_pausa,
contexto
);

// INPUTS
input clk;
input [31:0]end_pc, contexto;

// OUTPUTS
output [31:0] saida_instrucao;
output reg flag_pausa;

// VARIAVEIS INTERNAS
integer clockInicio = 0;
reg[31:0] mem_instrucoes [0:10];
integer clockCounter = 0;
integer maxclock = 300;
integer maxInstructions = 4;

reg [31:0] pc_interno;


always @ (posedge clk) begin
	
	if(flag_pausa) begin
		pc_interno = pc_interno + 31'b1;
		
		if (pc_interno > maxInstructions) begin
			flag_pausa = 1'b0;
			pc_interno = 31'b0;
			clockCounter = 0;
		end		
		
	end
	else begin
		if(contexto != 31'd0) begin //- if para nao usar o temporizador durante a execucao do SO
			clockCounter = clockCounter + 1;
			if(clockCounter >= maxclock) begin
				//hora de trocar o contexto
				flag_pausa = 1'b1;
				clockCounter = 0;
				pc_interno = 31'b0;
			end
			
		end
		pc_interno = 31'b0;
	end



	if (clockInicio == 0) begin
		
		mem_instrucoes[0] = {6'b101000, 26'd0}; //nop
		mem_instrucoes[1] = {6'b000110, 5'd29, 21'd0}; //addpc - salva o pc no reg 29
		mem_instrucoes[2] = {6'b000001, 5'd1, 21'd337}; //addi reg 1 = - endereco do branch
		
		mem_instrucoes[3] = {6'b000001, 5'd2, 21'd0}; //addi reg 2 = - proximo contexto
		mem_instrucoes[4] = {6'b111111, 5'd1,5'd2,16'd0};//o primeior reg é o endereço do branch, o segundo reg é o prox contexto
		
		
		/*
		mem_instrucoes[0] = {6'b101000, 26'd0}; //nop
		mem_instrucoes[1] = {6'b000110, 5'd29, 21'd0}; //addpc - salva o pc no reg 29
		//reg 30 é o reg auxiliar
		//mem_instrucoes[2] = {6'b111010, 5'd29, 5'd29, 5'd29, 11'd0};//output pc
		
		
		mem_instrucoes[2] = {6'b000001, 5'd30, 21'd29}; //addi reg 30 = 29
		mem_instrucoes[3] = {6'b000001, 5'd11, 21'd1}; //addi reg 11 = 1
		mem_instrucoes[4] = {6'b111100, 5'd29, 5'd30, 5'd11, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[5] = {6'b111101, 5'd11, 5'd30, 5'd8, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
		mem_instrucoes[6] = {6'b111010, 5'd8, 5'd8, 5'd8, 11'd0}; //output hdout
		*/
		
		
		/*mem_instrucoes[4] = {6'b000001, 5'd10, 21'd2}; //addi reg 10 = 2
		mem_instrucoes[5] = {6'b000001, 5'd7, 21'd14}; //addi reg 7 = 14
		mem_instrucoes[6] = {6'b111100, 5'd7, 5'd30, 5'd10, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		
		mem_instrucoes[7] = {6'b000001, 5'd11, 21'd1}; //addi reg 11 = 1
		
		mem_instrucoes[8] = {6'b111101, 5'd11, 5'd30, 5'd19, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
		mem_instrucoes[9] = {6'b111010, 5'd29, 5'd29, 5'd29, 11'd0}; //output pc
		mem_instrucoes[10] = {6'b111010, 5'd19, 5'd19, 5'd19, 11'd0}; //output hdout <<< RESULTADO ERRADO!!!!
		mem_instrucoes[11] = {6'b000001, 5'd22, 21'd55}; //addi reg 10 = 2
		
		mem_instrucoes[12] = {6'b111111, 5'd22, 5'd10, 16'd0};//o primeior reg é o endereço do branch, o segundo reg é o prox contexto
		mem_instrucoes[13] = {6'b111101, 5'd10, 5'd30, 5'd19, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
		mem_instrucoes[14] = {6'b111010, 5'd19, 5'd19, 5'd19, 11'd0}; //output pc*/
		//troca o contexto
		
		//mem_instrucoes[2] = {6'b000001, 5'd30, 21'd0}; //addi reg 30 = 0

		/*
		mem_instrucoes[0] = {6'b101000, 26'd0}; //nop
		mem_instrucoes[1] = {6'b000110, 5'd29, 21'd0}; //addpc - salva o pc no reg 29
		mem_instrucoes[2] = {6'b000001, 5'd28, 21'd1}; //addi reg 28 = 1
		mem_instrucoes[3] = {6'b000001, 5'd30, 21'd0}; //addi reg 30 = 0
		mem_instrucoes[4] = {6'b111100, 5'd0, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[5] = {6'b000001, 5'd30, 21'd1}; //addi reg 30 = 1
		mem_instrucoes[6] = {6'b111100, 5'd1, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[7] = {6'b000001, 5'd30, 21'd2}; //addi reg 30 = 2
		mem_instrucoes[8] = {6'b111100, 5'd2, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[9] = {6'b000001, 5'd30, 21'd3}; //addi reg 30 = 3
		mem_instrucoes[10] = {6'b111100, 5'd3, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[11] = {6'b000001, 5'd30, 21'd4}; //addi reg 30 = 4
		mem_instrucoes[12] = {6'b111100, 5'd4, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[13] = {6'b000001, 5'd30, 21'd5}; //addi reg 30 = 5
		mem_instrucoes[14] = {6'b111100, 5'd5, 5'd30, 5'd28, 11'd0};; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[15] = {6'b000001, 5'd30, 21'd6}; //addi reg 30 = 6
		mem_instrucoes[16] = {6'b111100, 5'd6, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[17] = {6'b000001, 5'd30, 21'd7}; //addi reg 30 = 7
		mem_instrucoes[18] = {6'b111100, 5'd7, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[19] = {6'b000001, 5'd30, 21'd8}; //addi reg 30 = 8
		mem_instrucoes[20] = {6'b111100, 5'd8, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[21] = {6'b000001, 5'd30, 21'd9}; //addi reg 30 = 9
		mem_instrucoes[22] = {6'b111100, 5'd9, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[23] = {6'b000001, 5'd30, 21'd10}; //addi reg 30 = 10
		mem_instrucoes[24] = {6'b111100, 5'd10, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[25] = {6'b000001, 5'd30, 21'd11}; //addi reg 30 = 11
		mem_instrucoes[26] = {6'b111100, 5'd11, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[27] = {6'b000001, 5'd30, 21'd12}; //addi reg 30 = 12
		mem_instrucoes[28] = {6'b111100, 5'd12, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[29] = {6'b000001, 5'd30, 21'd31}; //addi reg 30 = 31
		mem_instrucoes[30] = {6'b111100, 5'd31, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO
		mem_instrucoes[31] = {6'b000001, 5'd30, 21'd29}; //addi reg 30 = 29 - salva o pc
		mem_instrucoes[32] = {6'b111100, 5'd29, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO DADO SEGUNDO POSICAO TERCEIRO CONTEXTO

		mem_instrucoes[33] = {6'b000001, 5'd1, 21'd347}; //addi reg 1 = 0 - endereco do branch
		mem_instrucoes[34] = {6'b000001, 5'd2, 21'd0}; //addi reg 2 = 0 - proximo contexto
		mem_instrucoes[35] = {6'b111111, 5'd1,5'd2,16'd0}; //o primeior reg é o endereço do branch, o segundo reg é o prox contexto
		*/
		
		
		clockInicio <= 1'b1;
		flag_pausa = 1'b0;
		pc_interno = 31'b0;
	end
	
	
	
end

assign saida_instrucao = mem_instrucoes[pc_interno];

endmodule
