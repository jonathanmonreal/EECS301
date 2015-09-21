module reset_clock(clk, clk_out);

	input clk;
	output wire clk_out;
	
	reg [12:0] counter;
	assign clk_out = counter[12];
	
	always @(posedge clk)
		begin
			counter <= counter + 1;
		end
		
endmodule