module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
wire x,y;
    assign x = E ? w : Q;
    assign y = L ? R : x;
    always @ (posedge clk)
        Q<=y;
endmodule
