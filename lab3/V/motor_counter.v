// Jonathan Monreal
// 

module motor_counter(clk, reset, input_a, input_b, selector, amp, freq);

	input clk, reset, input_a, input_b, selector;
	output reg [9:0] amp, freq;
	
	wire dff_a0, dff_a1, dff_b0, dff_b1, ena, enb;
	
	flipflop a0(
		.clk(clk),
		.reset(reset),
		.d(input_a),
		.q(dff_a0),
	);
	
	flipflop a1(
		.clk(clk),
		.reset(reset),
		.d(dff_a0),
		.q(dff_a1)
	);

	flipflop b0(
		.clk(clk),
		.reset(reset),
		.d(input_b),
		.q(dff_b0),
	);
	
	flipflop b1(
		.clk(clk),
		.reset(reset),
		.d(dff_b0),
		.q(dff_b1)
	);

	
	assign ena = dff_a0 && ~dff_a1; // enable for encoder a
	assign enb = dff_b0 && ~dff_b1; // enable for encoder b
	
	
	always @(posedge clk)
		begin
			if (reset)
			begin
				freq = 'b0000110100;
				amp  = 'b1111111111;
			end
		else if (selector)
			begin
				if (ena & freq < 'b1111111111) freq = freq + 1;
				else if (enb & freq > 'b0000000001) freq = freq - 1;
			end
		else
			begin
				if (ena & amp < 'b1111111111) amp = amp + 1;
				else if (enb & amp > 'b0000000001) amp = amp - 1;
			end
		end
		
endmodule
