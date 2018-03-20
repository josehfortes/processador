module muxEscritaReg(
end_1,
end_2,
controle,
end_saida
);
/*
input end_1[4:0];
input end_2[4:0];
input controle;

output reg end_saida[4:0];

	always @ (end_1 or end_2 or controle) begin
		if(controle == 1'b0)
			end_saida = end_1;
		else
			end_saida = end_2;
	end*/
endmodule
