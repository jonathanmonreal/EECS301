module speedcount_pwm(clk_in, x_in, selector, PWM_out);   
            parameter bit = 6;  
 
            input clk_in, selector;     
            input [bit-1:0] x_in;     
            output reg [1:0] PWM_out = 0; 
     
            reg [bit-1:0] countera = 0;
				reg [bit-1:0] counterb = 0;
     
            always@ (posedge clk_in )begin
					if (selector) begin
                  if ( countera < x_in )
                        PWM_out[0] <= 1;
                  else
                        PWM_out[0] <= 0;
                  countera <= countera + 1;
                  end
					else begin 
						if (counterb < x_in)
								PWM_out[1] <= 1;
							else
								PWM_out[1] <= 0;			
							counterb <= counterb + 1;		
						end
					end
endmodule