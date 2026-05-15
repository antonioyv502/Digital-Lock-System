module digital_lock_top(MAX10_CLK1_50, SW, LEDR);

input        MAX10_CLK1_50; //50MHz clk
input  [9:0] SW;
output [9:0] LEDR;


digital_lock U1 (.clk(MAX10_CLK1_50), .reset(SW[0]), .x(SW[3:1]), .y(LEDR[0]),  .state(LEDR[3:2]));


// Will use 7-segment display to display current state 
//# HEX0 Decoder: Displays state (0-7)
//# Note: HEX is Active-Low
//# 7-Seg Display code (active low)
//#0: 0xC0 
//#1: 0xF9
//#2: 0xA4
//#3: 0xB0

endmodule 
