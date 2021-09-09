module tristate_buff_tb();
	logic [1:0] a, y;
	logic en;
	
	tristate_buff dut(a, en, y);
	
	initial begin
		a = 2'b10;
	
		en = 1; #10;
		assert (y === 2'b10) else $error("en = 1 failed");
		
		en = 0; #10;
		assert (y === 2'bz) else $error("en = 0 failed");
	end
	
	
endmodule