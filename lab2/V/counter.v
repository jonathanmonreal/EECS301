// Jonathan Monreal
// A basic counter to be used with the PWM

module counter(clk, reset, count);

	input clk, reset;
	output reg [8:0] count;
	
	always @(posedge clk)
		begin
			if (reset) count <= 0;
			else count <= count + 1'b1;
		end
	
endmodule