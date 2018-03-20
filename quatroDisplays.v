module quatroDisplays(
milhar,
centena,
dezena,
unidade,
M,
C,
D,
U
);

input [3:0] unidade, dezena, centena, milhar;
output reg [6:0] U, D, C, M;

always @ (dezena or unidade or centena or milhar) begin
	case (dezena)
			4'b0000 : D = 7'b0000001;
			4'b0001 : D = 7'b1001111;
			4'b0010 : D = 7'b0010010;
			4'b0011 : D = 7'b0000110;
			4'b0100 : D = 7'b1001100;
			4'b0101 : D = 7'b0100100;
			4'b0110 : D = 7'b0100000;
			4'b0111 : D = 7'b0001111;
			4'b1000 : D = 7'b0000000;
			4'b1001 : D = 7'b0000100;
			default : D = 7'b1111111;
	endcase
	
	case (unidade)
			4'b0000 : U = 7'b0000001;
			4'b0001 : U = 7'b1001111;
			4'b0010 : U = 7'b0010010;
			4'b0011 : U = 7'b0000110;
			4'b0100 : U = 7'b1001100;
			4'b0101 : U = 7'b0100100;
			4'b0110 : U = 7'b0100000;
			4'b0111 : U = 7'b0001111;
			4'b1000 : U = 7'b0000000;
			4'b1001 : U = 7'b0000100;
			default : U = 7'b1111111;
	endcase
	
	case (centena)
			4'b0000 : C = 7'b0000001;
			4'b0001 : C = 7'b1001111;
			4'b0010 : C = 7'b0010010;
			4'b0011 : C = 7'b0000110;
			4'b0100 : C = 7'b1001100;
			4'b0101 : C = 7'b0100100;
			4'b0110 : C = 7'b0100000;
			4'b0111 : C = 7'b0001111;
			4'b1000 : C = 7'b0000000;
			4'b1001 : C = 7'b0000100;
			default : C = 7'b1111111;
	endcase
	
	case (milhar)
			4'b0000 : M = 7'b0000001;
			4'b0001 : M = 7'b1001111;
			4'b0010 : M = 7'b0010010;
			4'b0011 : M = 7'b0000110;
			4'b0100 : M = 7'b1001100;
			4'b0101 : M = 7'b0100100;
			4'b0110 : M = 7'b0100000;
			4'b0111 : M = 7'b0001111;
			4'b1000 : M = 7'b0000000;
			4'b1001 : M = 7'b0000100;
			default : M = 7'b1111111;
	endcase
end



endmodule
