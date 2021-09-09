module mux2_tb();
	logic [3:0] d0, d1;
	logic s;
	logic [3:0] y;
	
	mux2 dut(d0, d1, s, y);
	
	initial begin
		d0 = 4'b0000; d1 = 4'b1111;
		
		s = 0; #10;
		assert (y === 4'b0000) else $error("s = 0 failed");
		
		s = 1; #10;
		assert (y === 4'b1111) else $error("s = 1 failed");
		
	end
	
endmodule