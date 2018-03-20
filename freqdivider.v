module freqdivider(clk,reduzclock);
input clk;
output wire reduzclock;

reg [20:0] count;

always @ (posedge clk) begin
	count <= count + 1'b1;
end
	
assign reduzclock = count[20];


endmodule
