module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    parameter si=0,s1=1,s10=2;
    reg [1:0] state, next;
    always@(*) begin
        case(state)
            si : next = x ? s1 : si ;
            s1 : next = x ? s1 : s10 ;
            s10: next = x ? s1 : si;
        endcase
    end
    always@(posedge clk , negedge aresetn) begin
        if(~aresetn)
            state<=si;
    else state<= next;
    end
    assign z = (state==s10 && x);
endmodule
