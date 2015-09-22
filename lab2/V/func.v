// Jonathan Monreal and Jiawei Wu
// This module implements the control function of r = k * (g - m)

module func(clk, k, g, m, out);

	input clk;
	input [7:0] k, g, m;
	output reg [7:0] out;
	
	reg [15:0] r = 0;
	
	always @(posedge clk)
		begin
			if (g > m) r = (k * (g - m));
			else r = (k * (m - g));
			if (g == 0) r = 0;
			// Only taking the 8 msb is equivalent to dividing by 256,
			// scaling k to be between 0 and 1.
			out = r[15:8];
		end

endmodule
