module pwm (
    input clk,
    input rst,
    input [7:0] compare,
    output m
  );
   
  reg pwm_d, pwm_q;
  reg [7:0] ctr_d;
  reg [7:0] ctr_q ;
  reg [7:0] process = 8'b0;
   
  assign m = pwm_q;
  
  always @(*) begin
    ctr_d = ctr_q + 1'b1; 
	 process[6:0]  = compare[7:1];
	 process[7]=1'b1;
    if (process > ctr_q)
      pwm_d = 1'b1;
    else
      pwm_d = 1'b0;
  end
   
  always @(posedge clk) begin
    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end
     
    pwm_q <= pwm_d;
  end
   
endmodule

