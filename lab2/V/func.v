module func(clk, k, g, m, out);

	input clk;
	input [7:0] k, g, m;
	output reg [11:0] out;
	
	reg [15:0] r = 0;
	reg [7:0] last_m = 0;
	
	always @(posedge clk)
		begin
			if (g > m) r = k * (g - m);
			else r = k * g;
			out = r[15:4];
		end

endmodule