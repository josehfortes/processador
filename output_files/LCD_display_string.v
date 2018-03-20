module LCD_display_string(index,out,hex5,hex4,hex3,hex2,hex1,hex0);
input [4:0] index;
input [3:0] hex0,hex1,hex2,hex3,hex4,hex5;
output [7:0] out;
reg [7:0] out;
// ASCII hex values for LCD Display
// Enter Live Hex Data Values from hardware here
// LCD DISPLAYS THE FOLLOWING:
//----------------------------
//| Count=XX                  |
//| DE2                       |
//----------------------------
// Line 1
   always 
     case (index)
	5'h00: out <= 8'h4E;//N
	5'h01: out <= 8'h75;//u
	5'h02: out <= 8'h6D;//m
	5'h03: out <= 8'h31;//1
	5'h04: out <= 8'h3A;//:
	5'h05: out <= {4'h0,hex1};//X
	5'h06: out <= {4'h0,hex0};//X
	5'h07: out <= 8'h20;//espaço
	5'h08: out <= 8'h4E;//N
	5'h09: out <= 8'h75;//u
	5'h0A: out <= 8'h6D;//m
	5'h0B: out <= 8'h32;//2
	5'h0C: out <= 8'h3A;//:
	5'h0D: out <= {4'h0,hex3};//X
	5'h0E: out <= {4'h0,hex2};//X
// Line 2
	5'h10: out <= 8'h52;//R
	5'h11: out <= 8'h65;//e
	5'h12: out <= 8'h73;//s
	5'h13: out <= 8'h75;//u
	5'h14: out <= 8'h6C;//l
	5'h15: out <= 8'h74;//t
	5'h16: out <= 8'h3A;//:
	5'h17: out <= {4'h0,hex5};//X
	5'h18: out <= {4'h0,hex4};//X
	default: out <= 8'h20;
     endcase
endmodule