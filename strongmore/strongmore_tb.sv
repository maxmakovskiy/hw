module strongmore_tb();
	logic [3:0] a, b;
	logic y;
	
	strongmore dut(
		.a0(a[0]), .a1(a[1]), .a2(a[2]), .a3(a[3]),
		.b0(b[0]), .b1(b[1]), .b2(b[2]), .b3(b[3]),
		.y(y)
	);

	initial
	begin	
		a = 4'b0000; b = 4'b0111; #10;
		assert (y === 1'b0)
		else $error("Error: a = %b, b = %b, y = %b (%b expected)", a, b, y, 1'b0);
		
		a = 4'b0111; b = 4'b0000; #10;
		assert (y === 1'b1)
		else $error("Error: a = %b, b = %b, y = %b (%b expected)", a, b, y, 1'b0);
		
		a = 4'b0111; b = 4'b1010; #10;
		assert (y === 1'b0)
		else $error("Error: a = %b, b = %b, y = %b (%b expected)", a, b, y, 1'b0);

		a = 4'b1001; b = 4'b0110; #10;
		assert (y === 1'b1)
		else $error("Error: a = %b, b = %b, y = %b (%b expected)", a, b, y, 1'b1);		
	end

endmodule