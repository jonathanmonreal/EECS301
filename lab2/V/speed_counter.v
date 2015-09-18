module speed_counter(clk, reset, input_a, input_b, speed);

	input clk, reset, input_a, input_b;
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
	
	initial speed <= 0;
	assign en = dff_a0 && ~dff_a1;
	
	reg [7:0] counter = 0;
	
	always @(posedge clk)
		begin
			if (reset) counter <= 0;
			else if (en) begin
				if (count_dir) counter <= counter + 1;
				else counter <= counter - 1;
			end
			speed <= counter;
		end
		
endmodule