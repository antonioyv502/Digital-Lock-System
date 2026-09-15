module digital_lock_top(MAX10_CLK1_50, SW, LEDR, HEX0);

input  		 MAX10_CLK1_50; //50MHz clk
input  [9:0] SW;
output [9:0] LEDR; 
output [7:0] HEX0;          // 7-segment display


wire [1:0] state;



assign HEX0 = (state == 2'b00) ? 8'hC0: // 0
			  (state == 2'b01) ? 8'hF9: // 1
			  (state == 2'b10) ? 8'hA4: // 2
		      (state == 2'b11) ? 8'hB0: // 3
				                 8'hC0; // default case(0)
											


digital_lock U1 (.clk(MAX10_CLK1_50), .reset(SW[0]), .x(SW[3:1]), .y(LEDR[0]), .state(state));


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

endmodule 
