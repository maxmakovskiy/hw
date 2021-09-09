module divider3_tb();
	logic clk, reset, y;
	
	divider3 dut(clk, reset, y);
	
	always
	begin
		clk = 1; #5;
		clk = 0; #5;
	end

	initial
	begin
		// reset = 1; #20;
		// reset = 0;
		for (int i = 0; i < 12; i++)
			#30;
		
		$finish;
	end

endmodule