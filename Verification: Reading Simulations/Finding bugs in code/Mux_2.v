module top_module (input [1:0] sel,input [7:0] a,b,c,d,output [7:0] out);
    reg[7:0]  mux0, mux1;
    mux2 mu0 ( sel[0],    a,    b, mux0 );
    mux2 mu1 ( sel[0],    c,    d, mux1 );
    mux2 mu2 ( sel[1], mux0, mux1,  out );
endmodule
