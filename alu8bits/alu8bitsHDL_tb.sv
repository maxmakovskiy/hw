module alu8bitsHDL_tb();
	logic [7:0] a, b, y;
	logic [2:0] f;
	
	alu8bitsHDL dut(
		.a(a), .b(b), .f(f), .y(y)
	);

	initial
	begin
		a = 8'b1010_1010;
		b = 8'b0101_0101;
		
		f = 3'b000; #10;
		assert (y === 8'b0) 
		else $error("Error: inputs a = %b, b = %b, f = %b | ouputs y = %b", a, b, f, y);
		
		f = 3'b001; #10;
		assert (y === 8'b11111111) 
		else $error("Error: inputs a = %b, b = %b, f = %b | ouputs y = %b", a, b, f, y);

		f = 3'b100; #10;
		assert (y === 8'b1010_1010) 
		else $error("Error: inputs a = %b, b = %b, f = %b | ouputs y = %b", a, b, f, y);

		f = 3'b101; #10;
		assert (y === 8'b1010_1010) 
		else $error("Error: inputs a = %b, b = %b, f = %b | ouputs y = %b", a, b, f, y);

		a = 8'b0110_1100;
		b = 8'b0111_1110;
		
		f = 3'b010; #10;
		assert (y === 8'b1110_1010) 
		else $error("Error: inputs a = %b, b = %b, f = %b | ouputs y = %b", a, b, f, y);
		
		f = 3'b110; #10;
		assert (y === 8'b1110_1110) 
		else $error("Error: inputs a = %b, b = %b, f = %b | ouputs y = %b", a, b, f, y);
		
		f = 3'b111; #10;
		assert (y === 8'b0000_0001) 
		else $error("Error: inputs a = %b, b = %b, f = %b | ouputs y = %b", a, b, f, y);		
	end

endmodule