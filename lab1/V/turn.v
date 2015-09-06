module turn(input clock, input left, input right, output [2:0] l_signal, output [2:0] r_signal, output error);

reg [2:0] ltemp, rtemp;
wire errortemp;

assign errortemp = (left & right);
assign l_signal = ltemp;
assign r_signal = rtemp;


always @(posedge clock) begin

		if (1 == errortemp) begin
				ltemp = 3'b000;
				rtemp = 3'b000;
			end
		
		else if (1 == left) begin
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
		
		else if (1 == right) begin
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
		
		else begin
			ltemp = 3'b000;
			rtemp = 3'b000;
		end
end


endmodule