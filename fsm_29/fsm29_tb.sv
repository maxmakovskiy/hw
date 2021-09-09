module fsm29_tb();
	logic clk, reset, a, b, y;
	logic [31:0] vectornum;
	logic [1:0] testvectors[10000:0];
	
	fsm29 dut(
		.clk(clk),
		.reset(reset),
		.a(a),
		.b(b),
		.y(y)
	);

	always
	begin
		clk = 1; #5;
		clk = 0; #5;
	end
	
	initial
	begin
		vectornum = 32'b0;
		$readmemb("F:/digital_electronics/fsm_29/testvectors.tv", testvectors);
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
				$display("Tests completed");
				$stop;
			end
		end
	end
	
endmodule