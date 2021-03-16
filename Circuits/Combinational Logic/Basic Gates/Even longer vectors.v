module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
always@(in) begin
    for (int i = 0;i<99;i++)
        out_both[i] = in[i+1]&in[i];
    for (int i = 1;i<100;i++)
        out_any[i] = in[i-1] | in[i];
    for (int i = 0;i<99;i++)
        out_different[i] = in[i+1]^in[i];
    out_different[99] = in[99]^in[0];
    end
endmodule
