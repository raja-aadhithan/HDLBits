module top_module ( );
reg clk;
    initial clk = 0;
    always begin
        #5 clk =!clk;
    end
    dut clock(.clk(clk));
endmodule
