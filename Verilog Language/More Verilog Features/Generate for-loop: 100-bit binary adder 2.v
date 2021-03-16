module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    always @(a,b,cin)
        begin
            sum[0] = a[0]^b[0]^cin;
            cout[0] =(a[0]&b[0])|(cin&b[0])|(a[0]&cin);
            for (int i=1;i<100;i++)
                begin
                sum[i] = a[i]^b[i]^cout[i-1];
           	    cout[i] =(a[i]&b[i])|(cout[i-1]&b[i])|(a[i]&cout[i-1]);
                end
                end    
endmodule
