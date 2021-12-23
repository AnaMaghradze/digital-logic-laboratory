module digit_at_position_decoder(
	input clk,
	input [11:0] in,
	output reg [3:0] digitAtPosition, 
	output reg [3:0] position	
);

localparam CLK_HZ = 50000000; // 5 for simulation
integer clk_counter = 0;

integer count = 0;

always @(posedge clk)
begin
	if(clk_counter == CLK_HZ / 1000) // 1 instead of 1000 for simulation
	begin
		case(count)
			0: 
			begin
				digitAtPosition <= in % 10; 
				position <= 4'b0001;
			end
			1: 
			begin
				digitAtPosition <= ((in % 100) - (in % 10)) / 10;
				position <= 4'b0010;
			end
			2: 
			begin
				digitAtPosition <= ((in % 1000) - (in % 100)) / 100;
				position <= 4'b0100;
			end
			3: 
			begin
				digitAtPosition <= ((in % 10000) - (in % 1000)) / 1000;
				position <= 4'b1000;
			end
		endcase	
		
		count <= count == 4 ? 0 : count + 1;
		clk_counter <= 0;
	end
	else clk_counter <= clk_counter + 1;
end

endmodule
