module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    reg ci,co;
    reg [100:0] cin_mid;
    always@(*) cin_mid[0]=cin;
    genvar i;
    generate 
        for(i=1;i<=100;i=i+1)
            begin : gen
                bcd_fadd qq (
                    .a(a[(i*4-1)-:4]),
                    .b(b[(i*4-1)-:4]),
                    .cin(cin_mid[i-1]),
                    .cout(cin_mid[i]),
                    .sum(sum[(i*4-1)-:4]) ); 
               end 
     endgenerate
      assign cout=cin_mid[100];
endmodule
