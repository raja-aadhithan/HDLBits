module top_module ( input clk, input d, output q );
wire x,y;
    my_dff ins1(clk,d,x);
    my_dff ins2(clk,x,y);
    my_dff ins3(clk,y,q);
endmodule
