module control_function(k, g, m, r);

	input [7:0] k;
	input signed [8:0] g, m;
	output signed [8:0] r;
	
	assign r = k * (g - m);
	
endmodule