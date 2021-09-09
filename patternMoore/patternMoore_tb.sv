module patternMoore_tb();
	logic clk, r, a, y, yexpected;
	logic [31:0] vectornum;
	logic [1:0] testvectors[10000:0];
	
	patternMoore dut(
		.clk(clk),
		.reset(r),
		.a(a),
		.y(y)
	);
	
	always
	begin
		clk = 1; #5;
		clk = 0; #5;
	end
	
	initial
	begin
		$readmemb("F:/digital_electronics/patternMoore/test_vectors.tv", testvectors);
		vectornum = 0;
		r = 1; #13; r = 0;		
	end
	
	always @(posedge clk)
	begin
		#1; {a, yexpected} = testvectors[vectornum];
	end

	always @(negedge clk)
	begin
		if (~r)
		begin
			if (y !== yexpected)
			begin
				$display("Error: input a = %b", a);
				$display(" output y = %b (%b expected)", y, yexpected);
			end
			
			vectornum = vectornum + 1;
			
			if (testvectors[vectornum] === 2'bx)
			begin
				$display("tests completed");
				$stop;
			end
		end
	end
	
endmodule