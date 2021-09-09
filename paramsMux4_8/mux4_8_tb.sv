module mux4_8_tb();
	logic [7:0] d0, d1, d2, d3, y;
	logic [1:0] s;
	
	mux4_8 dut(d0, d1, d2, d3, s, y);
	
	initial
	begin
		d0 = 8'b0000_0000; d1 = 8'b0101_0101;
		d2 = 8'b1010_1010; d3 = 8'b1111_1111;
		
		s = 2'b00; #10;
		assert (y === 8'b0000_0000) else $error("Error: s = 00");
		
		s = 2'b01; #10;
		assert (y === 8'b0101_0101) else $error("Error: s = 01");
	
		s = 2'b10; #10;
		assert (y === 8'b1010_1010) else $error("Error: s = 10");
	
		s = 2'b11; #10;
		assert (y === 8'b1111_1111) else $error("Error: s = 11");
	end

endmodule