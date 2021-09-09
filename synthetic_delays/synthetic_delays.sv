`timescale 1ns/1ps
// set time unit and precision
module synthetic_delays(input logic a, b, c,
								output logic y);
	logic nota, notb, notc, n1, n2, n3;
	
	// make synthetic delay 1ns for invertors 
	assign #1 {nota, notb, notc} = ~{a, b, c};
	
	// make synthetic delay 2ns for AND-gate
	assign #2 n1 = nota & notb & notc;
	assign #2 n2 = a & notb & notc;
	assign #2 n3 = a & notb & c;
	
	// make synthetic delay 4ns for OR-gate
	assign #4 y = n1 | n2 | n3;
	
endmodule