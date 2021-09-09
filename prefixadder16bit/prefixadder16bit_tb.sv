module prefixadder16bit_tb();
	logic [15:0] num1, num2, result, result_expected;
	logic cin, cout, cout_expected;
	
	prefixadder16bit dut(
		.a(num1),
		.b(num2),
		.s(result),
		.cin(cin),
		.cout(cout)
	);
	
	initial
	begin
		num1 = 16'b1010_1010_1010_1010; num2 = 16'b0101_0101_0101_0101; cin = 1'b0; #10;
		result_expected = 16'b1;
		cout_expected = 1'b0;
		assert (result === result_expected | cout === cout_expected)
		else $error("Error num1 = %b, num2 = %b, cin = %b, result = %b (%b expected), cout = %b (%b expected)", num1, num2, cin, result, result_expected, cout, cout_expected);
		
		num1 = 16'b1010_1010_1010_1010; num2 = 16'b0101_0101_0101_0101; cin = 1'b1; #10;
		result_expected = 16'b0;
		cout_expected = 1'b1;
		assert (result === result_expected | cout === cout_expected)
		else $error("Error num1 = %b, num2 = %b, cin = %b, result = %b (%b expected), cout = %b (%b expected)", num1, num2, cin, result, result_expected, cout, cout_expected);

		num1 = 16'b1000_1111_1001_1110; num2 = 16'b1001_0000_0001_1010; cin = 1'b0; #10;
		result_expected = 16'b0001_1111_1011_1000;
		cout_expected = 1'b1;
		assert (result === result_expected | cout === cout_expected)
		else $error("Error num1 = %b, num2 = %b, cin = %b, result = %b (%b expected), cout = %b (%b expected)", num1, num2, cin, result, result_expected, cout, cout_expected);
		
		$display("Tests completed");
	end

endmodule