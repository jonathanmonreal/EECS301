module controller(clk, rst, variable, down, up, amp, freq);

input clk, rst, variable, down, up;
output reg [7:0] amp, freq;

always @(posedge clk or posedge rst)
	begin
		if (rst)
			begin
				freq = 'b00001101;
				amp  = 'b11111111;
			end
		else if (variable)
			begin
				if (up & freq < 'b11111111) freq = freq + 1;
				else if (down & freq > 'b00000000) freq = freq - 1;
			end
		else
			begin
				if (up & amp < 'b11111111) amp = amp + 1;
				else if (down & amp > 'b00000000) amp = amp - 1;
			end
	end
	
endmodule