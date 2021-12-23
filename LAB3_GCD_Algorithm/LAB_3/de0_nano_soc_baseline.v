module de0_nano_soc_baseline(
	input CLOCK_50,
	input	[3:0]	SW,
	input	[1:0]	KEY,
	output reg [7:0] LED
);

reg [1:0] prevKey = 1;
reg [7:0] A = 0;
reg [7:0] B = 0;

reg [3:0] state = 1;
reg start = 0;

wire [7:0] result;
wire result_ready;

GCD gcd(CLOCK_50, start, A, B, result, result_ready);

always @(posedge CLOCK_50)
begin

	if(KEY[0] == 1 && prevKey[0] == 0) state <= state + 1;
	
	if(state == 0) LED <= 0;
	else if(state == 1) A[7:4] <= SW;	
	else if(state == 2) A[3:0] <= SW;
	else if(state == 3) B[7:4] <= SW; 
	else if(state == 4) B[3:0] <= SW;
	else if(state == 5) start <= 1;
		
	if(result_ready) 
	begin
		LED <= result;
		start <= 0;
		state <= 0;
	end
	
	prevKey[0] <= KEY[0];
end

endmodule
