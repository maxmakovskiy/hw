module testbench();
  logic a, y;
  inv dut(a, y);

  initial begin
    a = 0; #10;
    a = 1; #10;
  end
endmodule
