module tb;

reg clk = 0;
reg [1:0] key = 0;
reg [3:0] sw = 0;
wire [7:0] led;

de0_nano_soc_baseline press_multiplier(clk, key, sw, led);

always #5 clk <= ~clk;

initial 
begin
	// key[0] is ON, go to stage 1
	#10 key = 2'b01;	
	// in stage 1 increment press_counter_A when key[1] is ON	
	#10 key = 2'b10; // press_counter_A = 1
	#10 key = 2'b00; // turn off bits
	
	#10 key = 2'b10; // press_counter_A = 2
	#10 key = 2'b00; // turn off bits
	
	#10 key = 2'b10; // press_counter_A = 3	
	#10 key = 2'b00; // turn off bits
	
	// key[0] is ON, go to stage 2, 
	#10 key = 2'b01;
	// in stage 1 increment press_counter_B 	
	#10 key = 2'b10; // press_counter_B = 1
	#10 key = 2'b00; // turn off bits
	
	#10 key = 2'b10; // press_counter_B = 2
	#10 key = 2'b00; // turn off bits
	
	// go to stage 3 
	// the OUTPUT of multiplication
	#10 key = 2'b01;
	#10 key = 2'b00;
	
	// go to stage 0	
	#10 key = 2'b01; 
	#10 key = 2'b00;
end

endmodule
