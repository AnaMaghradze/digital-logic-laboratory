module de0_nano_soc_baseline(
	input CLOCK_50,
	input	[3:0] SW,
	input	[1:0]	KEY,
	output [7:0] LED	
);

shift_register_checker shiftRegCheck(CLOCK_50, SW[3:0], KEY[1:0], LED[3:0]);

endmodule