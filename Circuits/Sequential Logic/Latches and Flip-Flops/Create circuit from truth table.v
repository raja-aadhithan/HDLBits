module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    wire [1:0] s;
    assign s = {j,k};
    always@(posedge clk)
        case(s)
            2'b00 : Q <= Q;
            2'b01 : Q <= j;
            2'b10 : Q <= j;
            2'b11 : Q <= ~Q;
        endcase
endmodule
