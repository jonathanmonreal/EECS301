module freq_control(clk,in,out);

	input clk;
	input [9:0] in;
	output reg [23:0] out = 0;
	
	reg [12:0] r = 0;
	reg [2:0] k = 3'b111;
	
	always @(posedge clk)
		begin
			r = in * k;
			out[12:0] = r; 
		end

endmodule