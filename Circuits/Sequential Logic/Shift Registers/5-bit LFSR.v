module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    wire x;
    always@(posedge clk)
        if(reset)
            q <= 5'h1;
    	else  begin
            q[4] <= q[0];
            q[3] <= q[4];
            x = q[3]^q[0];
            q[2] <= x;
            q[1] <= q[2];
            q[0] <= q[1];
        end 
endmodule
