module top_module (input a,b,c,output out);
reg x;
    andgate inst1 (x, a, b, c, 1'b1, 1'b1 );
    assign out = !x;
endmodule
