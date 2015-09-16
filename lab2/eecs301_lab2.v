// Authors: Jonathan Monreal (jem177) and Jiawei Wu (jxw585)

// The top-level Verilog file for eecs301_lab2
// This code was initially generated by Terasic System Builder

module eecs301_lab2(

         //////////// ADC //////////
         output ADC_CONVST,
         output ADC_DIN,
         input ADC_DOUT,
         output ADC_SCLK,

         //////////// CLOCK //////////
         input CLOCK_50,
         input CLOCK2_50,
         input CLOCK3_50,
         input CLOCK4_50,

         //////////// SEG7 //////////
         output [ 6: 0 ] HEX0,
         output [ 6: 0 ] HEX1,
         output [ 6: 0 ] HEX2,
         output [ 6: 0 ] HEX3,
         output [ 6: 0 ] HEX4,
         output [ 6: 0 ] HEX5,

         //////////// KEY //////////
         input [ 3: 0 ] KEY,

         //////////// LED //////////
         output [ 9: 0 ] LEDR,

         //////////// SW //////////
         input [ 9: 0 ] SW,

         //////////// VGA //////////
         output [ 7: 0 ] VGA_B,
         output VGA_BLANK_N,
         output VGA_CLK,
         output [ 7: 0 ] VGA_G,
         output VGA_HS,
         output [ 7: 0 ] VGA_R,
         output VGA_SYNC_N,
         output VGA_VS,

         //////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
         inout [ 35: 0 ] GPIO_0,

         //////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
         inout [ 35: 0 ] GPIO_1
       );

//=======================================================
//  REG/WIRE declarations
//=======================================================
// Signals for connection to motor
wire [1:0] motor_in;
wire motor_en;
wire encoder_a, encoder_b;

// Assignment for buttons
wire [3:0] buttons;

// Assignment for pwm counter
wire reset_count;
wire [8:0] pwm_count;

// Assignments for k, g, m, and direction
wire [7:0] k;
wire [8:0] g;
wire m;
wire direction;

// Assignment for a slow clock
wire slow_clk;

//=======================================================
//  Structural
//=======================================================
// Connect the motor signals to the GPIO
assign {GPIO_0[3], GPIO_0[1]} = motor_in;
assign GPIO_0[4] = motor_en;
assign motor_en = SW[0];
assign {encoder_b, encoder_a} = GPIO_0[7:6];

// Assign the buttons to be the inverse of the active low keys
assign buttons = ~KEY;
assign k = SW[9:2];
assign LEDR[8:0] = g;
assign motor_in[0] = pwm_count[7];


counter count(
	.clk(CLOCK_50),
	.reset(reset_count),
	.count(pwm_count)
);

goal_counter goal(
	.clk(slow_clk),
	.up(buttons[0]),
	.down(buttons[1]),
	.reset(buttons[2]),
	.msb(direction),
	.goal_speed(g)
);

clock_divider slow(
	.n(22),
	.clk(CLOCK_50)
	.clk_out(slow_clk))
)

speed_counter find(
	.input_a(encoder_a),
	.input_b(encoder_b),
	.speed(m)
);

endmodule
