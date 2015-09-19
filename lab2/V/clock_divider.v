module clock_divider(clk, clk_out);

	input clk;
	output wire clk_out;
	
	reg [22:0] counter;
	assign clk_out = counter[22];
	
	always @(posedge clk)
		begin
			counter <= counter + 1;
		end
		
endmodule