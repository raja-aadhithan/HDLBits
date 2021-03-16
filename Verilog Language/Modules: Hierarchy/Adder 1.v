module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire x;
    wire y;
    add16 ins1(a[15:0], b[15:0] , 0 , sum[15:0],x);
    add16 ins2(a[31:16], b[31:16] , x , sum[31:16],y);
endmodule
