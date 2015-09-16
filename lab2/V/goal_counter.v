module goal_counter(clk, up, down, reset, msb, goal_speed);
	input clk, up, down, reset;
	output msb;
	output [7:0] goal_speed;
	
	reg [8:0] counter;
	assign msb = counter[8];
	assign goal_speed = counter[7:0];
	
	initial counter = 'b000000000;
	
	always @(posedge clk)
		begin
			if (reset) counter <= 0;
			if (up & counter != 'b011111111) counter <= counter + 1;
			if (down & counter != 'b100000000) counter <= counter - 1;
		end

endmodule