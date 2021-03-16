module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    wire [2:0] d;
    always@(posedge clk)
        if(!resetn) begin 
            d <= 3'd0;
    		out <= 0;
        end
        else
        {out,d[2:0]} <= {d[2:0],in};
endmodule
