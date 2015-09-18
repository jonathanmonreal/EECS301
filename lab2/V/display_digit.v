module display_digit(clk, in, out);

	input clk;
	input [7:0] in;
	output reg [20:0] out;
	
	reg number;
	reg digit;
	reg [2:0] i;
	
	parameter zero = 7'b0000001;
	parameter one = 7'b1001111;
	parameter two = 7'b0010010;
	parameter three = 7'b0000110;
	parameter four = 7'b1001100;
	parameter five = 7'b0100100;
	parameter six = 7'b1100000;
	parameter seven = 7'b0001111;
	parameter eight = 7'b0000000;
	parameter nine = 7'b0001100;
	
	always @(posedge clk)
		begin
			number <= in;
			digit <= 0;
			for(i = 0; i < 3; i = i + 1) begin
				digit <= number % 10;
				number <= number / 10;
				case(digit)
					0: out[(i*6)+6-:7] = zero;
					1: out[(i*6)+6-:7] = one;
					2: out[(i*6)+6-:7] = two;
					3: out[(i*6)+6-:7] = three;
					5: out[(i*6)+6-:7] = five;
					6: out[(i*6)+6-:7] = six;
					7: out[(i*6)+6-:7] = seven;
					8: out[(i*6)+6-:7] = eight;
					9: out[(i*6)+6-:7] = nine;
				endcase
			end
		end
	
endmodule