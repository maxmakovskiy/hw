module controllerFSM(input logic clk, reset,
							input logic p, r, ta, tb,
							output logic [1:0] la, lb);
							
	logic m;

	modeFSM mode(
		.clk(clk),
		.reset(reset), 
		.p(p),
		.r(r),
		.m(m)
	);
	
	lightsFSM lights(
		.clk(clk),
		.reset(reset),
		.ta(ta),
		.tb(tb),
		.m(m),
		.la(la),
		.lb(lb)
	);
							
endmodule

module lightsFSM(input logic clk, reset,
					  input logic ta, tb, m,
					  output logic [1:0] la, lb);
	
	typedef enum logic [1:0] {S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11} statetype;
	statetype state, nextstate;
	
	// state register
	always_ff @(posedge clk, posedge reset)
	begin
		if (reset) state <= S0;
		else state <= nextstate;
	end
	
	// next state logic
	always_comb
	begin
		case(state)
			S0: if (ta) nextstate <= S0;
				 else nextstate <= S1;
			S1: nextstate <= S2;
			S2: if (m | tb) nextstate <= S2;
				 else nextstate <= S3;
			S3: nextstate <= S0;
		endcase
	end
	
	// output logic
	always_comb
	begin
		case(state)
			S0: {la, lb} = 4'b0010;
			S1: {la, lb} = 4'b0110;
			S2: {la, lb} = 4'b1000;
			S3: {la, lb} = 4'b1001;
		endcase
	end
					  
endmodule

module modeFSM(input logic clk, reset,
					input logic p, r,
					output logic m);
	
	typedef enum logic {S0, S1} statetype;
	statetype state, nextstate;
	
	// state register
	always_ff @(posedge clk, posedge reset)
	begin
		if (reset) state <= S0;
		else state <= nextstate;
	end

	// next state logic
	always_comb 
	begin
		case(state)
			S0: if (p) nextstate <= S1;
				 else nextstate <= S0;
			S1: if (r) nextstate <= S0;
				 else nextstate <= S1;
		endcase
	end
	
	// output logic
	assign m = (state == S1);
					
endmodule					