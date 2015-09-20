module speedcount_pwm(clk_in, x_in, PWM_out);   
            parameter bit = 6;  
 
            input clk_in;     
            input [bit-1:0] x_in;     
            output reg PWM_out = 1; 
     
            reg [bit-1:0] counter = 0;
     
            always@ (posedge clk_in )begin
                  if ( counter < x_in )
                        PWM_out <= 1;
                  else
                        PWM_out <= 0;
                  counter <= counter+1;
                  end
endmodule