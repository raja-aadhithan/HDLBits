module top_module ();
reg clk,reset,t;
    wire q;
    initial begin
        clk = 0;
        t=0;
        reset = 1;
        #10
        reset = 0;
        #10
        t = 1;
    end
    always begin
        #5 clk = !clk;
    end
    tff ins(clk, reset, t,q);
endmodule
