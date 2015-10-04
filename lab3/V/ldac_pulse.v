module ldac_pulse(clk_in, left, right, PWM_out);   
            parameter bit = 8;  
 
            input clk_in;     
            input [bit-1:0] left,right;     
            output reg PWM_out = 1; 
     
            reg [bit-1:0] counter = 0;
     
            always@ (posedge clk_in )begin
                  if ( counter > left & counter < right)
                        PWM_out <= 0;
						else
                        PWM_out <= 1;
                  counter <= counter+1;
                  end
endmodule