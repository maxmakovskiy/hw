module combine_bits_to_bus(input logic [1:0] a,
									input logic [3:0] b,
									output logic [7:0] y);

	// b2b1-a1a1a1a1-11
	assign y = {b[2:1], {4{a[1]}}, 2'b11};								
endmodule