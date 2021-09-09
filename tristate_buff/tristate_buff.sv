module tristate_buff(input logic [1:0] a,
							input logic en,
							output tri [1:0] y);

	assign y = en ? a : 2'bz;
endmodule						