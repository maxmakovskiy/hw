module sync_tb();
	logic clk, d, q;
	
	sync dut(clk, d, q);
	
	always begin
		clk = 1; #5;
		clk = 0; #5;
	end
	
	initial begin
		d <= 0; #3;
		d <= ~d; #2;
		d <= ~d; #11;
		d <= ~d; #4;
		d <= ~d; #15;
		d <= ~d; #2;
		d <= ~d; #5;
		
		$finish;
	end
	
endmodule