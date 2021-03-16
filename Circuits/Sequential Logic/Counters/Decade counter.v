module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always @ (posedge clk)
        if (reset)begin
            q<=0;end
    else if(q[3]&~q[1]&~q[2]&q[0])begin
                q<=0;end
            else begin q<=q+1;end
endmodule
