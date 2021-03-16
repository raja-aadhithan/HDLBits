module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	wire x,y,z;
    wire [15:0] s;
    wire [15:0] p;
    add16 ins1(a[15:0] , b[15:0], 0 , sum[15:0],x);
    add16 ins2(a[31:16] , b[31:16], 0 , s[15:0],y);
    add16 ins3(a[31:16] , b[31:16], 1 , p[15:0],z);
    always @(8)
        case(x)
            1'b1 : sum[31:16] = p;
            1'b0 : sum[31:16] = s;
        endcase    
endmodule
