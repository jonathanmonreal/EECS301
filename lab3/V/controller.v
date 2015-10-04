module controller(clk, rst, variable, down, up, amp, freq);

input clk, rst, variable, down, up;
output reg [9:0] amp, freq;

always @(posedge clk or posedge rst)
	begin
		if (rst)
			begin
				freq = 'b0000110100;
				amp  = 'b1111111111;
			end
		else if (variable)
			begin
				if (up & freq < 'b1111111111) freq = freq + 1;
				else if (down & freq > 'b0000000001) freq = freq - 1;
			end
		else
			begin
				if (up & amp < 'b1111111111) amp = amp + 1;
				else if (down & amp > 'b0000000001) amp = amp - 1;
			end
	end
	
endmodule