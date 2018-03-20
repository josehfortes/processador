module contexto(
clk,
altera_contexto,
out_contexto,
next_contexto
);

input clk;
input altera_contexto;
input [31:0] next_contexto;

output reg [31:0] out_contexto;

always @ (posedge clk) begin
	if (altera_contexto == 1'b1) begin
		out_contexto = next_contexto;
	end
end



endmodule
