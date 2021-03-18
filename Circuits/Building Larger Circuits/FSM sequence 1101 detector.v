module top_module (input clk,reset,data,output start_shifting);
parameter a=0,b=1,c=2,d=3,e=4;
    reg[2:0] state, next;
    always@(*)begin
        case(state)
        a : next = data ? b : a;
        b : next = data ? c : a;
        c : next = data ? c : d;
        d : next = data ? e : a;
        e : next = e;
        endcase end
    always@(posedge clk)begin
        if(reset) state<=a;
        else state<=next;
    end
    assign start_shifting = (state==e);
endmodule
