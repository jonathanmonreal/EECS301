// Jonathan Monreal
// 

module speed_counter(clk, reset, srst, input_a, input_b, speed);

	input clk, reset, srst, input_a, input_b;
	output reg [7:0] speed;
	
	wire dff_a0, dff_a1, count_dir, en;
	
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
		.q(count_dir)
	);
	
	assign en = dff_a0 && ~dff_a1; // The enable
	reg [7:0] counter;
	reg has_reset;                 // Used to determine if a reset has already occurred
	
	always @(posedge clk)
		begin
			if (srst) begin
				if (has_reset == 0) speed = counter; // if a reset has not already occurred
				counter <= 0;
				has_reset = 1;
			end
			else has_reset = 0; // a reset has not occurred
			if (en) counter <= counter + 1;
		end
		
endmodule
