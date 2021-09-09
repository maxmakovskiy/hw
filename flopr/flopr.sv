module flopr(input logic clk,
				 input logic reset,
				 input logic d,
				 output logic q);
	// async reset		
	always_ff @(posedge clk, posedge reset)
		if (reset) q <= 0;
		else q <= d;
		
	/*	
	// sync reset	
	always_ff @(posedge clk)
		if (reset) q <= 0;
		else q <= d;
	*/	
endmodule