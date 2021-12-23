module tb;

reg clk = 0;
reg [1:0] KEY = 0;

always #5 clk <= ~clk;

de0_nano_soc_baseline timer(clk, KEY);

initial 
begin
	// start counting
	#10 KEY[1] = 1;
	#10 KEY[1] = 0;
	
	#5000
	
	// pause counting
	#10 KEY[1] = 1;
	#10 KEY[1] = 0;
	
	#30
	
	// resume counting
	#10 KEY[1] = 1;
	#10 KEY[1] = 0;
	
	#30
	
	//	reset
	#10 KEY[0] = 1;
	#10 KEY[0] = 0;

end

endmodule
