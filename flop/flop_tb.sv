module flop_tb();
	logic clk;
	logic d, q;

	flop dut(clk, d, q);
	
	always
		begin
			clk = 1; #5;
			clk = 0; #5;
		end
	
	initial begin
		d <= 0; #10;
		d <= 1; #2;
		d <= 1; #5;
		d <= 0; #2;
		d <= 1; #8;
		d <= 0; #5;
		$finish; // stop simulation
	end

endmodule