module reset_clock(clk, clk_out);

	input clk;
	output wire clk_out;
	
	reg [21:0] counter;
	assign clk_out = counter[21];
	
	always @(posedge clk)
		begin
			if (counter == 'b1000000000000000000001) counter = 0;
			counter <= counter + 1;
		end
		
endmodule