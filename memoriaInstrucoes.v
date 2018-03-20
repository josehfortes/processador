module memoriaInstrucoes (
clk,
end_mem,
saida_instrucao
);

// INPUTS
input clk;
input [31:0]end_mem;

// OUTPUTS
output [31:0] saida_instrucao;

// VARIAVEIS INTERNAS
integer clockInicio = 0;
reg[31:0] mem_instrucoes [0:16];


always @ (posedge clk) begin
	if (clockInicio == 0) begin
	mem_instrucoes[0] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[1] = {6'b101001, 26'd0}; // alterna bios
	/*
		mem_instrucoes[0] = {6'b101000, 26'd0}; //nop
		mem_instrucoes[1] = {6'b000001, 5'd1, 21'd1}; //addi reg 1 = 1
		mem_instrucoes[2] = {6'b100001, 5'd2, 5'd1, 16'd0};
		mem_instrucoes[3] = {6'b000001, 5'd1, 21'd1}; //addi reg 1 = 1
		mem_instrucoes[4] = {6'b111110, 5'd1, 5'd1, 16'd0}; //hdins
		mem_instrucoes[5] = {6'b000001, 5'd1, 21'd2}; //addi reg 1 = 2
		mem_instrucoes[6] = {6'b111110, 5'd1, 5'd1, 16'd1}; //hdins
		mem_instrucoes[7] = {6'b101001, 26'dx}; //HLT - SAI DA BIOS
		//mem_instrucoes[8] = {6'b000001, 5'd1, 21'd5}; //addi
		//mem_instrucoes[3] = {6'b111100, 5'd2, 5'd1, 16'd0}; //HDIN
		//mem_instrucoes[4] = {6'b100001, 5'd1, 5'd1, 16'd0}; //HDOUT
		//mem_instrucoes[5] = {6'b101001, 26'd0}; //HLT*/

