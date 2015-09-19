module speed_counter(clk, srst, input_a, input_b, speed);

	input clk, srst, input_a, input_b;
	output reg [7:0] speed;
	
	wire dff_a0, dff_a1, count_dir, en;
	
	flipflop a0(
		.clk(clk),
		.reset(0),
		.d(input_a),
		.q(dff_a0),
	);
	
	flipflop a1(
		.clk(clk),
		.reset(0),
		.d(dff_a0),
		.q(dff_a1)
	);

	flipflop b0(
		.clk(clk),
		.reset(0),
		.d(input_b),
		.q(count_dir)
	);
	
	assign en = dff_a0 && ~dff_a1;
	reg [7:0] counter;
	reg has_reset;
	
	always @(posedge clk)
		begin
			if (srst) begin
				if (has_reset == 0) speed = counter;
				counter <= 0;
				has_reset = 1;
			end
			else has_reset = 0;
			if (en) counter <= counter + 1;
		end
		
endmodule
