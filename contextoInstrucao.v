module contextoInstrucao(
clk,
altera_contexto,
out_contexto,
next_contexto
);

input clk;
input altera_contexto;
input [31:0] next_contexto;

output reg [31:0] out_contexto;

reg contexto = 31'b0;

always @ (posedge clk) begin
	if (altera_contexto == 1) begin
		
	end
	assign out_contexto = contexto;
end



endmodule