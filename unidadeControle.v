module unidadeControle(
clk,
opcode,
pc_reset,
mux_branch_instrucao,
mux_branch_ula_extensor,
memoria_registradores_escrita,
mux_registradores_dado_escrita,
mux_ula_regOrExtensor,
ula_op,
escrita_banco_memoria,
saida_dados,
mux_reg3,
flag_entrada,
flag_clock,
flag_hd_escrita,
flag_escrita_instrucoes,
mux_instrucoes,
altera_contexto,
mux_contexto_hd,
PAUSA
);


	input [5:0] opcode;
	input clk, flag_entrada;
	
	//flags
	output reg pc_reset, mux_branch_ula_extensor,
	memoria_registradores_escrita, mux_ula_regOrExtensor,
	escrita_banco_memoria, mux_reg3, flag_clock, flag_hd_escrita, flag_escrita_instrucoes,mux_instrucoes, altera_contexto, mux_contexto_hd;
	
	output reg [1:0] saida_dados, mux_branch_instrucao;
	output reg [2:0] mux_registradores_dado_escrita;
	
	output reg [5:0] ula_op;
	
	output reg PAUSA = 1'b0;
	
	
	
	//INSTRUCOES ARITMETICAS
	localparam [5:0] ADD = 6'b000000, ADDI = 6'b000001, ADDPC = 6'b000110, SUB = 6'b000010, SUBI = 6'b000011, MULT = 6'b000100, DIV = 6'b000101;
	
	//INSTRUÇÕES DE LÓGICA
	localparam [5:0] AND = 6'b001000, ANDI = 6'b001001, OR = 6'b001010, ORI = 6'b001011, NOT = 6'b001100, XOR = 6'b001101;
	
	//INSTRUÇOES DE DESLOCAMENTO
	localparam [5:0] SLL = 6'b010000, SRL = 6'b010001;
	
	//INSTRUÇOES DE BRANCH
	localparam [5:0] BEQ = 6'b011000, BNE = 6'b011001, BGT = 6'b011010, BLT = 6'b011011, JMP = 6'b011100, JMPR = 6'b011101;
	
	//INSTRUÇOES DE DADOS
	localparam [5:0] LW = 6'b100000, STORE = 6'b100001, MOV = 6'b100010;
	
	//INSTRUÇÕES DE CONTROLE
	localparam [5:0] NOP = 6'b101000, RESET = 6'b101010, HLT = 6'b101001;
	
	//INSTRUÇÕES I/O		
	localparam [5:0] OUT3 = 6'b111010, IN = 6'b111000, OUT = 6'b111001;
	
	//istrucoes I/O HD - instrucoes para o hd precisam de psasar o contexto 
	localparam [5:0] HDIN = 6'b111100, HDOUT = 6'b111101;
	
	//instrucao HD -> MEM INSTRUCOES
	localparam [5:0] HDINS = 6'b111110;
	
	//instrucao troca d contexto
	localparam [5:0] TROCACONT = 6'b111111;

	reg alternaBios = 1'b0;
	
	always @(negedge clk) begin
			if(PAUSA == 1'b1) begin
				PAUSA = ~flag_entrada;
				if (flag_entrada == 1'b1)
					mux_branch_instrucao = 2'b00;
			end
			else begin
				case (opcode[5:0])
					BLT: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b11;
						mux_branch_ula_extensor = 1'b0;
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'bxx;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
				
					BGT: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b11;
						mux_branch_ula_extensor = 1'b0;
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'bxx;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
				
					BNE: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b11;
						mux_branch_ula_extensor = 1'b0;
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'bxx;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
				
					BEQ: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b11;
						mux_branch_ula_extensor = 1'b0;
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'bxx;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					JMP: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b11;
						mux_branch_ula_extensor = 1'b0;
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'bxx;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					JMPR: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b11;
						mux_branch_ula_extensor = 1'b1;//seta que o dado vem da ula
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'bxx;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					SLL: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b000;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					SRL: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b000;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					IN: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b10;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b011;
						mux_ula_regOrExtensor = 1'bx;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						PAUSA = 1'b1;
						flag_clock = 1'b1;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					HLT: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'bxxx;
						mux_ula_regOrExtensor = 1'bx;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						if (alternaBios == 1'b0) begin
							alternaBios = 1'b1;
							mux_branch_instrucao = 2'b01;
						end
						else begin
							pc_reset = 1'b0;
						end
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					NOP: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'bxxx; //dado memoria
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					OUT3: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'bxxx;
						mux_ula_regOrExtensor = 1'bx;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b01;
						mux_reg3 = 1'b1;
						flag_clock = 1'b1;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
						
						
					ADD: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b000;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b1;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					ADDI: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b000;
						mux_ula_regOrExtensor = 1'b1;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					SUB: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b000;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b1;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					SUBI: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b000;
						mux_ula_regOrExtensor = 1'b1;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					MULT: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b000;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b1;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					DIV: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b000;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b1;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					MOV: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b000;
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					LW: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b001; //dado memoria
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					STORE: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'bxxx; //dado memoria
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b1;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					HDIN: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'bxxx; //dado memoria
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b1;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b1;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					HDOUT: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b010; //dado memoria
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b1;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					HDINS: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'b001; //dado memoria
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b1;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b1;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					TROCACONT: begin
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b11;
						mux_branch_ula_extensor = 1'b1;
						memoria_registradores_escrita = 1'b0;
						mux_registradores_dado_escrita = 3'b001; //dado memoria
						mux_ula_regOrExtensor = 1'b0;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b1;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b1;
						mux_contexto_hd = 1'b0;
					end
					
					ADDPC: begin //armazena o endereco do PC em algum lugar
						pc_reset = 1'b0;
						mux_branch_instrucao = 2'b00;
						mux_branch_ula_extensor = 1'bx;
						memoria_registradores_escrita = 1'b1;
						mux_registradores_dado_escrita = 3'b100;
						mux_ula_regOrExtensor = 1'b1;
						ula_op = opcode;
						escrita_banco_memoria = 1'b0;
						saida_dados = 2'b00;
						mux_reg3 = 1'b0;
						flag_clock = 1'b0;
						flag_hd_escrita = 1'b0;
						flag_escrita_instrucoes = 1'b0;
						mux_instrucoes = alternaBios;
						altera_contexto = 1'b0;
						mux_contexto_hd = 1'b0;
					end
					
					
				endcase
			end
	end

	
endmodule