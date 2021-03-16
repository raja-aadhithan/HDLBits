module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    always @ (posedge clk)
        if (load) begin
            q <= data;end
            else begin
                for (int i = 1 ;i < 511 ; i++)
                    q[i] <= q[i-1]^q[i+1];
                q[0] <= q[1];
                q[511] <= q[510]; 
            end
endmodule
