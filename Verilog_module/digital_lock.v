module digital_lock(clk, reset, x, y, state);
  
    input        clk;   //clock signal
    input        reset; //Aysnchronous active high reset
    input [2:0]  x;     //3 bit input 
    output reg   y;
    output [1:0] state;
  
    //Clock = 50MHz 
    //50MHz = 50,000,000 cycles per second 
    // 2 seconds @ 50MHZ = 50,000,000 * 2 = 100,000,000
    
    parameter MAX_COUNT = 100_000_000; 
    reg [26:0] counter;
    reg pulse = 0;


    
    //Counter and pulse generation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0; //set counter to zero
            pulse <= 0;   //set pulse to zero
        end else if (counter == MAX_COUNT) begin
            counter <= 0; //reset counter when MAX_COUNT is reached
            pulse <= 1;   //set pulse to 1    
        end else begin
            counter <= counter + 1;
            pulse <= 0;      
        end
    end

    
    
   
    //Defining States
    parameter S_0 = 2'b00;  
    parameter S_1 = 2'b01;
    parameter S_2 = 2'b10;
    parameter S_3 = 2'b11;

    // State registers
    reg [1:0] current_state;
    reg [1:0] next_state;
    
    //allows us to be able to see the current state of flip flops and helpful for debugging
    assign state = current_state; 
    
    
  
    // State transition logic (clocked)
    always @(posedge clk or posedge reset) begin  //active high reset
        if (reset)
            current_state <= S_0; //Reset to iniital state
        else if (pulse)
            current_state <= next_state;
    end
  
  
  // Combinational logic for next state
    always @(*) begin
        case (current_state)
            S_0: 
                if (x == 3'b011)
                    next_state = S_1;
                else
                    next_state = S_0; //Reset to initial state
    
            S_1: 
                if (x == 3'b111)
                    next_state = S_2;
                else
                    next_state = S_0; //Reset to initial state
    
            S_2: 
                if (x == 3'b101)
                    next_state = S_3;
                else
                    next_state = S_0; //Reset to initial state 
    
            S_3: 
                next_state = S_0; 
    
            default: 
                next_state = S_0;
        endcase
    end
  
  
  //Output Combinational logic 
   always @(*) begin
    y = (current_state == S_3) ? 1'b1 : 1'b0;  //y only goes high when current state is S3(2'b11)
   end   
endmodule
