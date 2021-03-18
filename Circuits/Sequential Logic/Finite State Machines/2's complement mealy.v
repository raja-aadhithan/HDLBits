module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter A=0, B=1;
    reg  state, state_next;
    
    always @(posedge clk or posedge areset)
        begin
            if (areset)
            state <= A;
    		else
            state <= state_next;
    	end
    
    always @(*)
        begin
            case (state)
                A: state_next <= x ? B : A ;
                B: state_next <= B ;
            endcase
        end
    
    assign z = (state == B)&(~x) || (state == A)&(x);
        
endmodule
