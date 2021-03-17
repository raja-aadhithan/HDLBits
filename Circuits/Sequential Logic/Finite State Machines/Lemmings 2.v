module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    parameter   a=0, //walk left
    			b=1, //walk right
    			c=2, //walk left fall	
    			d=3; //walk right fall
    reg [1:0] state, next_state;
    always@(*)begin
        case(state)
            a : next_state = ~ground ? c : ( bump_left ? b : a ) ;
            b : next_state = ~ground ? d : ( bump_right ? a : b ) ;
            c : next_state = ground ?  a : c ;
            d : next_state = ground ?  b : d ;
        endcase
    end
    always @ (posedge clk , posedge areset)
        begin
            if(areset)
                begin
                    state <= a;
                end
            else
                begin
                    state <= next_state;
                    aaah <= !ground;
                end
        end
    assign walk_left = (state==a);
    assign walk_right = (state==b);
    
        
endmodule
