// Jonathan Monreal and Jiawei Wu
// This module implements the control function of r = k * (g - m)

module func(clk, k, g, m, out);

	input clk;
	input [7:0] k, g, m;
	output reg [7:0] out
	
	reg [7:0] r = 0;
	
	always @(posedge clk)
		begin
			if (g > m) r = (k * (g - m))/('b11111111);
			else r = (k * (m - g))/('b11111111);
			if (g == 0) r = 0;
			out = r;
		end

endmodule
