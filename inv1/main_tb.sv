module main_tb();
	logic a, y;
	inv dut(a, y);
	initial begin
		a = 1; #10;
		assert (y === 0) else $error("1 failed");
		a = 0; #10;
		assert (y === 1) else $error("0 failed");
		end
endmodule