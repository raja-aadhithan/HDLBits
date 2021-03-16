module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] x;
    wire [7:0] y;
    wire [7:0] z;
    my_dff8 (clk,d,x);
    my_dff8 (clk,x,y);
    my_dff8 (clk,y,z);
    always @(clk,z,y,x,d)
        begin
            case(sel)
                2'b00 : q = d;
                2'b01 : q = x;
                2'b10 : q = y;
                2'b11 : q = z;
                    endcase
    	
        end
endmodule
