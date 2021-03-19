module top_module (input sel,input [7:0] a,b,output [7:0] out  );
assign out = sel ? a : b;
endmodule
