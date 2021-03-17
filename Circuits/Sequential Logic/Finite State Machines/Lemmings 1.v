module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

     parameter left=0, right=1;
    reg state, next_state;
	
    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) begin
            state <= left ;
        end
        else begin
        state<=next_state;
        end
    end
    
    always @(*) begin
        case(state)
            left : next_state = bump_left ? right : left ;
           walk_right : next_state = bump_right ? left : right ; 
        endcase
    end

    

    // Output logic
     assign walk_left = (state == left);
     assign walk_right = (state == right);

endmodule
