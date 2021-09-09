module patternMoore(input logic clk,
						  input logic reset,
						  input logic a,
						  output logic y);
	// define new type	
	typedef enum logic [1:0] { S0 = 2'b00, S1 = 2'b01, S2 = 2'b10 } statetype;
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
			S0: if (a) nextstate = S0;
				 else nextstate = S1;
			S1: if (a) nextstate = S2;
				 else nextstate = S1;
			S2: if (a) nextstate = S0;
				 else nextstate = S1;
			default: nextstate = S0;
		endcase
	end

	// output logic
	assign y = (state == S2);
	
endmodule