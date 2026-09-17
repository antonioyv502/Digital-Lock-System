module seven_seg_decoder(state, hex);

	input  [1:0] state;
	output [7:0] hex; 
	
	reg [7:0] hex;

	always @ (*) begin 
		case(state)
			2'b00: hex = 8'hC0; // displays 0
			
			2'b01: hex = 8'hF9; // displays 1
			 
			2'b10: hex = 8'hA4; // displays 2
			
			2'b11: hex = 8'hB0; // displays 3
			
			default: hex = 8'hC0; // default case displays 0
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