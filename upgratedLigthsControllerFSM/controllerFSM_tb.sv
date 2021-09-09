module controllerFSM_tb();
	logic clk, reset, a, b;
	logic [1:0] la, lb, la_expected, lb_expected;
	logic [31:0] vectornum;
	logic [5:0] testvectors[10000:0];
	
	controllerFSM dut(
		.clk(clk),
		.reset(reset),
		.a(a),
		.b(b),
		.la(la),
		.lb(lb)
	);

	always
	begin
		clk = 1; #5;
		clk = 0; #5;
	end
	
	initial
	begin
		$readmemb("F:/digital_electronics/upgratedLigthsControllerFSM/testvectors.tv", testvectors);
		vectornum = 32'b0;
		reset = 1; #27; reset = 0;
	end
	
	always @(posedge clk)
	begin
		// #1; {a, b, la_expected, lb_expected} = testvectors[vectornum];
		#1; {a, b} = testvectors[vectornum];
	end

	always @(negedge clk)
	begin
		if (~reset)
		begin
		/*
			if ((la !== la_expected) | (lb !== lb_expected))
			begin
				$error("Error: outputs la = %b (%b expected), lb = %b (%b expected)", la, la_expected, lb, lb_expected);
			end
		*/	
			vectornum = vectornum + 1;
			
			if (testvectors[vectornum] === 6'bx)
			begin
				$display("Tests completed");
				$stop;
			end
		end
	end
	

endmodule