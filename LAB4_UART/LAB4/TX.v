module transmitter(
	input clk,
	input [19:0] baudRate,
	input [7:0] DATA, 
	input START_TX,
	output reg Tx // for simulation
//	inout	reg [35:0] GPIO_0
 );
 
localparam CLK_HZ = 5;//50000000;
integer clock_counter = 0;

localparam START_BIT = 0; 
localparam STOP_BIT = 1; 

reg [10:0] DATA_transmit = 0;
reg [3:0] count = 11;
reg transmitting = 0;
wire ODD_PARITY_BIT;

assign ODD_PARITY_BIT = ~(^DATA);

always @(posedge clk)
begin
	if(START_TX == 1 || transmitting == 1)
	begin
		transmitting <= 1;
		if(clock_counter == (CLK_HZ / baudRate))
		begin		
			if(count == 11)
			begin
				DATA_transmit[10] <= START_BIT;
				DATA_transmit[9:2] <= DATA;
				DATA_transmit[1] <= ODD_PARITY_BIT;
				DATA_transmit[0] <= STOP_BIT;
				count <= 10;
			end
			else 
			begin
				Tx <= DATA_transmit[count];
//				GPIO_0[0] <= DATA_transmit[count];
				count <= count == 0 ? 11 : count - 1;
				if(count == 0) transmitting <= 0;
			end
			clock_counter <= 0;
		end
		else clock_counter <= clock_counter + 1;
	end
	else
	begin
		if(count == 11)
		begin
			DATA_transmit <= 0;
//			GPIO_0[0] <= 1;			
			Tx <= 1;
		end
	end
end
 
endmodule
