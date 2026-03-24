module digital_lock_top(KEY, SW, LEDR);

input  [1:0] KEY; //pushbuttons 
input  [9:0] SW;
output [9:0] LEDR; 

wire clk;

assign clk = KEY[0]; 

digital_lock U1 (.clk(clk)]), .reset(SW[0]), .x(SW[4:2]), .y(LEDR[0]),  .state(LEDR[3:2]));

endmodule 
