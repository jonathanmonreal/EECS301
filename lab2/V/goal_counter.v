// Jonathan Monreal
// Implements the goal counter

module goal_counter(clk, up, down, reset, msb, goal_speed);
	input clk, up, down, reset;
	output msb;
	output reg [7:0] goal_speed;
	
	reg [8:0] counter;
	assign msb = counter[8]; // The MSB dictates the direction
	
	// Determine the goal speed based on the counter
	always
		begin
			if (msb) goal_speed = ~counter[7:0]; // If the MSB is 1, the bits must be inverted
			else goal_speed = counter[7:0];      // Else, the bits already have the goal speed
		end
	
	// Set the initial value for the counter
	initial counter = 'b000000000;
	
	// Counts up or down depending on input, but does not overflow
	always @(posedge clk) // A clock is used so that the button can be held
		begin
			if (reset) counter <= 0;
			if (up & counter != 'b011111111) counter <= counter + 1;
			if (down & counter != 'b100000000) counter <= counter - 1;
		end

endmodule