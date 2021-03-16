module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [3:0] p;
    assign sum[0] = x[0]^y[0];
    assign p[0] = x[0]&y[0];
    always@(*)begin
        for (int i=1;i<4;i++)
            begin
                sum[i] = x[i] ^ y[i] ^ p[i-1];
                p[i] = x[i]&y[i] | x[i]&p[i-1] |p[i-1]&y[i] ; 
   			 end
    end
    assign sum[4] = p[3];
endmodule
