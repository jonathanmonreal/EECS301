module speed_counter(clk, reset, input_a, input_b, speed);

	input clk, reset, input_a, input_b;
	output reg [7:0] speed;

	wire [2:0] a_dff, b_dff;

	dff3x2 dffs(
		.clk(clk),
		.reset(reset),
		.input_a(input_a),
		.input_b(input_b),
		.a_dff(a_dff),
		.b_dff(b_dff)
	);

	wire en = a_dff[1] ^ b_dff[1] ^ a_dff[2] ^ b_dff[2];
	wire direction = a_dff[1] ^ a_dff[2];

	reg [7:0] counter = 0;
	
	always @(posedge clk or posedge reset)
		begin
			if (reset) counter <= 0;
			else begin
				if (en) begin
					if (direction) counter <= counter + 1;
					else counter <= counter - 1;
				end
			end
			speed <= (~counter);
		end

endmodule