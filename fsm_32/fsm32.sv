module fsm32(input logic clk, reset,
				 input logic a, b,
				 output logic q);
				 
	typedef enum logic [1:0] {S0 = 2'b00, S1 = 2'b01, S2 = 2'b10} statetype;
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
			S0: if (a) nextstate = S1;
				 else nextstate = S0;
			S1: if (b) nextstate = S2;
				 else nextstate = S0;
			S2: nextstate = S0;
			default: nextstate = S0;
		endcase
	end
	
	// output logic
	assign q = (state == S2);
		 
endmodule