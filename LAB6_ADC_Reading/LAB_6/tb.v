module tb;

reg clk = 0;

always #5 clk <= ~clk;

de0_nano_soc_baseline top(clk);

endmodule
