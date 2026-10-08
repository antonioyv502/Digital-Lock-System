/* 
Seven-Segment Display Decoder for FSM State
This module takes a 2-bit binary value representing the state of the FSM and converts it into an 8-bit 
pattern that controls a seven-segment HEX display.
Each FSM state is represented by a different number (0-3) on the 
HEX display.
The HEX display uses active-low logic, so a 0 turns on an LED 
segment and a 1 turns off an LED segment.
*/



module seven_seg_decoder_state(state, hex);

	input  [1:0] state; // 2 bit FSM state 
	output [7:0] hex;   // 8 bit output for the 7-segment display 
	
	reg [7:0] hex;

	// Update HEX display whenever "state" changes
	always @(*) begin 
		case(state)
		
			2'b00: hex = 8'hC0; // Display "0" on HEX display
			2'b01: hex = 8'hF9; // Display "1" on HEX display
			2'b10: hex = 8'hA4; // Display "2" on HEX display
			2'b11: hex = 8'hB0; // Display "3" on HEX display
			
			default: hex = 8'hC0; // Default, display "0"
			
		endcase
	end 
endmodule 



	 //# HEX0 Decoder: Displays state (0-7)
    //# Note: HEX is Active-Low
    //# 7-Seg Display code (active low)
    //#0: 0xC0 
    //#1: 0xF9
    //#2: 0xA4
	 //#3: 0xB0
	 //#4: 0x99
	 //#5: 0x92
	 //#6: 0x82
	 //#7: 0xF8
