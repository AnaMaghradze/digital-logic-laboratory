module de0_nano_soc_baseline(
	input CLOCK_50,
	input	[1:0]	KEY,
	input [3:0]	SW,
	output reg [7:0] LED	
);

	reg [1:0] prevKey = 1;
	reg [1:0] stage = 2'b00;
   reg [3:0] press_counter_A = 0;
   reg [3:0] press_counter_B = 0;

	always @(posedge CLOCK_50)
	begin		
		// stage #0
		if(stage == 2'b00)
		begin
			press_counter_A[3:0] <= 0;
			press_counter_B[3:0] <= 0;
			LED[7:0] <= 0; // turn off all leds
			if(KEY[0] == 1 && prevKey[0] == 0) stage <= 2'b01; // go to the stage #1
		end
		// stage #1
		if(stage == 2'b01)
		begin
			LED[0] <= 1;
			if(KEY[1] == 1 && prevKey[1] == 0) press_counter_A <= press_counter_A + 1;
			if(KEY[0] == 1 && prevKey[0] == 0) stage <= 2'b10; // go to the stage #2
		end
		// stage #2
		if(stage == 2'b10)
		begin
			LED[1] <= 1; // led1 and led2 are ON
			if(KEY[1] == 1 && prevKey[1] == 0) press_counter_B <= press_counter_B + 1;
			if(KEY[0] == 1 && prevKey[0] == 0) stage <= 2'b11; // go to the stage #3			 
		end
		// stage #3
		if(stage == 2'b11)
		begin
			LED[7:0] <= press_counter_A * press_counter_B;			
			if(KEY[0] == 1 && prevKey[0] == 0) stage <= 2'b00; // go to the stage #0 
		end
		
		prevKey[0] <= KEY[0];
		prevKey[1] <= KEY[1];
	end  
  
endmodule