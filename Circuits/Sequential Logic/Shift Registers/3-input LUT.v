module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    wire[0:7] q;
    always@(posedge clk)
        if (enable) begin
            q[0:7] <= {S,q[0:6]};
        end
    assign Z = q[{A,B,C}];
endmodule
