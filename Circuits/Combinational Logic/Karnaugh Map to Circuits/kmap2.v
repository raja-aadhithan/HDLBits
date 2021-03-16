module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~a&~d)|(~c&~b)|((a|b)&c&d)|(~a&~d&~c);

endmodule
