module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    reg [1:0] state;
    reg [1:0] next_state;
    parameter A=0, B=1, C=2, D=3;
    // State transition logic
    always@(*) begin   // State transition logic: next_state = f(state, in)
       
    case(state)
        A:next_state = in ? B : A;
        B:next_state = in ? B : C;
        C:next_state = in ? D : A;
        D:next_state = in ? B : C;
    endcase
  
    end
  always @(posedge clk or posedge areset) begin
        if(areset) state <= A;
        else state <= next_state;
    end
       assign out = (state == D);
            
    // State flip-flops with asynchronous reset

    // Output logic

endmodule
