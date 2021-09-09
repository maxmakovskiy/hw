module gates_tb();
	logic a, b, y1, y2, y3, y4, y5;
	
	gates dut(a, b, y1, y2, y3, y4, y5);
	
	initial begin
		a = 0; b = 0;
		assert(y1 === 0) else $error("0and0 failed"); #10;
		assert(y2 === 0) else $error("0or0 failed"); #10;
		assert(y3 === 0) else $error("0xor0 failed"); #10;
		assert(y4 === 1) else $error("0nand0 failed"); #10;
		assert(y5 === 1) else $error("0nor0 failed"); #10;
		a = 0; b = 1;
		assert(y1 === 0) else $error("0and1 failed"); #10;
		assert(y2 === 1) else $error("0or1 failed"); #10;
		assert(y3 === 1) else $error("0xor1 failed"); #10;
		assert(y4 === 1) else $error("0nand1 failed"); #10;
		assert(y5 === 0) else $error("0nor1 failed"); #10;
		a = 1; b = 0;
		assert(y1 === 0) else $error("1and0 failed"); #10;
		assert(y2 === 1) else $error("1or0 failed"); #10;
		assert(y3 === 1) else $error("1xor0 failed"); #10;
		assert(y4 === 1) else $error("1nand0 failed"); #10;
		assert(y5 === 0) else $error("1nor0 failed"); #10;
		a = 1; b = 1;
		assert(y1 === 1) else $error("1and1 failed"); #10;
		assert(y2 === 1) else $error("1or1 failed"); #10;
		assert(y3 === 0) else $error("1xor1 failed"); #10;
		assert(y4 === 0) else $error("1nand1 failed"); #10;
		assert(y5 === 0) else $error("1nor1 failed"); #10;
	end
	
endmodule