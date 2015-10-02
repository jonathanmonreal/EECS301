// Jonathan Monreal
// This module is a simple clock divider

module clock_divider2(clk, clk_out);

	input clk;
	output wire clk_out;
	
	reg [9:0] counter =10'b0;
	// The output is the msb of the counter
	assign clk_out = counter[9];
	
	always @(posedge clk)
		begin
			counter <= counter + 1'b1;
		end
		
endmodule