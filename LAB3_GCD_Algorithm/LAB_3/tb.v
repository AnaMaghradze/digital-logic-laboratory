module tb;
reg clk = 0;
reg [3:0] sw = 0;
reg [1:0] key = 0;
wire [7:0] led;
	
de0_nano_soc_baseline gcd(clk, sw, key, led);

always #5 clk <= ~clk;

initial 	
begin
	// GCD of -17 and 5 
	#10 sw = 4'b1110;
	#10 key = 1;
	#10 key = 0;
	
	#10 sw = 4'b1111;
	#10 key = 1;
	#10 key = 0;
	
	#10 sw = 4'b0000;
	#10 key = 1;
	#10 key = 0;
	
	#10 sw = 4'b0101;
	#10 key = 1;
	#10 key = 0;
	
	#10 key = 1;
	#10 key = 0;
		
	#200 key = 1;
	#10 key = 0;
	
	// GCD of 50 and 30; 
	#10 sw = 4'b0011;
	#10 key = 1;
	#10 key = 0;
	
	#10 sw = 4'b0010;
	#10 key = 1;
	#10 key = 0;
	
	#10 sw = 4'b0001; 
	#10 key = 1;
	#10 key = 0;
	
	#10 sw = 4'b1110;
	#10 key = 1;
	#10 key = 0;	
	
	#10 key = 1;
	#10 key = 0;	
	
end

endmodule