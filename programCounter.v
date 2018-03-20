module programCounter(
end_entrada,
end_saida,
clk,
reset
);

	input [31:0] end_entrada;
	input clk;
	input reset;
		
	output reg[31:0] end_saida;

	always @ (posedge clk) begin
		if (reset == 1'b1) end_saida <= 32'b00000000000000000000000000000000;
		else end_saida <= end_entrada;
	end

endmodule
