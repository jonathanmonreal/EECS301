module clock_divider(n, clk, clk_out);
	parameter n;
	input clk;
	output wire clk_out;
	
	reg [n:0] counter;
	assign clk_out = counter[n];
	
	always @(posedge clk)
		begin
			counter <= counter + 1;
		end
		