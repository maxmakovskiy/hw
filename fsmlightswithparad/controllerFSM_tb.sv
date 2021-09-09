module controllerFSM_tb();
	logic clk, reset, p, r, ta, tb;
	logic [1:0] la, lb, laexpected, lbexpected;
	logic [31:0] vectornum;
	logic [3:0] testvectors[10000:0];
	
	controllerFSM dut(
		.clk(clk),
		.reset(reset),
		.p(p),
		.r(r),
		.ta(ta),
		.tb(tb),
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
		$readmemb("F:/digital_electronics/fsmlightswithparad/testvectors.tv", testvectors);
		vectornum = 0;
		reset = 1; #27; reset = 0;
	end

	always @(posedge clk)
	begin
		#1; {p, r, ta, tb} = testvectors[vectornum];
	end
	
	
	always @(negedge clk)
	begin
		if (~reset)
		begin
			vectornum = vectornum + 1;
			
			if (testvectors[vectornum] === 4'bx)
			begin
				$stop;
			end
		
		end
	end
	

endmodule