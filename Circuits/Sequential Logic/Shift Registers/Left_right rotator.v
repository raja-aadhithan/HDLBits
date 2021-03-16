module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    always @(posedge clk) begin
        if (load) begin q<=data; end
        else begin   
        case(ena)
                2'b00: q<=q;
                2'b01: begin
                    q[98:0] <=q[99:1];
                    q[99] <= q[0];
                end
                2'b10: begin
                    q[99:1] <=q[98:0];
                    q[0] <= q[99];
                end
                2'b11: q<=q;
            
        endcase
        end
    end
endmodule
