module top_module(input d,done_counting,ack,input[9:0]state,output B3_next,S_next,S1_next,Count_next,Wait_next,done,
                  counting,shift_ena); 
parameter S=0, S1=1, S11=2, S110=3, B0=4, B1=5, B2=6, B3=7, Count=8, Wait=9;
    assign B3_next = state[6];
    assign S_next = (state[1]|state[3]|state[0])&(~d) | state[9]&ack;
    assign S1_next = state[0]&d;
    assign Count_next = state[7] | (state[8]&!done_counting);
    assign Wait_next = (state[8]&done_counting) | (state[9]&!ack);
    assign done = state[9];
    assign counting = state[8];
    assign shift_ena = |state[7:4];
endmodule
