module seven_seg_decoder_attempts(attempts, hex);

	input  [2:0] attempts;
	output [7:0] hex;
	
	reg [7:0] hex;
	
	always @(*) begin 
		case(attempts)
		
			3'b000: hex = 8'hC0;
			3'b001: hex = 8'hF9;
			3'b010: hex = 8'hA4;
			3'b011: hex = 8'hB0;
			3'b100: hex = 8'h99;
			3'b101: hex = 8'h92;
			3'b110: hex = 8'h82;
			3'b111: hex = 8'hF8;
			
			default: hex = 8'hC0;
			
		endcase
	end
endmodule 