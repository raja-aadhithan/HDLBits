module top_module( 
    input [99:0] in,
    output [99:0] out
);
   
    always @(*) 
        
    begin

        for (int x = 0; x<100; x = x+1)
            out[x] = in[99-x];    
    end 
endmodule
