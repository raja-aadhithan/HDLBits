module top_module (input clk,a,b,output q,state);
    always@(posedge clk) if(a==b) state <= a;
    always@(*)begin
        if (state) q<= !(a^b);
        else q<= a^b;end
endmodule
