module greyCodeFSM(input logic clk, reset,
						 output logic [2:0] y);
						 
	typedef enum logic [2:0] {
		S0=3'b000, S1=3'b001, S2=3'b010,
		S3=3'b011, S4=3'b100, S5=3'b101,
		S6=3'b110, S7=3'b111
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
			S0: nextstate <= S1;
			S1: nextstate <= S2;
			S2: nextstate <= S3;
			S3: nextstate <= S4;
			S4: nextstate <= S5;
			S5: nextstate <= S6;
			S6: nextstate <= S7;
			S7: nextstate <= S0;
		endcase
	end
	
	// output logic
	always_comb
	begin
		case(state)
			S0: y = 3'b000;
			S1: y = 3'b001;
			S2: y = 3'b011;
			S3: y = 3'b010;
			S4: y = 3'b110;
			S5: y = 3'b111;
			S6: y = 3'b101;
			S7: y = 3'b100;
		endcase
	end
						 
endmodule