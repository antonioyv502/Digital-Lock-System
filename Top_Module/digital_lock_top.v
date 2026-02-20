module digital_lock_top(SW, LEDR);


input  [9:0] SW;
output [9:0] LEDR; 




digital_lock U1 (.clk(SW[6]), .reset(SW[0]), .x(SW[4:2]), .y(LEDR[0]),  .state(LEDR[3:2]));


endmodule 
