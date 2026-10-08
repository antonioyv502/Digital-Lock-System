module seven_seg_decoder_attempts(attempts, hex);

	input  [2:0] attempts;
	output [7:0] hex;
	
	reg [7:0] hex;
	
	always @(*) begin 
		case(attempts)
		
			3'b000: hex = 8'hC0; // attempts 000, display "0" on hex display
			3'b001: hex = 8'hF9; // attempts 001, display "1" on hex display
			3'b010: hex = 8'hA4; // attempts 010, display "2" on hex display
			3'b011: hex = 8'hB0; // attempts 011, display "3" on hex display
			3'b100: hex = 8'h99; // attempts 100, display "4" on hex display
			3'b101: hex = 8'h92; // attempts 101, display "5" on hex display
			3'b110: hex = 8'h82; // attempts 110, display "6" on hex display
			3'b111: hex = 8'hF8; // attempts 111, display "7" on hex display
			
			default: hex = 8'hC0; 
			
		endcase
	end
endmodule 
