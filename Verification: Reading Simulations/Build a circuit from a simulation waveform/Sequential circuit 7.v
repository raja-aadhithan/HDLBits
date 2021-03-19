module top_module (input clk,a, output q);
always@(posedge clk) q<= !a;
endmodule
