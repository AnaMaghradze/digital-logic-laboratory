module tb;
reg clk = 0;
reg [3:0] data_in = 0;
reg [1:0] enter_in = 0;
wire [3:0] data_out;

shift_register_checker shiftRegChecker(clk, data_in, enter_in, data_out);

always #5 clk <= ~clk;

initial 
begin
	// 3 _ _
	#10 data_in = 3;
	#10 enter_in = 1;
	#10 enter_in = 0;
	
	// 3 _ _
	#10 data_in = 3;
	#10 enter_in = 1;
	#10 enter_in = 0;

	// 3 4 _
	#10 data_in = 4;
	#10 enter_in = 1;
	#10 enter_in = 0;
	
	//	3 4 _
	#10 data_in = 4;
	#10 enter_in = 1;
	#10 enter_in = 0;

	//	3 _ _
	#10 data_in = 5;
	#10 enter_in = 1;
	#10 enter_in = 0;	
		
	// 3 _ _
	#10 data_in = 3;
	#10 enter_in = 1;
	#10 enter_in = 0;
	
	//	3 4 _
	#10 data_in = 4;
	#10 enter_in = 1;
	#10 enter_in = 0;
	
	// 3 4 6
	#10 data_in = 6;
	#10 enter_in = 1;
	#10 enter_in = 0;
	
	// 3 4 6
	#10 data_in = 6;
	#10 enter_in = 1;
	#10 enter_in = 0;
	
	#10 enter_in = 1;
	#10 enter_in = 0;
	
end

endmodule