module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
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
        else begin state<=next;
            out_bytes[23:16] <= out_bytes[15:8];
        out_bytes[15:8] <= out_bytes[7:0];
        out_bytes[7:0] <= in[7:0];
        end
    end
    // Output logic
    assign done = (state == don );

    // New: Datapath to store incoming bytes.

endmodule
