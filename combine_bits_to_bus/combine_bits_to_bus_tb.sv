module combine_bits_to_bus_tb();
	logic [1:0] a;
	logic [3:0] b;
	logic [7:0] y;
	
	combine_bits_to_bus dut(a, b, y);
	
	// b2b1-a1a1a1a1-11
	initial begin
		a = 2'b01;
		b = 4'b1010; #10;
		assert (y === 8'b01000011) else $error("test failed");
	end
	
endmodule