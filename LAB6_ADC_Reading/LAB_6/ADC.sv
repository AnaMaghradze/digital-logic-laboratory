module ADC(
	input logic clk,
	input logic start,	
	input  logic SDO,
	output logic SDI, 	
	output logic SCK,
	output logic CONVST,
	output logic [11:0] digital_out,
	output logic start_reading_SDO
);

/*
channel[0] => S/D = 1;
channel[1] => O/S = 0;
channel[2] => S1  = 1;
channel[3] => S0  = 0;
channel[4] => UNI = 1;
channel[5] => SLP = 0;
*/
localparam [5:0] channel = 6'b010101; // channel #4, unipolar, no sleep mode
localparam T_whconv = 1;
localparam T_conv = 36;  // 1 / 1.3e-6 = 769,230.7692, 25mln / 769,230.7692

integer bits_counter = 0;
integer t_conv_counter = 0;
integer t_whconv_counter = 0;

reg clock_25_reg;
reg start_reading = 0;
reg start_conversion = 0; 
reg next_reading_cycle = 0;

assign SCK = clk & clock_25_reg;

assign start_reading_SDO = start_reading; // used for simulation

always @(posedge clk) digital_out[12 - bits_counter] <= SDO;

always @(negedge clk) 
begin
	clock_25_reg <= start_reading;	
	if(start || next_reading_cycle) CONVST <= 1;
	
	// handling t_WHCONV, start conversion
	if((t_whconv_counter == T_whconv) && ~start_reading)
	begin
		CONVST <= 0;
		t_whconv_counter <= 0;	
		start_conversion <= 1;		
		next_reading_cycle <= 0;		
	end
	else if(~start_reading) t_whconv_counter <= t_whconv_counter + 1;	
		
	// handling t_CONV, start reading
	if(start_conversion)
	begin
		if(t_conv_counter == T_conv)
		begin
			start_reading <= 1; 
			t_conv_counter <= 0;
			start_conversion <= 0;
		end
		else t_conv_counter <= t_conv_counter + 1;
	end
		
	// handling bits count, send config bits
	if(start_reading) 
	begin
		if(bits_counter == 12)
		begin
			bits_counter <= 0;
			start_reading <= 0;
			next_reading_cycle <= 1;
		end
		else 
		begin
			bits_counter <= bits_counter + 1;
			if(bits_counter < 6) SDI <= channel[bits_counter]; 
		end
	end			
end

endmodule


// For simulation
// sends 12 bits as SDO 
module SDO_bits_sender(
	input clk, 
	input start_reading,
	output reg SDO_out
);

localparam [11:0] SDO_bits = 4094; // ეს შეგიძლიათ ნებისმიერი რიცხვი გქონდეთ 0დან 4095მდე
integer i = 0;

always @(posedge clk)
begin
	if(start_reading)
	begin
		if(i < 12)
		begin
			i <= i + 1;
			SDO_out <= SDO_bits[i];
		end
		else i <= 0;
	end
	else SDO_out <= 1'bx;
end

endmodule



