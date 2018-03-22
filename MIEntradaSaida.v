module MIEntradaSaida (
clk,
clk_50,
end_mem,
saida_instrucao,
flag_escrita,
dado_escrita,
contexto
);

// INPUTS
input clk;
input clk_50;
input [31:0]end_mem;
input flag_escrita;
input [31:0]dado_escrita;
input [31:0] contexto;

integer clockInicio = 0;

// OUTPUTS
output reg [31:0] saida_instrucao;

// VARIAVEIS INTERNAS
integer contador = 0;
reg[31:0] mem_instrucoes [3:0][0:500];


always @ (posedge clk) begin
	if (flag_escrita == 1) begin
		mem_instrucoes[contexto][contador] <= dado_escrita; //nop
		contador = contador + 1;
	end
	

/*
initial 
begin : INIT*/
	if (clockInicio == 0) begin

	mem_instrucoes[0][0] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][1] = {6'b011100, 26'd71}; //ir para main
	mem_instrucoes[0][2] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][3] = {6'b000001, 5'd1, 21'd21}; //addi
	mem_instrucoes[0][4] = {6'b000001, 5'd2, 21'd0}; //addi
	mem_instrucoes[0][5] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[0][6] = {6'b000001, 5'd1, 21'd20}; //addi
	mem_instrucoes[0][7] = {6'b000001, 5'd3, 21'd14}; //addi
	mem_instrucoes[0][8] = {6'b100000, 5'd3, 5'd3, 16'd0}; //lw
	mem_instrucoes[0][9] = {6'b100001, 5'd3, 5'd1, 16'd0}; //store
	mem_instrucoes[0][10] = {6'b000001, 5'd1, 21'd20}; //addi
	mem_instrucoes[0][11] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][12] = {6'b000001, 5'd3, 21'd1}; //addi
	mem_instrucoes[0][13] = {6'b000000, 5'd1, 5'd3, 5'd31, 11'd0}; //add
	mem_instrucoes[0][14] = {6'b000001, 5'd1, 21'd20}; //addi
	mem_instrucoes[0][15] = {6'b000000, 5'd0, 5'd31, 5'd3, 11'd0}; //add
	mem_instrucoes[0][16] = {6'b100001, 5'd3, 5'd1, 16'd0}; //store
	mem_instrucoes[0][17] = {6'b000001, 5'd1, 21'd20}; //addi
	mem_instrucoes[0][18] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][19] = {6'b000001, 5'd4, 21'd13}; //addi
	mem_instrucoes[0][20] = {6'b100000, 5'd4, 5'd4, 16'd0}; //lw
	mem_instrucoes[0][21] = {6'b011010, 5'd1, 5'd4, 16'd23}; //bgt
	mem_instrucoes[0][22] = {6'b011100, 26'd26}; //goto
	mem_instrucoes[0][23] = {6'b000001, 5'd1, 21'd20}; //addi
	mem_instrucoes[0][24] = {6'b000001, 5'd4, 21'd1}; //addi
	mem_instrucoes[0][25] = {6'b100001, 5'd4, 5'd1, 16'd0}; //store
	mem_instrucoes[0][26] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][27] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][28] = {6'b000001, 5'd1, 21'd21}; //addi
	mem_instrucoes[0][29] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][30] = {6'b000001, 5'd4, 21'd0}; //addi
	mem_instrucoes[0][31] = {6'b011000, 5'd1, 5'd4, 16'd33}; //beq
	mem_instrucoes[0][32] = {6'b011100, 26'd70}; //goto
	mem_instrucoes[0][33] = {6'b000001, 5'd5, 21'd20}; //addi
	mem_instrucoes[0][34] = {6'b100000, 5'd5, 5'd5, 16'd0}; //lw
	mem_instrucoes[0][35] = {6'b000001, 5'd1, 21'd1}; //addi
	mem_instrucoes[0][36] = {6'b000000, 5'd1, 5'd5, 5'd1, 11'd0}; //add
	mem_instrucoes[0][37] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][38] = {6'b000001, 5'd4, 21'd1}; //addi
	mem_instrucoes[0][39] = {6'b011000, 5'd1, 5'd4, 16'd41}; //beq
	mem_instrucoes[0][40] = {6'b011100, 26'd51}; //goto
	mem_instrucoes[0][41] = {6'b000001, 5'd1, 21'd15}; //addi
	mem_instrucoes[0][42] = {6'b000001, 5'd5, 21'd20}; //addi
	mem_instrucoes[0][43] = {6'b100000, 5'd5, 5'd5, 16'd0}; //lw
	mem_instrucoes[0][44] = {6'b100001, 5'd5, 5'd1, 16'd0}; //store
	mem_instrucoes[0][45] = {6'b000001, 5'd1, 21'd20}; //addi
	mem_instrucoes[0][46] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][47] = {6'b000000, 5'd1, 5'd0, 5'd31, 11'd0}; //add
	mem_instrucoes[0][48] = {6'b000001, 5'd1, 21'd19}; //addi
	mem_instrucoes[0][49] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][50] = {6'b011101, 5'd1, 21'd0}; //jmpr
	mem_instrucoes[0][51] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][52] = {6'b000001, 5'd1, 21'd20}; //addi
	mem_instrucoes[0][53] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][54] = {6'b000001, 5'd5, 21'd1}; //addi
	mem_instrucoes[0][55] = {6'b000000, 5'd1, 5'd5, 5'd31, 11'd0}; //add
	mem_instrucoes[0][56] = {6'b000001, 5'd1, 21'd20}; //addi
	mem_instrucoes[0][57] = {6'b000000, 5'd0, 5'd31, 5'd5, 11'd0}; //add
	mem_instrucoes[0][58] = {6'b100001, 5'd5, 5'd1, 16'd0}; //store
	mem_instrucoes[0][59] = {6'b000001, 5'd1, 21'd20}; //addi
	mem_instrucoes[0][60] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][61] = {6'b000001, 5'd6, 21'd13}; //addi
	mem_instrucoes[0][62] = {6'b100000, 5'd6, 5'd6, 16'd0}; //lw
	mem_instrucoes[0][63] = {6'b011010, 5'd1, 5'd6, 16'd65}; //bgt
	mem_instrucoes[0][64] = {6'b011100, 26'd68}; //goto
	mem_instrucoes[0][65] = {6'b000001, 5'd1, 21'd20}; //addi
	mem_instrucoes[0][66] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][67] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][68] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][69] = {6'b011100, 26'd27}; //goto
	mem_instrucoes[0][70] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][71] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][72] = {6'b000001, 5'd1, 21'd13}; //addi
	mem_instrucoes[0][73] = {6'b000001, 5'd6, 21'd3}; //addi - quantidade de programas
	mem_instrucoes[0][74] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][75] = {6'b000001, 5'd1, 21'd14}; //addi
	mem_instrucoes[0][76] = {6'b000001, 5'd6, 21'd0}; //addi
	mem_instrucoes[0][77] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][78] = {6'b000001, 5'd1, 21'd23}; //addi
	mem_instrucoes[0][79] = {6'b000001, 5'd6, 21'd0}; //addi
	mem_instrucoes[0][80] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][81] = {6'b000001, 5'd1, 21'd2}; //addi
	mem_instrucoes[0][82] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][83] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][84] = {6'b000001, 5'd1, 21'd3}; //addi
	mem_instrucoes[0][85] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][86] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][87] = {6'b000001, 5'd1, 21'd4}; //addi
	mem_instrucoes[0][88] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][89] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][90] = {6'b000001, 5'd1, 21'd5}; //addi
	mem_instrucoes[0][91] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][92] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][93] = {6'b000001, 5'd1, 21'd6}; //addi
	mem_instrucoes[0][94] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][95] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][96] = {6'b000001, 5'd1, 21'd7}; //addi
	mem_instrucoes[0][97] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][98] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][99] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[0][100] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][101] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][102] = {6'b000001, 5'd1, 21'd9}; //addi
	mem_instrucoes[0][103] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][104] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][105] = {6'b000001, 5'd1, 21'd10}; //addi
	mem_instrucoes[0][106] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][107] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][108] = {6'b000001, 5'd1, 21'd11}; //addi
	mem_instrucoes[0][109] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][110] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][111] = {6'b000001, 5'd1, 21'd12}; //addi
	mem_instrucoes[0][112] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][113] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][114] = {6'b000001, 5'd6, 21'd18}; //addi
	mem_instrucoes[0][115] = {6'b000001, 5'd1, 21'd99}; //addi
	mem_instrucoes[0][116] = {6'b100001, 5'd1, 5'd6, 16'd0}; //store
	mem_instrucoes[0][117] = {6'b000001, 5'd31, 21'd18}; //addi
	mem_instrucoes[0][118] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	//mem_instrucoes[0][119] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	mem_instrucoes[0][119] = {6'b011100, 26'd336}; //vai direto pra execucao 
	mem_instrucoes[0][120] = {6'b111000, 5'd31, 21'd0}; //in
	mem_instrucoes[0][121] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][122] = {6'b000000, 5'd0, 5'd31, 5'd6, 11'd0}; //add
	mem_instrucoes[0][123] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][124] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][125] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][126] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][127] = {6'b000001, 5'd6, 21'd16}; //addi
	mem_instrucoes[0][128] = {6'b011001, 5'd1, 5'd6, 16'd130}; //bne
	mem_instrucoes[0][129] = {6'b011100, 26'd335}; //goto
	mem_instrucoes[0][130] = {6'b000001, 5'd6, 21'd18}; //addi
	mem_instrucoes[0][131] = {6'b000001, 5'd1, 21'd10}; //addi
	mem_instrucoes[0][132] = {6'b100001, 5'd1, 5'd6, 16'd0}; //store
	mem_instrucoes[0][133] = {6'b000001, 5'd31, 21'd18}; //addi
	mem_instrucoes[0][134] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[0][135] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	mem_instrucoes[0][136] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][137] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][138] = {6'b000001, 5'd6, 21'd1}; //addi
	mem_instrucoes[0][139] = {6'b011000, 5'd1, 5'd6, 16'd141}; //beq
	mem_instrucoes[0][140] = {6'b011100, 26'd184}; //goto
	mem_instrucoes[0][141] = {6'b111000, 5'd31, 21'd0}; //in
	mem_instrucoes[0][142] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][143] = {6'b000000, 5'd0, 5'd31, 5'd6, 11'd0}; //add
	mem_instrucoes[0][144] = {6'b100001, 5'd6, 5'd1, 16'd0}; //store
	mem_instrucoes[0][145] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][146] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][147] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][148] = {6'b000001, 5'd6, 21'd16}; //addi
	mem_instrucoes[0][149] = {6'b011001, 5'd1, 5'd6, 16'd151}; //bne
	mem_instrucoes[0][150] = {6'b011100, 26'd183}; //goto
	mem_instrucoes[0][151] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][152] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][153] = {6'b000001, 5'd7, 21'd13}; //addi
	mem_instrucoes[0][154] = {6'b100000, 5'd7, 5'd7, 16'd0}; //lw
	mem_instrucoes[0][155] = {6'b011011, 5'd1, 5'd7, 16'd158}; //blt
	mem_instrucoes[0][156] = {6'b011000, 5'd1, 5'd7, 16'd158}; //beq
	mem_instrucoes[0][157] = {6'b011100, 26'd171}; //goto
	mem_instrucoes[0][158] = {6'b000001, 5'd8, 21'd24}; //addi
	mem_instrucoes[0][159] = {6'b100000, 5'd8, 5'd8, 16'd0}; //lw
	mem_instrucoes[0][160] = {6'b000001, 5'd1, 21'd1}; //addi
	mem_instrucoes[0][161] = {6'b000000, 5'd1, 5'd8, 5'd1, 11'd0}; //add
	mem_instrucoes[0][162] = {6'b000001, 5'd7, 21'd1}; //addi
	mem_instrucoes[0][163] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][164] = {6'b000001, 5'd7, 21'd18}; //addi
	mem_instrucoes[0][165] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][166] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][167] = {6'b100001, 5'd1, 5'd7, 16'd0}; //store
	mem_instrucoes[0][168] = {6'b000001, 5'd31, 21'd18}; //addi
	mem_instrucoes[0][169] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[0][170] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	mem_instrucoes[0][171] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][172] = {6'b000001, 5'd7, 21'd18}; //addi
	mem_instrucoes[0][173] = {6'b000001, 5'd1, 21'd11}; //addi
	mem_instrucoes[0][174] = {6'b100001, 5'd1, 5'd7, 16'd0}; //store
	mem_instrucoes[0][175] = {6'b000001, 5'd31, 21'd18}; //addi
	mem_instrucoes[0][176] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[0][177] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	mem_instrucoes[0][178] = {6'b111000, 5'd31, 21'd0}; //in
	mem_instrucoes[0][179] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][180] = {6'b000000, 5'd0, 5'd31, 5'd7, 11'd0}; //add
	mem_instrucoes[0][181] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][182] = {6'b011100, 26'd145}; //goto
	mem_instrucoes[0][183] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][184] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][185] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][186] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][187] = {6'b000001, 5'd7, 21'd2}; //addi
	mem_instrucoes[0][188] = {6'b011000, 5'd1, 5'd7, 16'd190}; //beq
	mem_instrucoes[0][189] = {6'b011100, 26'd229}; //goto
	mem_instrucoes[0][190] = {6'b000001, 5'd7, 21'd18}; //addi
	mem_instrucoes[0][191] = {6'b000001, 5'd1, 21'd22}; //addi
	mem_instrucoes[0][192] = {6'b100001, 5'd1, 5'd7, 16'd0}; //store
	mem_instrucoes[0][193] = {6'b000001, 5'd31, 21'd18}; //addi
	mem_instrucoes[0][194] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[0][195] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	mem_instrucoes[0][196] = {6'b000001, 5'd1, 21'd2}; //addi
	mem_instrucoes[0][197] = {6'b000001, 5'd7, 21'd1}; //addi
	mem_instrucoes[0][198] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][199] = {6'b000001, 5'd1, 21'd3}; //addi
	mem_instrucoes[0][200] = {6'b000001, 5'd7, 21'd1}; //addi
	mem_instrucoes[0][201] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][202] = {6'b000001, 5'd1, 21'd4}; //addi
	mem_instrucoes[0][203] = {6'b000001, 5'd7, 21'd1}; //addi
	mem_instrucoes[0][204] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][205] = {6'b000001, 5'd1, 21'd5}; //addi
	mem_instrucoes[0][206] = {6'b000001, 5'd7, 21'd1}; //addi
	mem_instrucoes[0][207] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][208] = {6'b000001, 5'd1, 21'd6}; //addi
	mem_instrucoes[0][209] = {6'b000001, 5'd7, 21'd1}; //addi
	mem_instrucoes[0][210] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][211] = {6'b000001, 5'd1, 21'd7}; //addi
	mem_instrucoes[0][212] = {6'b000001, 5'd7, 21'd1}; //addi
	mem_instrucoes[0][213] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][214] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[0][215] = {6'b000001, 5'd7, 21'd1}; //addi
	mem_instrucoes[0][216] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][217] = {6'b000001, 5'd1, 21'd9}; //addi
	mem_instrucoes[0][218] = {6'b000001, 5'd7, 21'd1}; //addi
	mem_instrucoes[0][219] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][220] = {6'b000001, 5'd1, 21'd10}; //addi
	mem_instrucoes[0][221] = {6'b000001, 5'd7, 21'd1}; //addi
	mem_instrucoes[0][222] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][223] = {6'b000001, 5'd1, 21'd11}; //addi
	mem_instrucoes[0][224] = {6'b000001, 5'd7, 21'd1}; //addi
	mem_instrucoes[0][225] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][226] = {6'b000001, 5'd1, 21'd12}; //addi
	mem_instrucoes[0][227] = {6'b000001, 5'd7, 21'd1}; //addi
	mem_instrucoes[0][228] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][229] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][230] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][231] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][232] = {6'b000001, 5'd7, 21'd3}; //addi
	mem_instrucoes[0][233] = {6'b011000, 5'd1, 5'd7, 16'd235}; //beq
	mem_instrucoes[0][234] = {6'b011100, 26'd274}; //goto
	mem_instrucoes[0][235] = {6'b000001, 5'd7, 21'd18}; //addi
	mem_instrucoes[0][236] = {6'b000001, 5'd1, 21'd33}; //addi
	mem_instrucoes[0][237] = {6'b100001, 5'd1, 5'd7, 16'd0}; //store
	mem_instrucoes[0][238] = {6'b000001, 5'd31, 21'd18}; //addi
	mem_instrucoes[0][239] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[0][240] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	mem_instrucoes[0][241] = {6'b000001, 5'd1, 21'd2}; //addi
	mem_instrucoes[0][242] = {6'b000001, 5'd7, 21'd0}; //addi
	mem_instrucoes[0][243] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][244] = {6'b000001, 5'd1, 21'd3}; //addi
	mem_instrucoes[0][245] = {6'b000001, 5'd7, 21'd0}; //addi
	mem_instrucoes[0][246] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][247] = {6'b000001, 5'd1, 21'd4}; //addi
	mem_instrucoes[0][248] = {6'b000001, 5'd7, 21'd0}; //addi
	mem_instrucoes[0][249] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][250] = {6'b000001, 5'd1, 21'd5}; //addi
	mem_instrucoes[0][251] = {6'b000001, 5'd7, 21'd0}; //addi
	mem_instrucoes[0][252] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][253] = {6'b000001, 5'd1, 21'd6}; //addi
	mem_instrucoes[0][254] = {6'b000001, 5'd7, 21'd0}; //addi
	mem_instrucoes[0][255] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][256] = {6'b000001, 5'd1, 21'd7}; //addi
	mem_instrucoes[0][257] = {6'b000001, 5'd7, 21'd0}; //addi
	mem_instrucoes[0][258] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][259] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[0][260] = {6'b000001, 5'd7, 21'd0}; //addi
	mem_instrucoes[0][261] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][262] = {6'b000001, 5'd1, 21'd9}; //addi
	mem_instrucoes[0][263] = {6'b000001, 5'd7, 21'd0}; //addi
	mem_instrucoes[0][264] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][265] = {6'b000001, 5'd1, 21'd10}; //addi
	mem_instrucoes[0][266] = {6'b000001, 5'd7, 21'd0}; //addi
	mem_instrucoes[0][267] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][268] = {6'b000001, 5'd1, 21'd11}; //addi
	mem_instrucoes[0][269] = {6'b000001, 5'd7, 21'd0}; //addi
	mem_instrucoes[0][270] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][271] = {6'b000001, 5'd1, 21'd12}; //addi
	mem_instrucoes[0][272] = {6'b000001, 5'd7, 21'd0}; //addi
	mem_instrucoes[0][273] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][274] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][275] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][276] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][277] = {6'b000001, 5'd7, 21'd4}; //addi
	mem_instrucoes[0][278] = {6'b011000, 5'd1, 5'd7, 16'd280}; //beq
	mem_instrucoes[0][279] = {6'b011100, 26'd323}; //goto
	mem_instrucoes[0][280] = {6'b111000, 5'd31, 21'd0}; //in
	mem_instrucoes[0][281] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][282] = {6'b000000, 5'd0, 5'd31, 5'd7, 11'd0}; //add
	mem_instrucoes[0][283] = {6'b100001, 5'd7, 5'd1, 16'd0}; //store
	mem_instrucoes[0][284] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][285] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][286] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][287] = {6'b000001, 5'd7, 21'd16}; //addi
	mem_instrucoes[0][288] = {6'b011001, 5'd1, 5'd7, 16'd290}; //bne
	mem_instrucoes[0][289] = {6'b011100, 26'd322}; //goto
	mem_instrucoes[0][290] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][291] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][292] = {6'b000001, 5'd8, 21'd13}; //addi
	mem_instrucoes[0][293] = {6'b100000, 5'd8, 5'd8, 16'd0}; //lw
	mem_instrucoes[0][294] = {6'b011011, 5'd1, 5'd8, 16'd297}; //blt
	mem_instrucoes[0][295] = {6'b011000, 5'd1, 5'd8, 16'd297}; //beq
	mem_instrucoes[0][296] = {6'b011100, 26'd310}; //goto
	mem_instrucoes[0][297] = {6'b000001, 5'd9, 21'd24}; //addi
	mem_instrucoes[0][298] = {6'b100000, 5'd9, 5'd9, 16'd0}; //lw
	mem_instrucoes[0][299] = {6'b000001, 5'd1, 21'd1}; //addi
	mem_instrucoes[0][300] = {6'b000000, 5'd1, 5'd9, 5'd1, 11'd0}; //add
	mem_instrucoes[0][301] = {6'b000001, 5'd8, 21'd0}; //addi
	mem_instrucoes[0][302] = {6'b100001, 5'd8, 5'd1, 16'd0}; //store
	mem_instrucoes[0][303] = {6'b000001, 5'd8, 21'd18}; //addi
	mem_instrucoes[0][304] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][305] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[0][306] = {6'b100001, 5'd1, 5'd8, 16'd0}; //store
	mem_instrucoes[0][307] = {6'b000001, 5'd31, 21'd18}; //addi
	mem_instrucoes[0][308] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[0][309] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	mem_instrucoes[0][310] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][311] = {6'b000001, 5'd8, 21'd18}; //addi
	mem_instrucoes[0][312] = {6'b000001, 5'd1, 21'd44}; //addi
	mem_instrucoes[0][313] = {6'b100001, 5'd1, 5'd8, 16'd0}; //store
	mem_instrucoes[0][314] = {6'b000001, 5'd31, 21'd18}; //addi
	mem_instrucoes[0][315] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[0][316] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	mem_instrucoes[0][317] = {6'b111000, 5'd31, 21'd0}; //in
	mem_instrucoes[0][318] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][319] = {6'b000000, 5'd0, 5'd31, 5'd8, 11'd0}; //add
	mem_instrucoes[0][320] = {6'b100001, 5'd8, 5'd1, 16'd0}; //store
	mem_instrucoes[0][321] = {6'b011100, 26'd284}; //goto
	mem_instrucoes[0][322] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][323] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][324] = {6'b000001, 5'd8, 21'd18}; //addi
	mem_instrucoes[0][325] = {6'b000001, 5'd1, 21'd99}; //addi
	mem_instrucoes[0][326] = {6'b100001, 5'd1, 5'd8, 16'd0}; //store
	mem_instrucoes[0][327] = {6'b000001, 5'd31, 21'd18}; //addi
	mem_instrucoes[0][328] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[0][329] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	mem_instrucoes[0][330] = {6'b111000, 5'd31, 21'd0}; //in
	mem_instrucoes[0][331] = {6'b000001, 5'd1, 21'd24}; //addi
	mem_instrucoes[0][332] = {6'b000000, 5'd0, 5'd31, 5'd8, 11'd0}; //add
	mem_instrucoes[0][333] = {6'b100001, 5'd8, 5'd1, 16'd0}; //store
	mem_instrucoes[0][334] = {6'b011100, 26'd124}; //goto
	mem_instrucoes[0][335] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][336] = {6'b011100, 26'd403}; //jump
	mem_instrucoes[0][337] = {6'b101000, 26'd0}; //nop
	//salva o programa atual
	//armazena o contexto atual no REG 28 - o PC esta no reg 29
	//mem_instrucoes[0][338] = {6'b111010, 5'd29, 5'd29, 5'd29, 11'd0};//output pc- ATE AKI FUNCIONOU
	mem_instrucoes[0][338] = {6'b000001, 5'd28, 21'd23}; //addi
	mem_instrucoes[0][339] = {6'b100000, 5'd28, 5'd28, 16'd0}; //lw

	//mem_instrucoes[0][340] = {6'b000001, 5'd30, 21'd29}; //addi reg 30 = 29 - salva o pc

	//mem_instrucoes[0][341] = {6'b111100, 5'd28, 5'd30, 5'd29, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	//mem_instrucoes[0][342] = {6'b111101, 5'd28, 5'd30, 5'd29, 11'd0}; //hdout PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA

	//REG 28 = auxiliar que armazena o contexto atual
	//REG 29 = salva o PC
	//REG 30 = auxiliar de salvar contexto
	//mem_instrucoes[0][340] = {6'b111010, 5'd1, 5'd1, 5'd1, 11'd0};//output reg1
	mem_instrucoes[0][341] = {6'b000001, 5'd30, 21'd1}; //addi reg 30 = 1
	mem_instrucoes[0][342] = {6'b111100, 5'd28, 5'd30, 5'd1, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][343] = {6'b000001, 5'd30, 21'd2}; //addi reg 30 = 2
	mem_instrucoes[0][344] = {6'b111100, 5'd28, 5'd30, 5'd2, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][345] = {6'b000001, 5'd30, 21'd3}; //addi reg 30 = 3
	mem_instrucoes[0][346] = {6'b111100, 5'd28, 5'd30, 5'd3, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][347] = {6'b000001, 5'd30, 21'd4}; //addi reg 30 = 4
	mem_instrucoes[0][348] = {6'b111100, 5'd28, 5'd30, 5'd4, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][349] = {6'b000001, 5'd30, 21'd5}; //addi reg 30 = 5
	mem_instrucoes[0][350] = {6'b111100, 5'd28, 5'd30, 5'd5, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][351] = {6'b000001, 5'd30, 21'd6}; //addi reg 30 = 6
	mem_instrucoes[0][352] = {6'b111100, 5'd28, 5'd30, 5'd6, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][353] = {6'b000001, 5'd30, 21'd7}; //addi reg 30 = 7
	mem_instrucoes[0][354] = {6'b111100, 5'd28, 5'd30, 5'd7, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][355] = {6'b000001, 5'd30, 21'd8}; //addi reg 30 = 8
	mem_instrucoes[0][356] = {6'b111100, 5'd28, 5'd30, 5'd8, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][357] = {6'b000001, 5'd30, 21'd9}; //addi reg 30 = 9
	mem_instrucoes[0][358] = {6'b111100, 5'd28, 5'd30, 5'd9, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][359] = {6'b000001, 5'd30, 21'd10}; //addi reg 30 = 10
	mem_instrucoes[0][360] = {6'b111100, 5'd28, 5'd30, 5'd10, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][361] = {6'b000001, 5'd30, 21'd11}; //addi reg 30 = 11
	mem_instrucoes[0][362] = {6'b111100, 5'd28, 5'd30, 5'd11, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][363] = {6'b000001, 5'd30, 21'd12}; //addi reg 30 = 12
	mem_instrucoes[0][364] = {6'b111100, 5'd28, 5'd30, 5'd12, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][365] = {6'b000001, 5'd30, 21'd13}; //addi reg 30 = 13
	mem_instrucoes[0][366] = {6'b111100, 5'd28, 5'd30, 5'd13, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][367] = {6'b000001, 5'd30, 21'd14}; //addi reg 30 = 14
	mem_instrucoes[0][368] = {6'b111100, 5'd28, 5'd30, 5'd14, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][369] = {6'b000001, 5'd30, 21'd15}; //addi reg 30 = 15
	mem_instrucoes[0][370] = {6'b111100, 5'd28, 5'd30, 5'd15, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][371] = {6'b000001, 5'd30, 21'd16}; //addi reg 30 = 16
	mem_instrucoes[0][372] = {6'b111100, 5'd28, 5'd30, 5'd16, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][373] = {6'b000001, 5'd30, 21'd17}; //addi reg 30 = 17
	mem_instrucoes[0][374] = {6'b111100, 5'd28, 5'd30, 5'd17, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][375] = {6'b000001, 5'd30, 21'd18}; //addi reg 30 = 18
	mem_instrucoes[0][376] = {6'b111100, 5'd28, 5'd30, 5'd18, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][377] = {6'b000001, 5'd30, 21'd19}; //addi reg 30 = 19
	mem_instrucoes[0][378] = {6'b111100, 5'd28, 5'd30, 5'd19, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][379] = {6'b000001, 5'd30, 21'd20}; //addi reg 30 = 20
	mem_instrucoes[0][380] = {6'b111100, 5'd28, 5'd30, 5'd20, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][381] = {6'b000001, 5'd30, 21'd21}; //addi reg 30 = 21
	mem_instrucoes[0][382] = {6'b111100, 5'd28, 5'd30, 5'd21, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][383] = {6'b000001, 5'd30, 21'd22}; //addi reg 30 = 22
	mem_instrucoes[0][384] = {6'b111100, 5'd28, 5'd30, 5'd22, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][385] = {6'b000001, 5'd30, 21'd23}; //addi reg 30 = 23
	mem_instrucoes[0][386] = {6'b111100, 5'd28, 5'd30, 5'd23, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][387] = {6'b000001, 5'd30, 21'd24}; //addi reg 30 = 24
	mem_instrucoes[0][388] = {6'b111100, 5'd28, 5'd30, 5'd24, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][389] = {6'b000001, 5'd30, 21'd25}; //addi reg 30 = 25
	mem_instrucoes[0][390] = {6'b111100, 5'd28, 5'd30, 5'd25, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][391] = {6'b000001, 5'd30, 21'd26}; //addi reg 30 = 26
	mem_instrucoes[0][392] = {6'b111100, 5'd28, 5'd30, 5'd26, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	mem_instrucoes[0][393] = {6'b000001, 5'd30, 21'd27}; //addi reg 30 = 27
	mem_instrucoes[0][394] = {6'b111100, 5'd28, 5'd30, 5'd27, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	/*
	mem_instrucoes[0][395] = {6'b000001, 5'd30, 21'd28}; //addi reg 30 = 28
	mem_instrucoes[0][396] = {6'b111100, 5'd28, 5'd30, 5'd28, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	*/

	mem_instrucoes[0][397] = {6'b000001, 5'd30, 21'd29}; //addi reg 30 = 29
	mem_instrucoes[0][398] = {6'b111100, 5'd28, 5'd30, 5'd29, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	/*
	mem_instrucoes[0][399] = {6'b000001, 5'd30, 21'd30}; //addi reg 30 = 30
	mem_instrucoes[0][400] = {6'b111100, 5'd28, 5'd30, 5'd30, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA
	*/
	mem_instrucoes[0][401] = {6'b000001, 5'd30, 21'd31}; //addi reg 30 = 31
	mem_instrucoes[0][402] = {6'b111100, 5'd28, 5'd30, 5'd31, 11'd0}; //hdin PRIMEIRO CONTEXTO SEGUNDO ENDERECO TERCEIRO ESCRITA


	//parte que se repete sempre - busca o proximo programa
	mem_instrucoes[0][403] = {6'b000001, 5'd1, 21'd19}; //addi
	mem_instrucoes[0][404] = {6'b000001, 5'd8, 21'd407}; //addi
	mem_instrucoes[0][405] = {6'b100001, 5'd8, 5'd1, 16'd0}; //store
	mem_instrucoes[0][406] = {6'b011100, 26'd3}; //jump
	mem_instrucoes[0][407] = {6'b000001, 5'd1, 21'd23}; //addi
	mem_instrucoes[0][408] = {6'b000000, 5'd0, 5'd31, 5'd8, 11'd0}; //add
	mem_instrucoes[0][409] = {6'b100001, 5'd8, 5'd1, 16'd0}; //store
	mem_instrucoes[0][410] = {6'b000001, 5'd1, 21'd14}; //addi
	mem_instrucoes[0][411] = {6'b000001, 5'd9, 21'd23}; //addi
	mem_instrucoes[0][412] = {6'b100000, 5'd9, 5'd9, 16'd0}; //lw
	mem_instrucoes[0][413] = {6'b100001, 5'd9, 5'd1, 16'd0}; //store
	//inicia a troca de contexto
	// - carrega do HD para o registrador todos os regstradores
	//armazena o contexto atual no REG 28

	mem_instrucoes[0][414] = {6'b000001, 5'd28, 21'd23}; //addi
	mem_instrucoes[0][415] = {6'b100000, 5'd28, 5'd28, 16'd0}; //lw

	//contexto armazenad no reg 28

	mem_instrucoes[0][418] = {6'b000001, 5'd30, 21'd1}; //addi reg 30 = 1
	mem_instrucoes[0][419] = {6'b111101, 5'd28, 5'd30, 5'd1, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3

	mem_instrucoes[0][420] = {6'b000001, 5'd30, 21'd2}; //addi reg 30 = 2
	mem_instrucoes[0][421] = {6'b111101, 5'd28, 5'd30, 5'd2, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3

	mem_instrucoes[0][422] = {6'b000001, 5'd30, 21'd3}; //addi reg 30 = 3
	mem_instrucoes[0][423] = {6'b111101, 5'd28, 5'd30, 5'd3, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3

	mem_instrucoes[0][424] = {6'b000001, 5'd30, 21'd4}; //addi reg 30 = 4
	mem_instrucoes[0][425] = {6'b111101, 5'd28, 5'd30, 5'd4, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][426] = {6'b000001, 5'd30, 21'd5}; //addi reg 30 = 5
	mem_instrucoes[0][427] = {6'b111101, 5'd28, 5'd30, 5'd5, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3

	mem_instrucoes[0][428] = {6'b000001, 5'd30, 21'd6}; //addi reg 30 = 6
	mem_instrucoes[0][429] = {6'b111101, 5'd28, 5'd30, 5'd6, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][430] = {6'b000001, 5'd30, 21'd7}; //addi reg 30 = 7
	mem_instrucoes[0][431] = {6'b111101, 5'd28, 5'd30, 5'd7, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3

	mem_instrucoes[0][432] = {6'b000001, 5'd30, 21'd8}; //addi reg 30 = 8
	mem_instrucoes[0][433] = {6'b111101, 5'd28, 5'd30, 5'd8, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3

	mem_instrucoes[0][434] = {6'b000001, 5'd30, 21'd9}; //addi reg 30 = 9
	mem_instrucoes[0][435] = {6'b111101, 5'd28, 5'd30, 5'd9, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3

	mem_instrucoes[0][436] = {6'b000001, 5'd30, 21'd10}; //addi reg 30 = 10
	mem_instrucoes[0][437] = {6'b111101, 5'd28, 5'd30, 5'd10, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3

	mem_instrucoes[0][438] = {6'b000001, 5'd30, 21'd11}; //addi reg 30 = 11
	mem_instrucoes[0][439] = {6'b111101, 5'd28, 5'd30, 5'd11, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3

	mem_instrucoes[0][440] = {6'b000001, 5'd30, 21'd12}; //addi reg 30 = 12
	mem_instrucoes[0][441] = {6'b111101, 5'd28, 5'd30, 5'd12, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][442] = {6'b000001, 5'd30, 21'd13}; //addi reg 30 = 13
	mem_instrucoes[0][443] = {6'b111101, 5'd28, 5'd30, 5'd13, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][444] = {6'b000001, 5'd30, 21'd14}; //addi reg 30 = 14
	mem_instrucoes[0][445] = {6'b111101, 5'd28, 5'd30, 5'd14, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][446] = {6'b000001, 5'd30, 21'd15}; //addi reg 30 = 15
	mem_instrucoes[0][447] = {6'b111101, 5'd28, 5'd30, 5'd15, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][448] = {6'b000001, 5'd30, 21'd16}; //addi reg 30 = 16
	mem_instrucoes[0][449] = {6'b111101, 5'd28, 5'd30, 5'd16, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][450] = {6'b000001, 5'd30, 21'd17}; //addi reg 30 = 17
	mem_instrucoes[0][451] = {6'b111101, 5'd28, 5'd30, 5'd17, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][452] = {6'b000001, 5'd30, 21'd18}; //addi reg 30 = 18
	mem_instrucoes[0][453] = {6'b111101, 5'd28, 5'd30, 5'd18, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][454] = {6'b000001, 5'd30, 21'd19}; //addi reg 30 = 19
	mem_instrucoes[0][455] = {6'b111101, 5'd28, 5'd30, 5'd19, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][456] = {6'b000001, 5'd30, 21'd20}; //addi reg 30 = 20
	mem_instrucoes[0][457] = {6'b111101, 5'd28, 5'd30, 5'd20, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][458] = {6'b000001, 5'd30, 21'd21}; //addi reg 30 = 21
	mem_instrucoes[0][459] = {6'b111101, 5'd28, 5'd30, 5'd21, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][460] = {6'b000001, 5'd30, 21'd22}; //addi reg 30 = 22
	mem_instrucoes[0][461] = {6'b111101, 5'd28, 5'd30, 5'd22, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][462] = {6'b000001, 5'd30, 21'd23}; //addi reg 30 = 23
	mem_instrucoes[0][463] = {6'b111101, 5'd28, 5'd30, 5'd23, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][464] = {6'b000001, 5'd30, 21'd24}; //addi reg 30 = 24
	mem_instrucoes[0][465] = {6'b111101, 5'd28, 5'd30, 5'd24, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][466] = {6'b000001, 5'd30, 21'd25}; //addi reg 30 = 25
	mem_instrucoes[0][467] = {6'b111101, 5'd28, 5'd30, 5'd25, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][468] = {6'b000001, 5'd30, 21'd26}; //addi reg 30 = 26
	mem_instrucoes[0][469] = {6'b111101, 5'd28, 5'd30, 5'd26, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][470] = {6'b000001, 5'd30, 21'd27}; //addi reg 30 = 27
	mem_instrucoes[0][471] = {6'b111101, 5'd28, 5'd30, 5'd27, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	mem_instrucoes[0][474] = {6'b000001, 5'd30, 21'd29}; //addi reg 30 = 29
	mem_instrucoes[0][475] = {6'b111101, 5'd28, 5'd30, 5'd29, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	
	mem_instrucoes[0][478] = {6'b000001, 5'd30, 21'd31}; //addi reg 30 = 31
	mem_instrucoes[0][479] = {6'b111101, 5'd28, 5'd30, 5'd31, 11'd0}; //hd out - o contexto é o REG 1, ENDERECO É O REG 2 e o output é o REG 3
	//mem_instrucoes[0][480] = {6'b111010, 5'd1, 5'd1, 5'd1, 11'd0};//output REG1
	
	
	//mem_instrucoes[0][480] = {6'b111010, 5'd29, 5'd29, 5'd29, 11'd0};//output pc
	//mem_instrucoes[0][481] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[0][482] = {6'b111111, 5'd29,5'd28,16'd0};//o primeior reg é o endereço do branch, o segundo reg é o prox contexto
	
	
	/*
	mem_instrucoes[1][0] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[1][1] = {6'b000001, 5'd1, 21'd1}; //addi
	mem_instrucoes[1][2] = {6'b111010, 5'd1, 5'd1, 5'd1, 11'd0}; //out3
	mem_instrucoes[1][3] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[1][4] = {6'b000001, 5'd1, 21'd2}; //addi
	mem_instrucoes[1][5] = {6'b111010, 5'd1, 5'd1, 5'd1, 11'd0}; //out3
	mem_instrucoes[1][6] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[1][7] = {6'b000001, 5'd1, 21'd3}; //addi
	mem_instrucoes[1][8] = {6'b111010, 5'd1, 5'd1, 5'd1, 11'd0}; //out3
	mem_instrucoes[1][9] = {6'b101000, 26'd0}; //nop
	
	mem_instrucoes[2][0] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[2][1] = {6'b000001, 5'd1, 21'd11}; //addi
	mem_instrucoes[2][2] = {6'b111010, 5'd1, 5'd1, 5'd1, 11'd0}; //out3
	mem_instrucoes[2][3] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[2][4] = {6'b000001, 5'd1, 21'd12}; //addi
	mem_instrucoes[2][5] = {6'b111010, 5'd1, 5'd1, 5'd1, 11'd0}; //out3
	mem_instrucoes[2][6] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[2][7] = {6'b000001, 5'd1, 21'd13}; //addi
	mem_instrucoes[2][8] = {6'b111010, 5'd1, 5'd1, 5'd1, 11'd0}; //out3
	mem_instrucoes[2][9] = {6'b101000, 26'd0}; //nop
	
	mem_instrucoes[3][0] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[3][1] = {6'b000001, 5'd1, 21'd21}; //addi
	mem_instrucoes[3][2] = {6'b111010, 5'd1, 5'd1, 5'd1, 11'd0}; //out3
	mem_instrucoes[3][3] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[3][4] = {6'b000001, 5'd1, 21'd22}; //addi
	mem_instrucoes[3][5] = {6'b111010, 5'd1, 5'd1, 5'd1, 11'd0}; //out3
	mem_instrucoes[3][6] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[3][7] = {6'b000001, 5'd1, 21'd23}; //addi
	mem_instrucoes[3][8] = {6'b111010, 5'd1, 5'd1, 5'd1, 11'd0}; //out3
	mem_instrucoes[3][9] = {6'b101000, 26'd0}; //nop
	*/

	
	// potencia de 2 
	mem_instrucoes[1][0] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[1][1] = {6'b011100, 26'd34}; //ir para main
	mem_instrucoes[1][2] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[1][3] = {6'b000001, 5'd1, 21'd6}; //addi
	mem_instrucoes[1][4] = {6'b000001, 5'd2, 21'd2}; //addi
	mem_instrucoes[1][5] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[1][6] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[1][7] = {6'b000001, 5'd1, 21'd5}; //addi
	mem_instrucoes[1][8] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[1][9] = {6'b000001, 5'd2, 21'd1}; //addi
	mem_instrucoes[1][10] = {6'b011010, 5'd1, 5'd2, 16'd12}; //bgt
	mem_instrucoes[1][11] = {6'b011100, 26'd27}; //goto
	mem_instrucoes[1][12] = {6'b000001, 5'd1, 21'd2}; //addi
	mem_instrucoes[1][13] = {6'b000001, 5'd2, 21'd6}; //addi
	mem_instrucoes[1][14] = {6'b100000, 5'd2, 5'd2, 16'd0}; //lw
	mem_instrucoes[1][15] = {6'b000100, 5'd1, 5'd2, 5'd31, 11'd0}; //mult
	mem_instrucoes[1][16] = {6'b000001, 5'd1, 21'd6}; //addi
	mem_instrucoes[1][17] = {6'b000000, 5'd0, 5'd31, 5'd2, 11'd0}; //add
	mem_instrucoes[1][18] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[1][19] = {6'b000001, 5'd1, 21'd5}; //addi
	mem_instrucoes[1][20] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[1][21] = {6'b000001, 5'd2, 21'd1}; //addi
	mem_instrucoes[1][22] = {6'b000010, 5'd1, 5'd2, 5'd31, 11'd0}; //sub
	mem_instrucoes[1][23] = {6'b000001, 5'd1, 21'd5}; //addi
	mem_instrucoes[1][24] = {6'b000000, 5'd0, 5'd31, 5'd2, 11'd0}; //add
	mem_instrucoes[1][25] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[1][26] = {6'b011100, 26'd6}; //goto
	mem_instrucoes[1][27] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[1][28] = {6'b000001, 5'd1, 21'd6}; //addi
	mem_instrucoes[1][29] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[1][30] = {6'b000000, 5'd1, 5'd0, 5'd31, 11'd0}; //add
	mem_instrucoes[1][31] = {6'b000001, 5'd1, 21'd4}; //addi
	mem_instrucoes[1][32] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[1][33] = {6'b011101, 5'd1, 21'd0}; //jmpr
	mem_instrucoes[1][34] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[1][35] = {6'b111000, 5'd31, 21'd0}; //in
	mem_instrucoes[1][36] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[1][37] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[1][38] = {6'b000000, 5'd0, 5'd31, 5'd2, 11'd0}; //add
	mem_instrucoes[1][39] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[1][40] = {6'b000001, 5'd2, 21'd3}; //addi
	mem_instrucoes[1][41] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[1][42] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[1][43] = {6'b100001, 5'd1, 5'd2, 16'd0}; //store
	mem_instrucoes[1][44] = {6'b000001, 5'd31, 21'd3}; //addi
	mem_instrucoes[1][45] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[1][46] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	mem_instrucoes[1][47] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[1][48] = {6'b000001, 5'd2, 21'd5}; //addi
	mem_instrucoes[1][49] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[1][50] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[1][51] = {6'b100001, 5'd1, 5'd2, 16'd0}; //store
	mem_instrucoes[1][52] = {6'b000001, 5'd1, 21'd4}; //addi
	mem_instrucoes[1][53] = {6'b000001, 5'd2, 21'd56}; //addi
	mem_instrucoes[1][54] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[1][55] = {6'b011100, 26'd3}; //jump
	mem_instrucoes[1][56] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[1][57] = {6'b000000, 5'd0, 5'd31, 5'd2, 11'd0}; //add
	mem_instrucoes[1][58] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[1][59] = {6'b000001, 5'd2, 21'd3}; //addi
	mem_instrucoes[1][60] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[1][61] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[1][62] = {6'b100001, 5'd1, 5'd2, 16'd0}; //store
	mem_instrucoes[1][63] = {6'b000001, 5'd31, 21'd3}; //addi
	mem_instrucoes[1][64] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[1][65] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3

	
	
	// potencia de 2
	mem_instrucoes[2][0] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[2][1] = {6'b011100, 26'd34}; //ir para main
	mem_instrucoes[2][2] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[2][3] = {6'b000001, 5'd1, 21'd6}; //addi
	mem_instrucoes[2][4] = {6'b000001, 5'd2, 21'd2}; //addi
	mem_instrucoes[2][5] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[2][6] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[2][7] = {6'b000001, 5'd1, 21'd5}; //addi
	mem_instrucoes[2][8] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[2][9] = {6'b000001, 5'd2, 21'd1}; //addi
	mem_instrucoes[2][10] = {6'b011010, 5'd1, 5'd2, 16'd12}; //bgt
	mem_instrucoes[2][11] = {6'b011100, 26'd27}; //goto
	mem_instrucoes[2][12] = {6'b000001, 5'd1, 21'd2}; //addi
	mem_instrucoes[2][13] = {6'b000001, 5'd2, 21'd6}; //addi
	mem_instrucoes[2][14] = {6'b100000, 5'd2, 5'd2, 16'd0}; //lw
	mem_instrucoes[2][15] = {6'b000100, 5'd1, 5'd2, 5'd31, 11'd0}; //mult
	mem_instrucoes[2][16] = {6'b000001, 5'd1, 21'd6}; //addi
	mem_instrucoes[2][17] = {6'b000000, 5'd0, 5'd31, 5'd2, 11'd0}; //add
	mem_instrucoes[2][18] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[2][19] = {6'b000001, 5'd1, 21'd5}; //addi
	mem_instrucoes[2][20] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[2][21] = {6'b000001, 5'd2, 21'd1}; //addi
	mem_instrucoes[2][22] = {6'b000010, 5'd1, 5'd2, 5'd31, 11'd0}; //sub
	mem_instrucoes[2][23] = {6'b000001, 5'd1, 21'd5}; //addi
	mem_instrucoes[2][24] = {6'b000000, 5'd0, 5'd31, 5'd2, 11'd0}; //add
	mem_instrucoes[2][25] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[2][26] = {6'b011100, 26'd6}; //goto
	mem_instrucoes[2][27] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[2][28] = {6'b000001, 5'd1, 21'd6}; //addi
	mem_instrucoes[2][29] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[2][30] = {6'b000000, 5'd1, 5'd0, 5'd31, 11'd0}; //add
	mem_instrucoes[2][31] = {6'b000001, 5'd1, 21'd4}; //addi
	mem_instrucoes[2][32] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[2][33] = {6'b011101, 5'd1, 21'd0}; //jmpr
	mem_instrucoes[2][34] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[2][35] = {6'b111000, 5'd31, 21'd0}; //in
	mem_instrucoes[2][36] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[2][37] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[2][38] = {6'b000000, 5'd0, 5'd31, 5'd2, 11'd0}; //add
	mem_instrucoes[2][39] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[2][40] = {6'b000001, 5'd2, 21'd3}; //addi
	mem_instrucoes[2][41] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[2][42] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[2][43] = {6'b100001, 5'd1, 5'd2, 16'd0}; //store
	mem_instrucoes[2][44] = {6'b000001, 5'd31, 21'd3}; //addi
	mem_instrucoes[2][45] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[2][46] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	mem_instrucoes[2][47] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[2][48] = {6'b000001, 5'd2, 21'd5}; //addi
	mem_instrucoes[2][49] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[2][50] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[2][51] = {6'b100001, 5'd1, 5'd2, 16'd0}; //store
	mem_instrucoes[2][52] = {6'b000001, 5'd1, 21'd4}; //addi
	mem_instrucoes[2][53] = {6'b000001, 5'd2, 21'd56}; //addi
	mem_instrucoes[2][54] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[2][55] = {6'b011100, 26'd3}; //jump
	mem_instrucoes[2][56] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[2][57] = {6'b000000, 5'd0, 5'd31, 5'd2, 11'd0}; //add
	mem_instrucoes[2][58] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[2][59] = {6'b000001, 5'd2, 21'd3}; //addi
	mem_instrucoes[2][60] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[2][61] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[2][62] = {6'b100001, 5'd1, 5'd2, 16'd0}; //store
	mem_instrucoes[2][63] = {6'b000001, 5'd31, 21'd3}; //addi
	mem_instrucoes[2][64] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[2][65] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	

	
	// potencia de 2
	mem_instrucoes[3][0] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[3][1] = {6'b011100, 26'd34}; //ir para main
	mem_instrucoes[3][2] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[3][3] = {6'b000001, 5'd1, 21'd6}; //addi
	mem_instrucoes[3][4] = {6'b000001, 5'd2, 21'd2}; //addi
	mem_instrucoes[3][5] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[3][6] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[3][7] = {6'b000001, 5'd1, 21'd5}; //addi
	mem_instrucoes[3][8] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[3][9] = {6'b000001, 5'd2, 21'd1}; //addi
	mem_instrucoes[3][10] = {6'b011010, 5'd1, 5'd2, 16'd12}; //bgt
	mem_instrucoes[3][11] = {6'b011100, 26'd27}; //goto
	mem_instrucoes[3][12] = {6'b000001, 5'd1, 21'd2}; //addi
	mem_instrucoes[3][13] = {6'b000001, 5'd2, 21'd6}; //addi
	mem_instrucoes[3][14] = {6'b100000, 5'd2, 5'd2, 16'd0}; //lw
	mem_instrucoes[3][15] = {6'b000100, 5'd1, 5'd2, 5'd31, 11'd0}; //mult
	mem_instrucoes[3][16] = {6'b000001, 5'd1, 21'd6}; //addi
	mem_instrucoes[3][17] = {6'b000000, 5'd0, 5'd31, 5'd2, 11'd0}; //add
	mem_instrucoes[3][18] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[3][19] = {6'b000001, 5'd1, 21'd5}; //addi
	mem_instrucoes[3][20] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[3][21] = {6'b000001, 5'd2, 21'd1}; //addi
	mem_instrucoes[3][22] = {6'b000010, 5'd1, 5'd2, 5'd31, 11'd0}; //sub
	mem_instrucoes[3][23] = {6'b000001, 5'd1, 21'd5}; //addi
	mem_instrucoes[3][24] = {6'b000000, 5'd0, 5'd31, 5'd2, 11'd0}; //add
	mem_instrucoes[3][25] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[3][26] = {6'b011100, 26'd6}; //goto
	mem_instrucoes[3][27] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[3][28] = {6'b000001, 5'd1, 21'd6}; //addi
	mem_instrucoes[3][29] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[3][30] = {6'b000000, 5'd1, 5'd0, 5'd31, 11'd0}; //add
	mem_instrucoes[3][31] = {6'b000001, 5'd1, 21'd4}; //addi
	mem_instrucoes[3][32] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[3][33] = {6'b011101, 5'd1, 21'd0}; //jmpr
	mem_instrucoes[3][34] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[3][35] = {6'b111000, 5'd31, 21'd0}; //in
	mem_instrucoes[3][36] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[3][37] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[3][38] = {6'b000000, 5'd0, 5'd31, 5'd2, 11'd0}; //add
	mem_instrucoes[3][39] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[3][40] = {6'b000001, 5'd2, 21'd3}; //addi
	mem_instrucoes[3][41] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[3][42] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[3][43] = {6'b100001, 5'd1, 5'd2, 16'd0}; //store
	mem_instrucoes[3][44] = {6'b000001, 5'd31, 21'd3}; //addi
	mem_instrucoes[3][45] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[3][46] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	mem_instrucoes[3][47] = {6'b101000, 26'd0}; //nop
	mem_instrucoes[3][48] = {6'b000001, 5'd2, 21'd5}; //addi
	mem_instrucoes[3][49] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[3][50] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[3][51] = {6'b100001, 5'd1, 5'd2, 16'd0}; //store
	mem_instrucoes[3][52] = {6'b000001, 5'd1, 21'd4}; //addi
	mem_instrucoes[3][53] = {6'b000001, 5'd2, 21'd56}; //addi
	mem_instrucoes[3][54] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[3][55] = {6'b011100, 26'd3}; //jump
	mem_instrucoes[3][56] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[3][57] = {6'b000000, 5'd0, 5'd31, 5'd2, 11'd0}; //add
	mem_instrucoes[3][58] = {6'b100001, 5'd2, 5'd1, 16'd0}; //store
	mem_instrucoes[3][59] = {6'b000001, 5'd2, 21'd3}; //addi
	mem_instrucoes[3][60] = {6'b000001, 5'd1, 21'd8}; //addi
	mem_instrucoes[3][61] = {6'b100000, 5'd1, 5'd1, 16'd0}; //lw
	mem_instrucoes[3][62] = {6'b100001, 5'd1, 5'd2, 16'd0}; //store
	mem_instrucoes[3][63] = {6'b000001, 5'd31, 21'd3}; //addi
	mem_instrucoes[3][64] = {6'b100000, 5'd31, 5'd31, 16'd0}; //lw
	mem_instrucoes[3][65] = {6'b111010, 5'd31, 5'd31, 5'd31, 11'd0}; //out3
	
	
	clockInicio <= 1'b1;
	end
end
/*
end
*/

always @ (posedge clk_50) begin
	saida_instrucao <= mem_instrucoes[contexto][end_mem];
end

endmodule
