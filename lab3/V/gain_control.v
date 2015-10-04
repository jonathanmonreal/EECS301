module gain_control(clk,in,k, out);

	input clk;
	input [11:0] in;
	input [9:0] k;
	output reg [11:0] out;
	
	reg [21:0] r = 0;
	reg [11:0] unsig = 0;
	
	always @(posedge clk)
		begin
			unsig = in + 12'b100000000000;
			r = k * unsig;
			out = r[21:10];
		end

endmodule