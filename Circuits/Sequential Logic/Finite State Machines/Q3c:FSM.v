module top_module (input clk,x,input [2:0]y,output Y0,z);
    reg [2:0] state , next ;
    always@(*) begin case(y)
            3'b000 : next = x ? 3'b001 : 3'b000 ;
            3'b001 : next = x ? 3'b100 : 3'b001 ;
            3'b010 : next = x ? 3'b001 : 3'b010 ;
            3'b011 : next = x ? 3'b010 : 3'b001 ;
            3'b100 : next = x ? 3'b100 : 3'b011 ;
            3'b101 : next = x ? 3'b001 : 3'b000 ;
            3'b110 : next = x ? 3'b001 : 3'b000 ;
            3'b111 : next = x ? 3'b001 : 3'b000 ;
        endcase end
    assign z = (y==3'b011)|(y==3'b100);
    assign Y0 = next[0];
endmodule
