module reduction_in_operators(input logic [3:0] a,
				output logic y);
	// and4
	assign y = &a;
	// same
	/* assign y = a[3] & a[2] &
				     a[1] & a[0]; */
endmodule