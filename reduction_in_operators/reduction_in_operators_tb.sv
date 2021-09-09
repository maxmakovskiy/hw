module reduction_in_operators_tb();
	logic [7:0] a;
	logic y;
	
	reduction_in_operators dut(a, y);
	
	initial begin
		a = 8'b11111111; #10;
		assert (y === 1) else $error("11111111 failed");
		a = 8'b00000000; #10;
		assert (y === 0) else $error("00000000 failed");	
	end
	
endmodule