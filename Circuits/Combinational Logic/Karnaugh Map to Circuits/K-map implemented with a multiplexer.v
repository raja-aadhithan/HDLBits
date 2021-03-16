module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    wire p,q;
    assign p = d ? 0 : 1 ;
    assign q = c ? 0 : 1 ;
    assign mux_in[0] = c|d;
    assign mux_in[1] = 0;
    assign mux_in[2] = p;
    assign mux_in[3] = c&d;
endmodule
