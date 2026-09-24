module digital_lock(clk, reset, x, y, state, attempt);
	 
    input        clk;   // clock signal(50MHz)
    input        reset; // Aysnchronous active high reset
    input [2:0]  x;     // 3 bit input 
    output reg   y;
    output [1:0] state;
	output [2:0] attempt;
	 
	 
	// Defining States
    parameter S_0 = 2'b00;  
    parameter S_1 = 2'b01;
    parameter S_2 = 2'b10;
    parameter S_3 = 2'b11;
	 
	 
	// 50MHz = 50,000,000 = 1 second
	// 2 seonds  @ 50MHz = 50,000,000 * 2 = 100,000,000 counts
    parameter MAX_COUNT = 100_000_000; // 2 second 
	
    
	// State registers
    reg [1:0] current_state;
    reg [1:0] next_state;
	 
	 
	// Register holds number of incorrect sequence attempts
	reg [2:0] attempts;
		
    
    // allows us to be able to see the current state of flip flops and helpful for debugging
    assign state = current_state; 

	assign attempt = attempts;
	 
    // Counter and 2 second pulse generation logic
	 reg [26:0] counter;               // 27 bit counter can hold up to 100,000,000(2 seconds)
	 reg 			pulse;
	 
	 
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;    // Reset counter to 0 
            pulse   <= 0;    // Pulse starts at 0
        end else if (counter == MAX_COUNT - 1) begin
            counter <= 0;    // Reset counter after reaching MAX_COUNT
            pulse   <= 1;    // Generate 1 clock cycle pulse
        end else begin
            counter <= counter + 1;   // Increment counter each clock cycle
            pulse   <= 0;            // Keep pulse low until counter reaches MAX_COUNT   
        end
    end

	 

	
    
  
    // State transition logic 
    always @(posedge clk or posedge reset) begin  // active high reset
        if (reset) begin 
            current_state <= S_0;
        end else if (pulse) begin                       // change to else if (pulse) for hardware implementation
            current_state <= next_state; 
		end 		
    end 
	 
	 
	 
	 // Sequence Error Detection Logic 
	 always @(posedge clk or posedge reset) begin 
	 	 if (reset) begin 
	 			attempts <= 0;
	 	 end else if (pulse) begin 
	 		 if((current_state == S_1 && next_state == S_0) || (current_state == S_2 && next_state == S_0)) begin 
	 				attempts <= attempts + 1;
	 		 end 
	 	 end  
	 end  
   
  
    // Input Sequence: 3 → 7 → 5
    // Combinational logic for next state
    always @(*) begin
        case (current_state)
            S_0: 
                if (x == 3'b011)
                    next_state = S_1;
                else
                    next_state = S_0;
    
            S_1: 
                if (x == 3'b111)
                    next_state = S_2;
                else
                    next_state = S_0;
    
            S_2: 
                if (x == 3'b101)
                    next_state = S_3;
                else
                    next_state = S_0;
    
            S_3: 
				next_state = S_0;
						  	
            default: 
                next_state = S_0;
        endcase						
    end
	 
  
  
   // Output Combinational logic 
    always @(*) begin
		  y = (current_state == S_3) ? 1'b1 : 1'b0;  // y only goes high when current state is S_3(2'b11)
    end   
endmodule
