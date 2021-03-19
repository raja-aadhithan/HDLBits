module top_module (input clk,reset,data,ack,output counting,done,output [3:0] count);
parameter s=0,s1=1,s11=2,s110=3,b0=4,b1=5,b2=6,b3=7,counts=8,waits=9;
    reg [3:0] state, next,delay;
    reg [9:0] count_1000;
    always@(*)begin
        case(state)
        	s   : next = data ? s1 : s;
       	 	s1  : next = data ? s11 : s;
        	s11 : next = data ? s11 : s110;
        	s110: next = data ? b0 : s;
        	b0  : next = b1;
        	b1  : next = b2;
        	b2  : next = b3;
            b3  : next = counts;
            counts: next = (count==0 & count_1000==999) ? waits : counts ;
            waits: next = ack ? s : waits;
        endcase end
    always@(posedge clk)begin
        if(reset) state<=s;
        else state<=next;end
  always @(posedge clk) begin
		case (state) 
			b0 : count[3] <= data;
			b1 : count[2] <= data;
			b2 : count[1] <= data;
			b3 : count[0] <= data;
			counts : begin
				if (count >= 0) begin
					if (count_1000 < 999) count_1000 <= count_1000 + 1;
					else begin
						count <= count - 1;
						count_1000 <= 0;end
				end end default : count_1000 <= 0;
		endcase end
	assign counting = (state==counts);
    assign done = (state==waits);	
endmodule
