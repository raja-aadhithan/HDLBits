module top_module (input clk,resetn,x,y,output f,g);
    parameter A=4'd0, f1=4'd1, tmp0=4'd2, tmp1=4'd3, tmp2=4'd4, g1=4'd5, g1p=4'd6, tmp3=4'd7, g0p=4'd8;
    reg [3:0] state, next;
    always@(*) begin
        case(state)
            A 	: next = resetn ? f1 : A ; 
            f1	: next = tmp0;
            tmp0: next = x ? tmp1 : tmp0 ;
            tmp1: next = x ? tmp1 : tmp2 ;
            tmp2: next = x ? g1 : tmp0 ;
            g1	: next = y ? g1p : tmp3 ;
            tmp3: next = y ? g1p : g0p ;
            g1p	: next = resetn ? g1p : A ;
            g0p	: next = resetn ? g0p : A ;
        endcase end
    always@(posedge clk) begin
        if(~resetn) state <= A;
        else state <= next;
        case(next)
            f1:     f <= 1'b1;
            g1:		g <= 1'b1;
            tmp3:	g <= 1'b1;
            g1p:    g <= 1'b1;
            g0p:    g <= 1'b0;
            default: begin
                    f <= 1'b0;
                    g <= 1'b0;
            end endcase end
endmodule
