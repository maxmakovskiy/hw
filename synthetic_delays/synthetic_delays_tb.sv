`timescale 1ns/1ps

module synthetic_delays_tb();
	logic a, b, c, y;
	
	synthetic_delays dut(a, b, c, y);
	
	initial begin
		a = 1; b = 1; c = 1; #10;
		assert (y === 0) else $error("111 failed");
		
		a = 0; b = 0; c = 0; #10;
		assert (y === 1) else $error("000 failed");
		
		a = 1; b = 0; c = 1; #10;
		assert (y === 1) else $error("101 failed");
		
		a = 0; b = 1; c = 0; #10;
		assert (y === 0) else $error("010 failed");
	end

endmodule