/*		
//bios copiando as coisas do HD pra memoria de instrucao
mem_instrucoes[0] = {6'b101000, 26'd0}; //nop
mem_instrucoes[1] = {6'b011100, 26'd2}; //ir para main
mem_instrucoes[2] = {6'b101000, 26'd0}; //nop
mem_instrucoes[3] = {6'b000001, 5'd1, 21'd17}; //addi
mem_instrucoes[4] = {6'b000001, 5'd2, 21'd2}; //addi
mem_instrucoes[5] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
mem_instrucoes[6] = {6'b000001, 5'd1, 21'd4}; //addi
mem_instrucoes[7] = {6'b000001, 5'd2, 21'd2}; //addi
mem_instrucoes[8] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
mem_instrucoes[9] = {6'b000001, 5'd1, 21'd5}; //addi
mem_instrucoes[10] = {6'b000001, 5'd2, 21'd3}; //addi
mem_instrucoes[11] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
mem_instrucoes[12] = {6'b000001, 5'd1, 21'd18}; //addi
mem_instrucoes[13] = {6'b000001, 5'd2, 21'd0}; //addi
mem_instrucoes[14] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
mem_instrucoes[15] = {6'b101000, 26'd0}; //nop
mem_instrucoes[16] = {6'b000001, 5'd1, 21'd18}; //addi
mem_instrucoes[17] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
mem_instrucoes[18] = {6'b000001, 5'd3, 21'd17}; //addi
mem_instrucoes[19] = {6'b100000, 5'd3, 5'd3, 16'd0}; //lw
mem_instrucoes[20] = {6'b011011, 5'd1, 5'd3, 16'd22}; //blt       ------ INICIO W1
mem_instrucoes[21] = {6'b011100, 26'd63}; //goto
mem_instrucoes[22] = {6'b000001, 5'd1, 21'd19}; //addi
mem_instrucoes[23] = {6'b000001, 5'd3, 21'd0}; //addi
mem_instrucoes[24] = {6'b100001, 5'd3, 5'd1, 16'd0}; //store
mem_instrucoes[25] = {6'b101000, 26'd0}; //nop
mem_instrucoes[26] = {6'b000001, 5'd1, 21'd19}; //addi
mem_instrucoes[27] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
mem_instrucoes[28] = {6'b000001, 5'd3, 21'd4}; //addi
mem_instrucoes[29] = {6'b000001, 5'd4, 21'd18}; //addi
mem_instrucoes[30] = {6'b100000, 5'd4, 5'd4, 16'd0}; //lw
mem_instrucoes[31] = {6'b000000, 5'd3, 5'd4, 5'd3, 11'd0}; //add
mem_instrucoes[32] = {6'b100000, 5'd3, 5'd3, 16'd0}; //lw
mem_instrucoes[33] = {6'b011011, 5'd1, 5'd3, 16'd35}; //blt         ------ INICIO W2
mem_instrucoes[34] = {6'b011100, 26'd54}; //goto
mem_instrucoes[35] = {6'b000001, 5'd1, 21'd19}; //addi
mem_instrucoes[36] = {6'b000001, 5'd4, 21'd18}; //addi
mem_instrucoes[37] = {6'b100000, 5'd4, 5'd4, 16'd0}; //lw           REG_4 TEM O VALOR DE POS18 = QTPROGRAMI
mem_instrucoes[38] = {6'b000001, 5'd5, 21'd19}; //addi
mem_instrucoes[39] = {6'b100000, 5'd5, 5'd5, 16'd0}; //lw           REG_5 TEM O VALOR DE POS19 = I
mem_instrucoes[40] = {6'b111111, 5'd4, 5'd4, 5'd4, 11'd0}; //ALTERA O CONTEXTO COM O VALOR DE QTPROGRAMI
mem_instrucoes[41] = {6'b111110, 5'd5, 5'd5, 5'd4, 11'd0}; // manda os arquivos do hd pra bios
mem_instrucoes[42] = {6'b101000, 26'd0}; //nop
mem_instrucoes[43] = {6'b101000, 26'd0}; //nop
mem_instrucoes[44] = {6'b101000, 26'd0}; //nop
mem_instrucoes[45] = {6'b101000, 26'd0}; //nop
mem_instrucoes[46] = {6'b000001, 5'd1, 21'd19}; //addi
mem_instrucoes[47] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
mem_instrucoes[48] = {6'b000001, 5'd5, 21'd1}; //addi
mem_instrucoes[49] = {6'b000000, 5'd1, 5'd5, 5'd31, 11'd0}; //add
mem_instrucoes[50] = {6'b000001, 5'd1, 21'd19}; //addi
mem_instrucoes[51] = {6'b000000, 5'd0, 5'd31, 5'd5, 11'd0}; //add
mem_instrucoes[52] = {6'b100001, 5'd5, 5'd1, 16'd0}; //store
mem_instrucoes[53] = {6'b011100, 26'd25}; //goto                  ------ FIM W2
mem_instrucoes[54] = {6'b101000, 26'd0}; //nop
mem_instrucoes[55] = {6'b000001, 5'd1, 21'd18}; //addi
mem_instrucoes[56] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
mem_instrucoes[57] = {6'b000001, 5'd5, 21'd1}; //addi
mem_instrucoes[58] = {6'b000000, 5'd1, 5'd5, 5'd31, 11'd0}; //add
mem_instrucoes[59] = {6'b000001, 5'd1, 21'd18}; //addi
mem_instrucoes[60] = {6'b000000, 5'd0, 5'd31, 5'd5, 11'd0}; //add
mem_instrucoes[61] = {6'b100001, 5'd5, 5'd1, 16'd0}; //store
mem_instrucoes[62] = {6'b011100, 26'd15}; //goto                  ------ FIM W1
mem_instrucoes[63] = {6'b101000, 26'd0}; //nop
mem_instrucoes[64] = {6'b101001, 26'd0}; //HLT
*/




		clockInicio <= 1'b1;
		
	end
end

assign saida_instrucao = mem_instrucoes[end_mem];

endmodule
