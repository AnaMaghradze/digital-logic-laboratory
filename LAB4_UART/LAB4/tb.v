module tb;

reg clk = 0;
reg [1:0] KEY = 0;
reg [3:0] SW = 0;
wire [7:0] LED;

always #5 clk <= ~clk;

de0_nano_soc_baseline uart(clk, SW, KEY, LED);

initial 
begin
	#10 SW = 5;
	#10 KEY = 1;
	#10 KEY = 0;
	
	#10 SW = 2;
	#10 KEY = 1;
	#10 KEY = 0;	
	
	#10 KEY = 2;
	#10 KEY = 0;
	
	#1000 KEY = 1;
	#10 KEY = 0;
end


endmodule