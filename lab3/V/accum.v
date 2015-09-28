module accum (CLK, CLR, D, Q); 
input CLK, CLR; 
input  [7:0] D;
input  [8:0] EN 
output [7:0] Q; 
reg    [7:0] tmp;  
 
  always @(posedge CLK or posedge CLR) 
    begin 
      if (CLR) 
        tmp = 8'b00000000; 
      else if (EN[0]) 
        tmp = tmp + D; 
    end 
  assign Q = tmp; 
endmodule