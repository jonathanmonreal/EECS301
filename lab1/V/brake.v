module brake(input clock, input brake, input [2:0] l_signal, input [2:0] r_signal, 
output [2:0] l_lights, output [2:0] r_lights, output [1:0] c_lights);

reg brake_active = 0;
reg [2:0] ltemp, rtemp;
reg [1:0] ctemp = 'b00;
//this var is created to achieve the two cycle of delays of existing brake.
integer delay_count = 0;

assign l_lights = ltemp;
assign r_lights = rtemp;
assign c_lights = ctemp;

always @(posedge clock) begin
	

	if (1 == brake) begin
				brake_active = 1;
			end

//handling exiting brake	
	if (0 == brake) begin
		if (brake_active == 1) begin
			delay_count=delay_count+1;
			if (delay_count == 3) begin
				brake_active = 0;
				delay_count = 0;
				ltemp = 3'b000;
				rtemp = 3'b000;
				ctemp = 2'b00;
			end
		end
//retaining turn signals if brake is not active		
		if (brake_active == 0) begin
			ltemp = l_signal;
			rtemp = r_signal;
		end
	end
//reverting signals and asserting center lights	
	if (brake_active == 1) begin
		ltemp = ~l_signal;
		rtemp = ~r_signal;
		ctemp = 2'b11;
	end

end

endmodule