module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 

    wire x,y,z,w;
    always@(posedge clk)
        if(reset)
            q <= 32'h1;
    	else  begin
            x = q[0];
            y = q[22]^q[0];
            z = q[2]^q[0];
            w = q[1]^q[0];
            q <= {x,q[31:23],y,q[21:3],z,w};
        end 


endmodule
