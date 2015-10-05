

module motor_counter(clk, reset, input_a, input_b, select, amp, freq);

	input clk, reset, input_a, input_b, select;
	output reg [9:0] amp, freq;
	
	wire dff_a0, dff_a1,dff_b0,dff_b1, count_dir, en;
	
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
	
	
//	flipflop b1(
	//	.clk(clk),
	//	.reset(reset),
	//	.d(dff_b0),
//		.q(dff_b1)
//	);
	
	assign en = dff_a0 && ~dff_a1; // The enable
	//assign enb = dff_b0 && ~dff_b1;
	reg [9:0] counter,counter2;
	
	always @(posedge clk)
		begin
		if (reset) 
			begin
				counter2 <= 'b0000110100; counter <= 'b1111111110;
			end
		else if (select) 
			begin
				if (en & counter < 'b1111111111) counter <= counter + 1;
				if (count_dir & en & counter > 'b0000000000) counter <= counter - 1;
			end
		else 
			begin
				if (en & counter2 < 'b1111111111) counter2 <= counter2 + 1;
				if (count_dir & en & counter2 > 'b0000000000) counter2 <= counter2 - 1;
			end
		amp = counter;
		freq = counter2;	
		end
		
endmodule
