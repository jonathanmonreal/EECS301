module turn(clock, left, right, l_signal, r_signal, error);

input clock, left, right;
output [2:0] l_signal, r_signal;
output error;

reg [2:0]  l_signal, r_signal;
reg error;

always @(posedge clock) begin

		if (1 == error) begin
				l_signal <= 3'b000;
				r_signal <= 3'b000;
			end
		
		else if (1 == left) begin
			r_signal <= 3'b000;

			if (l_signal == 3'b000) begin
				l_signal <= 3'b001;
			end
			else if (l_signal == 3'b001) begin
				l_signal <= 3'b011;
			end
			else if (l_signal == 3'b011) begin
				l_signal <= 3'b111;
			end
			else begin
				l_signal <= 3'b000;
			end
		end
		
		else if (1 == right) begin
			l_signal <= 3'b000;

			if (r_signal == 3'b000) begin
				r_signal <= 3'b001;
			end
			else if (r_signal == 3'b001) begin
				r_signal <= 3'b011;
			end
			else if (r_signal == 3'b011) begin
				r_signal <= 3'b111;
			end
			else begin
				r_signal <= 3'b000;
			end
		end
		
		else begin
			l_signal <= 3'b000;
			r_signal <= 3'b000;
		end
end

endmodule