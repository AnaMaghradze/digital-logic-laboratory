module decoder(
	input clk,
	input isCounting,
	input [3:0] digit,
	output reg [6:0] outsegment
);

always @(posedge clk)
begin
	if(isCounting)
	begin
		case(digit)
			0: outsegment <= 7'b1000000;
			1: outsegment <= 7'b1111001;	
			2: outsegment <= 7'b0100100;	
			3: outsegment <= 7'b0110000;
			4: outsegment <= 7'b0011001;
			5: outsegment <= 7'b0010010;	
			6: outsegment <= 7'b0000010;	
			7: outsegment <= 7'b1111000;	
			8: outsegment <= 7'b0000000;
			9: outsegment <= 7'b0010000;	
		endcase
	end
	else outsegment <= 7'b1000000;
	
end

endmodule