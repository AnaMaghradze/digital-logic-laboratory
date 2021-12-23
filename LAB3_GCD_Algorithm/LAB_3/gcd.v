 module GCD(
	input clk, 
	input start,
	input [7:0] A,
	input [7:0] B,
	output reg [7:0] gcd_result,
	output reg ready
);

reg [7:0] a;
reg [7:0] b;
reg [1:0] state = 0;

always @(posedge clk)
begin
	if(state == 0)
	begin
		gcd_result <= 0;
		ready <= 0;
		if(start) 
		begin
			if(A[7]) a <= -A;
			else a <= A ;
			if(B[7]) b <= -B;
			else b <= B ;
			state <= 1;
		end		
	end
	else if(state == 1)
	begin 	
		if(a == 0) 
		begin		
			gcd_result <= b;
			state <= 2;
		end
		else if(b == 0) 
		begin		
			gcd_result <= a;
			state <= 2;
		end
		else if(a >= b) 
		begin
			a <= a - b;
			state <= 1;
		end
		else if(b > a)
		begin
			b <= b - a;
			state <= 1;
		end
	end
	if(state == 2)
	begin		
		ready <= 1;
		if(ready) state <= 0;
	end
end
endmodule