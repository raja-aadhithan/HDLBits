module top_module (input clk,shift_ena,count_ena,data,output [3:0] q);
always@(posedge clk)begin
        if(shift_ena) q[3:0] <= {q[2:0],data};
        else if(count_ena) q <= q - 1;end
endmodule
