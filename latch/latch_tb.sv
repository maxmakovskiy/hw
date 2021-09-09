module latch_tb();
	logic clk, d, q;
	
	latch_element dut(clk, d, q);
	
	always begin
		clk = 1; #5;
		clk = 0; #5;
	end
	
	initial begin
		d <= 0; #3;
		d <= ~d; #2;
		d <= ~d; #3;
		d <= ~d; #1;
		d <= ~d; #1;
		d <= ~d; #1;
		d <= ~d; #2;
		d <= ~d; #2;
		d <= ~d; #3;
		d <= ~d; #1;
		d <= ~d; #1;
		d <= ~d; #3;

		$finish;
	end
	
endmodule