module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
wire [4:0]c;

    always@(*) c[0] = cin;
    genvar i;
    generate
        for (i =0; i<4;i++)
            begin:
                gen bcd_fadd ins1(a[4*i+:4],b[4*i+:4],c[i],c[i+1],sum[4*i+:4]);
            end
    endgenerate
    assign cout = c[4];
endmodule
