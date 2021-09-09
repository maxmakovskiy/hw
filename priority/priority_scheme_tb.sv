module priority_scheme_tb();
	logic [3:0] a, y;
	
	priority_scheme dut(a, y);
	
	initial begin
		a = 4'b1111; #10;
		assert (y === 4'b1000) else $error("1111 failed");
		
		a = 4'b0111; #10;
		assert (y === 4'b0100) else $error("0111 failed");
		
		a = 4'b0011; #10;
		assert (y === 4'b0010) else $error("0011 failed");
		
		a = 4'b0001; #10;
		assert (y === 4'b0001) else $error("0001 failed");
		
		a = 4'b0000; #10;
		assert (y === 4'b0) else $error("0000 failed");
	end
	
endmodule