module clock_divider(clk, clk_out);
	input clk;
	output wire clk_out;
	
	parameter n = 22;
	reg [n:0] counter;
	assign clk_out = counter[n];
	
	always @(posedge clk)
		begin
			counter <= counter + 1;
		end
		
endmodule