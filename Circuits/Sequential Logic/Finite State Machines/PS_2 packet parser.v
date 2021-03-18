module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    // State transition logic (combinational)
  
    parameter[1:0] byte1 = 2'd0,
    		byte2 = 2'd1,
    		byte3 = 2'd2,
    		don = 2'd3;
    
    reg[1:0] state, next;
    
    always@(*) begin
        case(state)
            byte1 : next = in[3] ? byte2 : byte1 ;
            byte2 : next = byte3;
            byte3 : next = don;
            don : next = in[3] ? byte2 : byte1; 
        endcase
    end
    // State flip-flops (sequential)
    always@(posedge clk) begin
        if (reset) state<=byte1;
        else state<=next;
    end
    // Output logic
    assign done = (state == don );
endmodule
