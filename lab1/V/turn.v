module turn(input clock, input left, input right, output [2:0] l_signal, output [2:0] r_signal, output error);

//a flag previous_e is created to handle
//the case of exiting error state (not blinking having one of the direction switch on)
reg [2:0] ltemp, rtemp;
reg previous_e = 0;
wire errortemp;

assign errortemp = (left & right);
assign l_signal = ltemp;
assign r_signal = rtemp;
assign error = errortemp;


always @(posedge clock) begin

//check error, if so, send to both 000 states.
		if (1 == errortemp) begin
				ltemp = 3'b000;
				rtemp = 3'b000;
				previous_e = 1;
			end
			
//check clear state, if so, send to both 000 states, reset error.
		if (0 == left & 0 == right) begin
			previous_e = 0;
			ltemp = 3'b000;
			rtemp = 3'b000;
		end	

//left turning state sequences		
		else if (1 == left & previous_e == 0) begin
			rtemp = 3'b000;

			if (ltemp == 3'b000) begin
				ltemp = 3'b001;
			end
			else if (ltemp == 3'b001) begin
				ltemp = 3'b011;
			end
			else if (ltemp == 3'b011) begin
				ltemp = 3'b111;
			end
			else begin
				ltemp = 3'b000;
			end
		end
		
//right turning state sequences		
		else if (1 == right & previous_e == 0) begin
			ltemp = 3'b000;

			if (rtemp == 3'b000) begin
				rtemp = 3'b100;
			end
			else if (rtemp == 3'b100) begin
				rtemp = 3'b110;
			end
			else if (rtemp == 3'b110) begin
				rtemp = 3'b111;
			end
			else begin
				rtemp = 3'b000;
			end
		end

//other states, if any exists, would be sent to clear states.
		else begin
			ltemp = 3'b000;
			rtemp = 3'b000;
		end
end


endmodule