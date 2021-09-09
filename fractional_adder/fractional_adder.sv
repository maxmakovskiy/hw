module fractional_adder(input logic [31:0] a, b,
								output logic [31:0] y);
	
	logic [7:0] exp_a, exp_b, done_exp, shamt;
	logic [23:0] mantissa_a, mantissa_b, shifted_mantissa, sum_mantissa, done_mantissa;
	logic mantissa_choose;
	
	// step 1, 2
	assign exp_a = a[30:23];
	assign exp_b = b[30:23];
	assign mantissa_a = {1'b1, a[22:0]};
	assign mantissa_b = {1'b1, b[22:0]};
								
	// step 3
	compare_mantisse comp1(
		.exp_a(exp_a), .exp_b(exp_b),
		.mantissa_choose(mantissa_choose),
		.done_exp(done_exp), .shamt(shamt)
	);
								
	// step 4
	shift_mantisse shift1(
		.mantissa_a(mantissa_a), .mantissa_b(mantissa_b),
		.shamt(shamt),
		.mantissa_choose(mantissa_choose),
		.shifted_mantissa(shifted_mantissa)
	);
								
	// step 5
	sum_mantisse sum1(
		.mantissa_a(mantissa_a), .mantissa_b(mantissa_b), .shifted_mantissa(shifted_mantissa),
		.mantissa_choose(mantissa_choose),
		.sum_mantissa(sum_mantissa)
	);
	
	// step 6, 7
	normalise_mantisse norm1(
		.sum_mantissa(sum_mantissa),
		.done_mantissa(done_mantissa)
	);
	
	// step8
	assign y = {1'b0, done_exp, done_mantissa};
									
endmodule

module compare_mantisse(input logic [7:0] exp_a, exp_b,
								output logic mantissa_choose,
								output logic [7:0] done_exp, shamt);
	
	logic [7:0] temp_sum;
	
	assign temp_sum = exp_a - exp_b;
	assign mantissa_choose = temp_sum[7];
	
	always_comb
		if (temp_sum[7])
		begin
			shamt = exp_b - exp_a;
			done_exp = exp_b;
		end
		else
		begin
			shamt = exp_a - exp_b;
			done_exp = exp_a;
		end
	
endmodule

module shift_mantisse(input logic [23:0] mantissa_a, mantissa_b,
							 input logic [7:0] shamt,
							 input logic mantissa_choose,
							 output logic [23:0] shifted_mantissa);
	
	
	logic [23:0] temp_mantissa, chosen_mantissa;
	logic control;
	
	assign chosen_mantissa = mantissa_choose ? mantissa_a : mantissa_b;
	assign temp_mantissa = chosen_mantissa >> 1'b1;
	assign control = shamt[7] | shamt[6] | shamt[5] | (shamt[4] & shamt[3]);
	
	assign shifted_mantissa = control ? 24'b0 : temp_mantissa;
	//assign shifted_mantissa = mantissa_a;
	
endmodule

module sum_mantisse(input logic [23:0] mantissa_a, mantissa_b, shifted_mantissa,
						  input logic mantissa_choose,
						  output logic [23:0] sum_mantissa);
	
	logic [23:0] temp;
	
	assign temp = ~mantissa_choose ? mantissa_a : mantissa_b;
	assign sum_mantissa = temp + shifted_mantissa;

endmodule

module normalise_mantisse(input logic [23:0] sum_mantissa,
								  output logic [23:0] done_mantissa);
								  
	assign done_mantissa = sum_mantissa[23] ? sum_mantissa[23:1] : sum_mantissa[22:0];							  
								  
endmodule