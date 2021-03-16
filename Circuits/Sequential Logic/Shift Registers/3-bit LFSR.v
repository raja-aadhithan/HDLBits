module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    wire [2:0] d;
    wire x;
    always@(posedge KEY[0]) begin
        x = LEDR[1] ^ LEDR[2];
        d[0] = KEY[1] ? SW[0] : LEDR[2] ;  
        d[1] = KEY[1] ? SW[1] : LEDR[0] ; 
        d[2] = KEY[1] ? SW[2] : x ;
        LEDR[1] <= d[1];
        LEDR[0] <= d[0];
        LEDR[2] <= d[2];
    end
endmodule
