module top_module();
    reg [1:0]a;
    wire c;
    initial begin
  			a = 2'b00;
        #10 a = 2'b01;
        #10 a = 2'b10;
        #10 a = 2'b11;
    end
 andgate ins(a,c);
endmodule
