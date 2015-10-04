// Jonathan Monreal
// This module is a simple clock divider

module clock_divider(clk, clk_out);

	input clk;
	output wire clk_out;
	
	reg [5:0] counter =6'b0;
	// The output is the msb of the counter
	assign clk_out = counter[5];
	
	always @(posedge clk)
		begin
			counter <= counter + 1'b1;
		end
		
endmodule