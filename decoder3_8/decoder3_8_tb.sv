module decoder3_8_tb();
	logic [2:0] a;
	logic [7:0] y;
	
	decoder3_8 dut(a, y);
	
	initial begin
		a = 3'b000; #10;
		assert (y === 8'b00000001) else $error("000 failed");
		
		a = 3'b001; #10;
		assert (y === 8'b00000010) else $error("001 failed");
		
		a = 3'b010; #10;
		assert (y === 8'b00000100) else $error("010 failed");

		a = 3'b011; #10;
		assert (y === 8'b00001000) else $error("011 failed");
		
		a = 3'b100; #10;
		assert (y === 8'b00010000) else $error("100 failed");

		a = 3'b101; #10;
		assert (y === 8'b00100000) else $error("101 failed");

		a = 3'b110; #10;
		assert (y === 8'b01000000) else $error("110 failed");
		
		a = 3'b111; #10;
		assert (y === 8'b10000000) else $error("111 failed");
	end
	
endmodule