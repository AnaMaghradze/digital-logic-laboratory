module de0_nano_soc_baseline(
	input CLOCK_50,	
	output ADC_CONVST,   // comment this for simulation
	output ADC_SCLK,     // comment this for simulation
	output ADC_SDI,      // comment this for simulation
	input ADC_SDO,       // comment this for simulation	
	inout [35:0] GPIO_1  // comment this for simulation	
);

reg start = 1; 
reg [1:0] clock_25 = 0;

wire [11:0] digital_out;

wire [3:0] digitAtPosition;
wire [6:0] outsegment;
wire [3:0] position;

//wire ADC_SDO;															// uncomment this for simultation
//wire start_reading;													// uncomment this for simultation
//SDO_bits_sender bs(clock_25[1], start_reading, ADC_SDO); // uncomment this for simultation

ADC adc_inst(clock_25[1], start, ADC_SDO, ADC_SDI, ADC_SCLK, ADC_CONVST, digital_out, start_reading);	

digit_at_position_decoder dapd_inst(CLOCK_50, digital_out, digitAtPosition, position);

segment_decoder sd_inst(CLOCK_50, digitAtPosition, outsegment);

assign GPIO_1[6:0] = outsegment[6:0];	// comment this for simultation
assign GPIO_1[35:32] = position;			// comment this for simultation

always @(posedge CLOCK_50)
begin
	clock_25 <= clock_25 + 1;
	start <= 0;
end

endmodule
