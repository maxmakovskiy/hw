module mux2(input logic [3:0] d0, d1,
				input logic s,
				output tri [3:0] y);
				
	tristate buff0(d0, ~s, y);
	tristate buff1(d1, s, y);
	
endmodule