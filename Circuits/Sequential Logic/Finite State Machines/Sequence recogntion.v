module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9;
    reg[3:0] state , next;
    always@(*)begin
        case(state)
            s0: next = in ? s1 : s0 ;
            s1: next = in ? s2 : s0 ;
            s2: next = in ? s3 : s0 ;
            s3: next = in ? s4 : s0 ;
            s4: next = in ? s5 : s0 ;
            s5: next = in ? s7 : s6 ;
            s6: next = in ? s1 : s0 ;//disc
            s7: next = in ? s8 : s9 ;
            s9: next = in ? s1 : s0 ;//flag
            s8: next = in? s8 : s0;//err
        endcase
    end
    always@(posedge clk) begin
        if(reset) state <= s0;
    else state<=next;
    end
    assign disc = (state==s6);
    assign flag = (state==s9);
    assign err = (state==s8);
endmodule
