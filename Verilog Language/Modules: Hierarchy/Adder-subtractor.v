module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
wire x,y;
    wire [31:0] s;
    wire [31:0] c;
    assign s  = {32{sub}};
    assign c = b^s;
    add16 ins1(a[15:0] , c[15:0], sub , sum[15:0],x);
    add16 ins2(a[31:16] , c[31:16], x , sum[31:16],y);
     
endmodule
