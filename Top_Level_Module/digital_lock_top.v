module digital_lock_top(MAX10_CLK1_50, SW, LEDR);

input        MAX10_CLK1_50; //50MHz clk
input  [9:0] SW;
output [9:0] LEDR;


digital_lock U1 (.clk(MAX10_CLK1_50), .reset(SW[0]), .x(SW[3:1]), .y(LEDR[0]),  .state(LEDR[3:2]), .pulse_led(LEDR[7]));


endmodule 
