module fulladder_tb();
	logic a, b, cin, s, cout;
	
	fulladder dut(a, b, cin, s, cout);
	
	initial begin
		a = 0; b = 0; cin = 1; #10;
		assert (s === 1) else $error("sum 001 failed");
		assert (cout === 0) else $error("carry out 001 failed");
		
		a = 0; b = 1; cin = 0; #10;
		assert (s === 1) else $error("sum 010 failed");
		assert (cout === 0) else $error("carry out 010 failed");
		
		a = 0; b = 1; cin = 1; #10;
		assert (s === 0) else $error("sum 011 failed");
		assert (cout === 1) else $error("carry out 011 failed");
		
		a = 1; b = 0; cin = 0; #10;
		assert (s === 1) else $error("sum 100 failed");
		assert (cout === 0) else $error("carry out 100 failed");
		
		a = 1; b = 0; cin = 1; #10;
		assert (s === 0) else $error("sum 101 failed");
		assert (cout === 1) else $error("carry out 101 failed");
		
		a = 1; b = 1; cin = 0; #10;
		assert (s === 0) else $error("sum 110 failed");
		assert (cout === 1) else $error("carry out 110 failed");
		
		a = 1; b = 1; cin = 1; #10;
		assert (s === 1) else $error("sum 111 failed");
		assert (cout === 1) else $error("carry out 111 failed");
	end
	
endmodule