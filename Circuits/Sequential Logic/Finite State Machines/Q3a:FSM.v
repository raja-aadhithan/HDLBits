module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter [3:0] sa=0, sb=1, s0=2, s1=3, s00=4,
    				s01=5, s11=6, s000=7, s001=8, s011=9, s111=10;
    reg [3:0] state,next;
    always@(*) begin
        case(state)
            sa  : next = s ? sb  : sa  ;
            sb  : next = w ? s1  : s0  ;
            s0  : next = w ? s01 : s00 ; 
            s1  : next = w ? s11 : s01 ;
            s00 : next = w ? s001: s000;
            s01 : next = w ? s011: s001;
            s11 : next = w ? s111: s011;
            s000: next = w ? s1  : s0  ;
            s001: next = w ? s1  : s0  ;
            s011: next = w ? s1  : s0  ;
            s111: next = w ? s1  : s0  ;
        endcase
    end
    always@(posedge clk) begin
        if(reset) state <= sa;
        else state <=  next;
    end
    assign z = (state==s011);
            
endmodule
