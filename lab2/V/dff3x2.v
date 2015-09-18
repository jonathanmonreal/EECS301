module dff3x2(clk, reset, input_a, input_b, a_dff, b_dff);

	input clk, reset, input_a, input_b;
	output wire [2:0] a_dff, b_dff;

	flipflop a0(
		.clk(clk),
		.reset(reset),
		.d(input_a),
		.q(a_dff[0])
	);

	flipflop a1(
		.clk(clk),
		.reset(reset),
		.d(a_dff[0]),
		.q(a_dff[1])
	);

	flipflop a2(
		.clk(clk),
		.reset(reset),
		.d(a_dff[1]),
		.q(a_dff[2])
	);

	flipflop b0(
		.clk(clk),
		.reset(reset),
		.d(input_b),
		.q(b_dff[0])
	);

	flipflop b1(
		.clk(clk),
		.reset(reset),
		.d(b_dff[0]),
		.q(b_dff[1])
	);

	flipflop b2(
		.clk(clk),
		.reset(reset),
		.d(b_dff[1]),
		.q(b_dff[2])
	);

endmodule