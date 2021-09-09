module divider3(input logic clk,
					 input logic reset,
					 output logic y);
					 
	typedef enum logic [1:0] { S0 = 2'b00, S1 = 2'b01, S2 = 2'b11 } statetype;
	statetype state, nextstate;
	
	always_ff @(posedge clk, posedge reset)
	begin
		if (reset) state <= S0;
		else state <= nextstate;
	end
	
	always_comb
	begin
		case (state)
			S0: nextstate = S1;
			S1: nextstate = S2;
			S2: nextstate = S0;
			default: nextstate = S0;
		endcase
	end
	
	assign y = (state == S0);

endmodule