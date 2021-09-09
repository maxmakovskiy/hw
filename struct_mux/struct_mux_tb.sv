module struct_mux_tb();

	logic [3:0] d0, d1, d2, d3, y;
	logic [1:0] s;
	
	mux4 dut(d0, d1, d2, d3, s, y);
	
	initial begin
		d0 = 4'b0000; d1 = 4'b0101; d2 = 4'b1010; d3 = 4'b1111;
		
		s = 2'b00; #10;
		assert (y === 4'b0000) else $error("00 failed");
		
		s = 2'b01; #10;
		assert (y === 4'b0101) else $error("01 failed");
		
		s = 2'b10; #10;
		assert (y === 4'b1010) else $error("10 failed");
		
		s = 2'b11; #10;
		assert (y === 4'b1111) else $error("11 failed");
	end

endmodule