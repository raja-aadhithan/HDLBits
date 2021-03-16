module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
     integer i;
always @ (posedge clk)
        if (load) begin
            q <= data;end
            else begin
                for(i=1;i<511;i=i+1)begin
                q[i]<=(q[i]||q[i-1])&&(~q[i]||~q[i-1]||~q[i+1]);
            end
            q[0]<=q[0];
            q[511]<=q[510]|q[511];
            end
endmodule
