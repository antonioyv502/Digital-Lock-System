module digital_lock (clk, reset, x, y);
  
  input clk;
  input reset;
  input [2:0] x;
  output reg y;

     //SystemVerilog 
    //Defining the states
    /*typedef enum logic [1:0] {
        S0 = 2'b00,
        S1 = 2'b01,
        S2 = 2'b10,
        S3 = 2'b11
    } state;

    state current_state, next_state;*/

    //Defining States
    parameter S0 = 2'b00,
    parameter S1 = 2'b01,
    parameter S2 = 2'b10,
    parameter S3 = 2'b11;

    // State registers
    reg [1:0] current_state;
    reg [1:0]  next_state;

  
  // State transition logic (clocked)
   always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end
  
  
  // Combinational logic for next state
  always @(*) begin
    case (current_state)
        S0: 
            if (x == 3'b011)
                next_state = S1;
            else
                next_state = S0;

        S1: 
            if (x == 3'b111)
                next_state = S2;
            else
                next_state = S0;

       
        S2: 
            if (x == 3'b101)
                next_state = S3;
            else
                next_state = S0;

        S3: 
            next_state = S0; 

        default: 
            next_state = S0;
    endcase
end
  
  
  //Output logic 
   always @(posedge clk or posedge reset) begin
        if (reset)
            y <= 1'b0;  //if reset goes high, y is 0
        else
          y <= (current_state == S3) ? 1'b1 : 1'b0; //If current_state is S3 y goes high, else 0
    end
endmodule
