module top_module (input clock,a,output p,q );
    always@(*) begin if(clock) p<=a;end
    always@(negedge clock) q<=a;
endmodule
