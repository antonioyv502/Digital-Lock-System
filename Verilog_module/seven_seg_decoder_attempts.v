/* 
Seven-Segment Display Decoder for Attempt Counter
This module takes a 3-bit binary value representing the number of 
attempts (0-7) and converts it into an 8-bit pattern that controls 
a seven-segment HEX display. 
The HEX display uses active-low logic, so a 0 turns on an LED 
segment and a 1 turns off an LED segment. 
*/

module seven_seg_decoder_attempts(attempts, hex);

	input  [2:0] attempts;
	output [7:0] hex;
	
	reg [7:0] hex;

	//Update the HEX display whenever 'attempts' changes
	always @(*) begin 
		case(attempts)
		
			3'b000: hex = 8'hC0; // Display "0" on HEX display
			3'b001: hex = 8'hF9; // Display "1" on HEX display
			3'b010: hex = 8'hA4; // Display "2" on HEX display
			3'b011: hex = 8'hB0; // Display "3" on HEX display
			3'b100: hex = 8'h99; // Display "4" on HEX display
			3'b101: hex = 8'h92; // Display "5" on HEX display
			3'b110: hex = 8'h82; // Display "6" on HEX display
			3'b111: hex = 8'hF8; // Display "7" on HEX display
			
			default: hex = 8'hC0; // Default, display "0"
			
		endcase
	end
endmodule 
