module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
 
    parameter   a=0, //walk left
    			b=1, //walk right
    			c=2, //walk left fall	
    			d=3, //walk right fall
    			e=4, //dig left
    			f=5; //dig right
    			
    reg [2:0] state, next_state;
    always@(*)begin
        case(state)
            a : next_state = ~ground ? c :( dig ? e :( bump_left ? b : a )) ;
            b : next_state = ~ground ? d :( dig ? f :( bump_right ? a : b )) ;
            c : next_state = ground ?  a : c ;
            d : next_state = ground ?  b : d ;
            e : next_state = ground ? e : c ;
            f : next_state = ground ? f : d ;
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
    assign digging = (state==e)|(state==f);
    
        


endmodule
