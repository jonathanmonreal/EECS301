module goal_counter(clk, up, down, reset, goal_speed);
	input clk, up, down, reset;
	output reg signed [8:0] goal_speed;
	
	initial goal_speed = 'b000000000;
	
	always @(posedge clk)
		begin
			if (reset) goal_speed <= 0;
			if (up & goal_speed != 'b011111111) goal_speed <= goal_speed + 1;
			if (down & goal_speed != 'b100000000) goal_speed <= goal_speed - 1;
		end

endmodule