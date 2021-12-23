module de0_nano_soc_baseline(
	input CLOCK_50,
	input	[3:0]	SW,
	input	[1:0]	KEY,
//	inout	[35:0] GPIO_0,
	output [7:0] LED
);

reg [1:0] prevKey = 3;
reg [2:0] state = 0;
reg [7:0] DATA = 0;
reg [19:0] baudRate = 1;//1000;

wire START_TX;
wire [7:0] DATA_OUT;

//// instcances for simulation
 transmitter TX(CLOCK_50, baudRate, DATA, START_TX, Tx);
 receiver RX(CLOCK_50, baudRate, Tx, DATA_OUT);

// instcances for board
//transmitter TX(CLOCK_50, baudRate, DATA, START_TX, GPIO_0);
//receiver RX(CLOCK_50, baudRate, DATA_OUT, GPIO_0);
 
assign LED = DATA_OUT;
assign START_TX = (KEY[1] == 1 && prevKey[1] == 0);

always @(posedge CLOCK_50)
begin	
	if(KEY[0] == 1 && prevKey[0] == 0)
	begin
		case(state)
			0: begin
					DATA[3:0] <= SW;
					state <= 1;
				end  
			1: begin
					DATA[7:4] <= SW;
					state <= 0;
				end 
		endcase
	end
	
	prevKey <= KEY;
end

endmodule
