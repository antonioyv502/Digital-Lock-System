module seven_seg_decoder_state(state, hex);

	input  [1:0] state; // 2 bit FSM state 
	output [7:0] hex;   // 8 bit output for the 7 segment display 
	
	reg [7:0] hex;
	
	always @(*) begin 
		case(state)
		
			2'b00: hex = 8'hC0; // State 00, display "0" on hex display
			2'b01: hex = 8'hF9; // State 01, display "1" on hex display
			2'b10: hex = 8'hA4; // State 10, display "2" on hex display
			2'b11: hex = 8'hB0; // State 11, display "3" on hex display
			
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
