module fsm29(input logic clk, reset,
				 input logic a, b,
				 output logic y);
				 
	typedef enum logic [1:0] {
		S0 = 2'b00, S1=2'b01,
		S2 = 2'b10, S3=2'b11
	} statetype;			 
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
			S0: begin
					if (b & a) nextstate = S1;
					else if (a) nextstate = S3;
					else nextstate = S0;
				 end
			S1: begin
					if (b & a) nextstate = S1;
					else if (b) nextstate = S2;
					else if (a) nextstate = S3;
					else nextstate = S0;
				 end
			S2: begin
					if (b & a) nextstate = S1;
					else if (b) nextstate = S2;
					else if (a) nextstate = S3;
					else nextstate = S0;
				 end
			S3: begin
					if (b & a) nextstate = S1;
					else if (b) nextstate = S2;
					else if (a) nextstate = S3;
					else nextstate = S0;
				 end	
		endcase
	end
	
	// output logic
	always_comb
	begin
		case(state)
			S0: begin
					if (b & a) y = 1;
					else y = 0;
				 end
			S1: begin
					if (b | a) y = 1;
					else y = 0;
				 end
			S2: begin
					if (b & a) y = 1;
					else y = 0;
				 end
			S3: begin
					if (b | a) y = 1;
					else y = 0;
				 end	
		endcase
	end
				 
endmodule