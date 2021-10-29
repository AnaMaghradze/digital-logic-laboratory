 module shift_register_checker(
	input clk,
	input [3:0] data_in,
	input [1:0] enter_in,	
	output reg [3:0] data_out
);

// redID: 346
reg [1:0] state = 0;
reg [1:0] prevKey = 1;

always @(posedge clk)
begin
	if(enter_in[0] == 1 && prevKey[0] == 0)
	begin
		case(state)
			0: state <= data_in == 3 ? 1 : 0;
			1:	state <= data_in == 4 ? 2 : data_in == 3 ? 1 : 0;
			2: state <= data_in == 6 ? 3 : data_in == 3 ? 1 : 0;
			3:	state <= 0;
		endcase
	end			
	
	data_out[3:0] <= state == 3 ? 4'b1111 : 0; 
	
	prevKey[0] <= enter_in[0];
end

endmodule