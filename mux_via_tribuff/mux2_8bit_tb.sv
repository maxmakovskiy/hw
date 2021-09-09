module mux2_8bit_tb();
	
	logic [7:0] d0, d1, y;
	logic s;
	
	mux2_8bit dut(d0, d1, s, y);
	
	initial begin
		d0 = 8'b00000000; d1 = 8'b11111111;
		
		s = 0; #10;
		assert (y === 8'b00000000) else $error("0 failed");
		
		s = 1; #10;
		assert (y === 8'b11111111) else $error("1 failed");
	end

endmodule