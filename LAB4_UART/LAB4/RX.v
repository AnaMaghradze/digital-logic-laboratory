module receiver(
	input clk,
	input [19:0] baudRate,
	input Rx, // for simulation 	
	output reg [7:0] DATA_OUT
//	inout	reg [35:0] GPIO_0
);

reg [3:0] count = 11;
reg [10:0] DATA_received = 0;

localparam CLK_HZ = 5;//50000000;
integer clock_counter = 0;

always @(posedge clk)
begin	
	if(clock_counter == (CLK_HZ / baudRate))
	begin
		if(count == 0)
		begin
			if(~(^DATA_received[9:2]) == DATA_received[1])
			begin
				DATA_OUT <= DATA_received[9:2];
			end
			else DATA_OUT <= 8'b11111111;
			count <= 11;
		end	
		else 
		begin
			if(count == 11 && Rx == 0) // Rx insted of GPIO_0[1] for simulation
			begin
//				DATA_received[10] <= GPIO_0[1]; 
				DATA_received[10] <= Rx;
				count <= 9; 
			end
			else if(count < 11) 
			begin
//				DATA_received[count] <= GPIO_0[1]; 
				DATA_received[count] <= Rx;		
				count <= count - 1;
			end
		end
	
		clock_counter <= 0;
	end
	else clock_counter <= clock_counter + 1;
end

endmodule