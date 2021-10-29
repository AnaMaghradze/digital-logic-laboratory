module de0_nano_soc_baseline(
	//////////// CLOCK //////////
	input 		          		CLOCK_50,

	//////////// KEY ////////////
	/* 3.3-V LVTTL */
	input				[1:0]			KEY,
	
	//////////// LED ////////////
	/* 3.3-V LVTTL */
	output		reg	[7:0]			LED,
	
	//////////// SW ////////////
	/* 3.3-V LVTTL */
	input				[3:0]			SW

);

	reg [1:0] prevKey = 0;
	reg [7:0] counter = 0;	
	
	always @(posedge CLOCK_50)
	begin
		if(KEY[0] == 1 && prevKey[0] == 0)
		begin
			counter <= counter + 1;
			LED[7:0] <= counter[7:0];
		end
		prevKey[0] <= KEY[0];
	end
	
endmodule