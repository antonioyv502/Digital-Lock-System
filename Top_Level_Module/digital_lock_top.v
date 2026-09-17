module digital_lock_top(MAX10_CLK1_50, SW, LEDR, HEX0, HEX1);

input		 MAX10_CLK1_50; //50MHz clk
input  [9:0] SW;
output [9:0] LEDR; 
output [7:0] HEX0;          // 7-segment display
output [7:0] HEX1;          // 7-segment display



wire [1:0] state;



											
// Display U when unlocked (state 3), otherwise display L (locked)											
assign HEX1 = (state == 2'b11) ? 8'hC1 : 8'hC7; 
											


digital_lock 		U0 (.clk(MAX10_CLK1_50), .reset(SW[0]), .x(SW[3:1]), .y(LEDR[0]), .state(state));

seven_seg_decoder 	U1 (.state(state), .hex(HEX0));


endmodule 
