module controllerFSM(input logic clk, reset,
							input logic a, b,
							output logic [1:0] la, lb);
							
	typedef enum logic [2:0] {
		S0 = 3'b000, S1 = 3'b001, S2 = 3'b010,
		S3 = 3'b011, S4 = 3'b100, S5 = 3'b101
	} statetype;
	
	statetype state, nextstate;
	
	parameter green = 2'b00;
	parameter yellow = 2'b01;
	parameter red = 2'b10;
	
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
			S0: if (a) nextstate <= S0;
				 else nextstate <= S1;
			S1: nextstate <= S2;
			S2: nextstate <= S3;
			S3: if (b) nextstate <= S3;
				 else nextstate <= S4;
			S4: nextstate <= S5;
			S5: nextstate <= S0;
		endcase
	end
	
	// output logic
	always_comb
	begin
		case(state)
			S0: {la, lb} = {green, red};
			S1: {la, lb} = {yellow, red};
			S2: {la, lb} = {red, red};
			S3: {la, lb} = {red, green};
			S4: {la, lb} = {red, yellow};
			S5: {la, lb} = {red, red};
		endcase
	end
							
endmodule