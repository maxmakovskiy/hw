module sevenseg_tb();
	logic [3:0] data;
	logic [6:0] segments;
	
	sevenseg dut(data, segments);
	
	initial begin
		data = 4'b0000; #10;
		assert (segments === 7'b111_1110) else $error("0 failed");
		
		data = 4'b0001; #10;
		assert (segments === 7'b011_0000) else $error("1 failed");
		
		data = 4'b0010; #10;
		assert (segments === 7'b110_1101) else $error("2 failed");
		
		data = 4'b0011; #10;
		assert (segments === 7'b111_1001) else $error("3 failed");
		
		data = 4'b0100; #10;
		assert (segments === 7'b011_0011) else $error("4 failed");
		
		data = 4'b0101; #10;
		assert (segments === 7'b101_1011) else $error("5 failed");
	
		data = 4'b0110; #10;
		assert (segments === 7'b101_1111) else $error("6 failed");
		
		data = 4'b0111; #10;
		assert (segments === 7'b111_0000) else $error("7 failed");

		data = 4'b1000; #10;
		assert (segments === 7'b111_1111) else $error("8 failed");
		
		data = 4'b1001; #10;
		assert (segments === 7'b111_0011) else $error("9 failed");
	end

endmodule