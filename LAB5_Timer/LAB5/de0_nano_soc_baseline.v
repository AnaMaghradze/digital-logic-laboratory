module de0_nano_soc_baseline(
	input CLOCK_50,
	input [1:0] KEY, 
	inout [35:0] GPIO_1
);

reg [1:0] prevKey = 2'b11;

localparam CLK_HZ = 50000000; 
integer clock_counter = 0;
reg isTimerCounting = 0;

integer counter = 0;

wire [3:0] digitAtPosition;
wire [6:0] outsegment;
wire [3:0] position;

digitPositionDecoder d2(CLOCK_50, counter, digitAtPosition, position);
decoder d1(CLOCK_50, isTimerCounting, digitAtPosition, outsegment);

assign GPIO_1[6:0] = outsegment[6:0];  // comment this for modelsim
assign GPIO_1[35:32] = position;			// comment this for modelsim

always @(posedge CLOCK_50)
begin
	if((clock_counter == CLK_HZ) && isTimerCounting)
	begin
		counter <= counter + 1;
		clock_counter <= 0;
	end
	else if(isTimerCounting) clock_counter <= clock_counter + 1;
	
	if(KEY[0] && prevKey[0] == 0) 
	begin
		isTimerCounting <= 0;
		counter <= 0;		
	end
	if(KEY[1] && ~prevKey[1]) isTimerCounting <= ~isTimerCounting;
	prevKey <= KEY;
end

endmodule
