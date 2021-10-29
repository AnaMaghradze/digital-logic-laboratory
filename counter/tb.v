module tb;
	reg clk = 0;
	reg [4:0] sw =0;
	reg [1:0] key =0;
	wire [7:0] led;
	
de0_nano_soc_baseline counter(clk, key, led, sw);

always #5 clk <= ~clk;

initial begin
	#10 key = 2'b00;
	#10 key = 2'b01;
	#10 key = 2'b00;
	
	#10 key = 2'b01;
	#10 key = 2'b00;
	
	#10 key = 2'b01;	
	#30 key = 2'b00;
end

endmodule