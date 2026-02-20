`timescale 1ns / 100ps

module tb2_digital_lock;

    // Testbench signals
    reg clk;
    reg reset;
    reg [2:0] x;
    wire y;
    wire [1:0] state;

    // Instantiate the digital_lock module
    digital_lock DUT (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .state(state)
    );

    // Clock generation (50 MHz clock)
    always begin
        #10 clk = ~clk;  // Toggle clock every 10 time units (50 MHz)
    end

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        x = 3'b000;

    

        // Apply reset
        reset = 1;
        #20;  // Wait for two clock cycles
        reset = 0;
        
        // Test sequence
        x = 3'b001; // Stay in S0
        #20;
        
        x = 3'b111; // Stay in S0
        #20;
        
        x = 3'b101; // Stay in S0
        #20;
        
        x = 3'b010; // Stay in S0
        #20;
        
        
        x = 3'b011; // Transition to S1 
        #20;
        
        x = 3'b111; // Transition to S2
        #20;
		
      	x = 3'b101;  // Transition to S3 again
      	#20;
      
      	x = 3'b100; // Going back to S0
        #20;
      
        // Finish simulation
        $finish;
    end

endmodule





