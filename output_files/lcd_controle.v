module lcd_controle (
clk,
lcd_rs,
lcd_rw,
lcd_en,
lcd_entrada,
lcd_saida,
);

input clk;
input [7:0] lcd_entrada;
output reg lcd_rs, lcd_rw, lcd_en;
output reg [7:0] lcd_saida;

always @ (posedge clk) begin
	lcd_en <= 1'b1;
	lcd_rw <= 1'b0;
	lcd_rs <= 1'b1;
	lcd_saida[0] = 6'h22;
	lcd_saida[1] = 6'h22;
	lcd_saida[2] = 6'h22;
	lcd_saida[3] = 6'h22;
	lcd_saida[4] = 6'h22;
	lcd_saida[5] = 6'h22;
	lcd_saida[6] = 6'h22;
	lcd_saida[7] = 6'h22;
end

endmodule
