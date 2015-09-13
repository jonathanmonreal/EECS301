module flipflop(clk, reset, d, q);
	
	input clk, reset, d;
	output q;
	
	always @ (posedge clk or posedge reset)
		if (reset) q = 0;
		else q = d;
	
endmodule