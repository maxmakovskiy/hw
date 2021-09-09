module greyCodeFSM_tb();
	logic clk, reset;
	logic [2:0] y;
	
	greyCodeFSM dut(
		.clk(clk),
		.reset(reset),
		.y(y)
	);

	always
	begin
		clk = 1; #5;
		clk = 0; #5;
	end
	
	initial 
	begin
		reset = 1; #27; reset = 0;
		
		// skip time
		for(int i = 0; i < 16; i++)
			#30;
		$stop;
	end
	
endmodule