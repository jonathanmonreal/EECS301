module direction_handler(direction, pwm_in, out);

	input direction, pwm_in;
	output reg [1:0] out;
	
	always
		begin
			if (direction) out = {1'b0, pwm_in};
			else out = {pwm_in, 1'b0};
		end
		
endmodule