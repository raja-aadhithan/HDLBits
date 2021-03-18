module top_module (input clk,reset,output [9:0] q);
    wire [9:0]state;
    always@(posedge clk)begin
        if(reset)state<=10'd0;
        else if(state==10'd999) state<=10'd0;
        else state<=state+1;
    end
assign q = state;
endmodule
