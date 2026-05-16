`timescale 1ns / 100ps

module tb_digital_lock;

    // Testbench signals
    reg        clk;
    reg        reset;
    reg [2:0]  x;
    wire       y;
    wire [2:0] state;

    // Instantiate the digital_lock module
    digital_lock DUT (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .state(state)
    );
    
    integer errors = 0;

    // Clock generation (50 MHz clock)
    always begin
        #10 clk = ~clk;  // Toggle clock every 10 time units (50 MHz)
    end

    task apply_and_check;
        input [2:0] in;
        input [2:0] expected_state;
        input       expected_y;
    
    begin 
        x = in;
        #20; //Wait 1 clock cycle
            
        if(state != expected_state || y != expected_y) begin 
            $display("Error @ %0t | x=%b | state=%b y=%b | Got: state=%b y=%b", 
                      $time, in, expected_state, expected_y, state, y);
				errors = errors + 1;
            
        end else begin 
				$display("Pass @ %0t | x=%b | state=%b y=%b" , $time, in, state, y);
        end 
    end
    endtask
        
    
    
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
        apply_and_check(3'b011, 3'b001, 1'b0);   //Transition to S1
        apply_and_check(3'b111, 3'b010, 1'b0);   //Transition to S2
        apply_and_check(3'b101, 3'b011, 1'b1);   //Transition to S3 (unlock)

        
        apply_and_check(3'b000, 3'b000, 1'b0); //Transition to S0 
        apply_and_check(3'b100, 3'b000, 1'b0); //Stay in S0
        
        apply_and_check(3'b011, 3'b001, 1'b0); //Transition to S1
        apply_and_check(3'b111, 3'b010, 1'b0); //Transition to S2
        apply_and_check(3'b100, 3'b000, 1'b0); //Transition to S0
		  
		apply_and_check(3'b011, 3'b001, 1'b0); //Transition to S1
		apply_and_check(3'b111, 3'b010, 1'b0); //Transition to S2
		apply_and_check(3'b010, 3'b000, 1'b0); //Transition to S0
		 
        if(errors == 0)
            $display("\n ALL TESTS PASSED");
        else
            $display("\n Test FAILED with %0d errors", errors);

        // Finish simulation
        $finish;
    end
endmodule
