module fsm32_tb();
	logic clk, a, b, reset, q;
	logic [31:0] vectornum;
	logic [1:0] testvectors[10000:0];
	
	fsm32 dut(
		.clk(clk),
		.reset(reset),
		.a(a),
		.b(b),
		.q(q)
	);
	
	always
	begin
		clk = 1; #5;
		clk = 0; #5;
	end
	
	initial
	begin
		$readmemb("F:/digital_electronics/fsm_32/testvectors.tv", testvectors);
		vectornum = 0;
		reset = 1; #27; reset = 0;
	end

	always @(posedge clk)
	begin
		#1; {a, b} = testvectors[vectornum];
	end

	always @(negedge clk)
	begin
		if (~reset)
		begin
			vectornum = vectornum + 1;
			if (testvectors[vectornum] === 2'bx)
			begin
				$stop;
			end
		end
	end

endmodule