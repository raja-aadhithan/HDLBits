module btop ( input x, input y, output z );
    assign z = ~( x^y);
endmodule
module atop (input x, input y, output z);
    assign z = x & (~y);
endmodule


module top_module (input x, input y, output z);
wire a,b,c,d,e,f;
    atop ins1(x,y,a);
    btop ins2(x,y,b);
    atop ins3(x,y,c);
    btop ins4(x,y,d);
    assign e = a|b;
    assign f = a&b;
    assign z = e^f;
endmodule
