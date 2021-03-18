module top_module (input clk,resetn,input [3:1] r,output [3:1]g); 
    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, next;
    always@(*)  begin
        case(state)
            A : next = r[1] ? B : ( r[2] ? C : ( r[3] ? D : A) );
            B : next = r[1] ? B : A;
            C : next = r[2] ? C : A;
            D : next = r[3] ? D : A;
        endcase end
    always@(posedge clk) begin
        if(!resetn) state<=A;
        else state<=next;
    end
    assign g={(state==D),(state==C),(state==B)};
endmodule
