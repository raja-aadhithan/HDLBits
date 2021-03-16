module top_module ( input [1:0] A, input [1:0] B, output z ); 
    wire [1:0]y;
	assign y = A^B;
    assign z =~(|y);
endmodule
