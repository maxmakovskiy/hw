module prefixadder16bit(input logic [15:0] a, b,
								input logic cin,
								output logic [15:0] s,
								output logic cout);
	logic [14:0] p, g;
	logic [7:0] pij_0, gij_0, pij_1, gij_1, pij_2, gij_2, pij_3, gij_3;
	logic [15:0] gen;
	
	pgEveryBlock topString(a[14:0], b[14:0], p, g);
	
	pgBlackBlock string0(
			.pik({p[14], p[12], p[10], p[8], p[6], p[4], p[2], p[0]}),
			.pkj({p[13], p[11], p[9], p[7], p[5], p[3], p[1], 1'b0}),
			.gik({g[14], g[12], g[10], g[8], g[6], g[4], g[2], g[0]}),
			.gkj({g[13], g[11], g[9], g[7], g[5], g[3], g[1], cin}),
			.pij(pij_0),
			.gij(gij_0)
	);
	
	pgBlackBlock string1(
			.pik({pij_0[7], p[13], pij_0[5], p[9], pij_0[3], p[5], pij_0[1], p[1]}),
			.pkj({pij_0[6], pij_0[6], pij_0[4], pij_0[4], pij_0[2], pij_0[2], pij_0[0], pij_0[0]}),
			.gik({gij_0[7], g[13], gij_0[5], g[9], gij_0[3], g[5], gij_0[1], g[1]}),
			.gkj({gij_0[6], gij_0[6], gij_0[4], gij_0[4], gij_0[2], gij_0[2], gij_0[0], gij_0[0]}),
			.pij(pij_1),
			.gij(gij_1)
	);

	pgBlackBlock string2(
			.pik({pij_1[7], pij_1[6], pij_0[6], p[11], pij_1[3], pij_1[2], pij_0[2], p[3]}),
			.pkj({pij_1[5], pij_1[5], pij_1[5], pij_1[5], pij_1[1], pij_1[1], pij_1[1], pij_1[1]}),
			.gik({gij_1[7], gij_1[6], gij_0[6], g[11], gij_1[3], gij_1[2], gij_0[2], g[3]}),
			.gkj({gij_1[5], gij_1[5], gij_1[5], gij_1[5], gij_1[1], gij_1[1], gij_1[1], gij_1[1]}),
			.pij(pij_2),
			.gij(gij_2)
	);
	
	pgBlackBlock string3(
			.pik({pij_2[7], pij_2[6], pij_2[5], pij_2[4], pij_1[5], pij_1[4], pij_0[4], p[7]}),
			.pkj({pij_2[3], pij_2[3], pij_2[3], pij_2[3], pij_2[3], pij_2[3], pij_2[3], pij_2[3]}),
			.gik({gij_2[7], gij_2[6], gij_2[5], gij_2[4], gij_1[5], gij_1[4], gij_0[4], g[7]}),
			.gkj({gij_2[3], gij_2[3], gij_2[3], gij_2[3], gij_2[3], gij_2[3], gij_2[3], gij_2[3]}),
			.pij(pij_3),
			.gij(gij_3)
	);	
	
	assign gen = {gij_3, gij_2[3:0], gij_1[1:0], gij_0[0], cin};
	
	sumBlock sumString(
		.a(a),
		.b(b), 
		.g(gen),
		.s(s)
	);
	
	assign cout = (a[15] & b[15]) | ((a[15] | b[15]) & gen[15]);
	
endmodule

module pgEveryBlock(input logic [14:0] a, b,
					output logic [14:0] p, g);
	assign p = a | b;
	assign g = a & b;
endmodule

module pgBlackBlock(input logic [7:0] pik, gik, pkj, gkj,
						  output logic [7:0] pij, gij);
	assign pij = pik & pkj;
	assign gij = gik | (pik & gkj);
endmodule

module sumBlock(input logic [15:0] a, b, g,
					 output logic [15:0] s);
	assign s = a ^ b ^ g;
endmodule