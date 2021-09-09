module flopenr_tb();
	logic clk, r, en, d, y;
	
	flopenr dut(clk, r, en, d, y);
	
	always begin
		clk = 1; #5;
		clk = 0; #5;
	end
	
	initial begin
		r <= 1; #10;
		r <= 0;
		en <= 1;
		d <= 1; #3;
		d <= 0; #5;
		d <= 1; #2;
		d <= 1; #8;
		d <= 0; #1;
		r <= 1; #3;
		r <= 0;
		d <= 1; #15;
		d <= 0; #4;
		d <= 1; #5;
		
		en <= 0;
		d <= 1; #3;
		d <= 0; #5;
		d <= 1; #2;
		d <= 1; #8;
		d <= 0; #1;
		r <= 1; #3;
		r <= 0;
		d <= 1; #15;
		d <= 0; #4;
		d <= 1; #5;
		
		$finish;
	end

endmodule