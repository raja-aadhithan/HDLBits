module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter s000 = 0, s001 = 1, s010 = 2, s011 = 3, s100 = 4 ; 
    reg [2:0] state , next ;
    always@(*) begin
        case(state)
            s000 : next = x ? s001 : s000 ;
            s001 : next = x ? s100 : s001 ;
            s010 : next = x ? s001 : s010 ;
            s011 : next = x ? s010 : s001 ;
            s100 : next = x ? s100 : s011 ;
        endcase
    end
    always@(posedge clk) begin
        if(reset)
            state <= s000;
        else
            state <= next;
    end
    assign z = (state==s011)|(state==s100);
endmodule
