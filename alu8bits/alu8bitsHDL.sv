module alu8bitsHDL(
	input logic [7:0] a, b,
	input logic [2:0] f,
	output logic [7:0] y
);
	
	logic [7:0] bMux, s;
	
	assign bMux = f[2] ? ~b : b;
	assign s = a + bMux + f[2];
	
	always_comb
		case(f[1:0])
			2'b00: y <= a & bMux;
			2'b01: y <= a | bMux;
			2'b10: y <= s;
			2'b11: y <= s[3];
		endcase
			
endmodule