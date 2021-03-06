module counter(
         input clk,
         output counter_msb
       );
	reg [ 23: 0 ] internal_counter = 24'b0;

	assign counter_msb = internal_counter[ 23 ];

	always @( posedge clk ) begin
		internal_counter <= internal_counter + 1'b1;
	end
	
endmodule
		 
		 
