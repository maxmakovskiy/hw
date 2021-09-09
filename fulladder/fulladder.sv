module fulladder(input logic a, b, cin,
					  output logic s, cout);
	// internal variables
	logic p, g;
	
	assign p = a ^ b; // xor
	assign g = a & b;
	
	assign s = p ^ cin;
	assign cout = g | (p & cin);
					  
endmodule