// Jonathan Monreal
// This module handles the direction commanded by the goal counter/

module direction_handler(direction, pwm_in, out);

	input direction, pwm_in;
	output reg [1:0] out;
	
	always
		begin
			if (direction) out = {1'b0, pwm_in}; // If the direction is 1
			else out = {pwm_in, 1'b0};           // Else if the direction is 0
		end
		
endmodule