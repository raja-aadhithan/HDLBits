module top_module (
    input clk,
    input x,
    output z
); 
    wire [2:0] q;
    wire a,b,c;
    assign a = x^q[2];
    assign b = x&(~q[1]);
    assign c = x|(~q[0]);
    always @ (posedge clk)
        begin
            q[2]<=a;
            q[1]<=b;
            q[0]<=c;
        end
    assign z = ~(|q);
endmodule
