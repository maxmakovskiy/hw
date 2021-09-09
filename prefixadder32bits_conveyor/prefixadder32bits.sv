module prefixadder32bits(
	input logic [31:0] a, b,
	input logic cin,
	output logic [31:0] y,
	output logic cout
);
	logic [30:0] p, g;
	logic [15:0] pij_0, gij_0, pij_1, gij_1,
				 pij_2, gij_2, pij_3, gij_3,
				 pij_4, gij_4;
	logic [31:0] main_prefixes;

	pgblock top(
		.a(a[30:0]), .b(b[30:0]),
		.p(p), .g(g)
	);

	// 	input logic [15:0] pik, gik, pkj, gkj,
	//  output logic [15:0] pij, gij

	pgblackblock string0(
		.pik({p[30], p[28], p[26], p[24], p[22], p[20], p[18], p[16], p[14], p[12], p[10], p[8], p[6], p[4], p[2], p[0]}),
		.gik({g[30], g[28], g[26], g[24], g[22], g[20], g[18], g[16], g[14], g[12], g[10], g[8], g[6], g[4], g[2], g[0]}),
		.pkj({p[29], p[27], p[25], p[23], p[21], p[19], p[17], p[15], p[13], p[11], p[9], p[7], p[5], p[3], p[1], 1'b0}),
		.gkj({g[29], g[27], g[25], g[23], g[21], g[19], g[17], g[15], g[13], g[11], g[9], g[7], g[5], g[3], g[1], cin}),
		.pij(pij_0), .gij(gij_0)
	);

	pgblackblock string1(
		.pik({pij_0[15], p[29], pij_0[13], p[25], pij_0[11], p[21], pij_0[9], p[17], pij_0[7], p[13], pij_0[5], p[9], pij_0[3], p[5], pij_0[1], p[1]}),
		.gik({gij_0[15], g[29], gij_0[13], g[25], gij_0[11], g[21], gij_0[9], g[17], gij_0[7], g[13], gij_0[5], g[9], gij_0[3], g[5], gij_0[1], g[1]}),
		.pkj({pij_0[14], pij_0[14], pij_0[12], pij_0[12], pij_0[10], pij_0[10], pij_0[8], pij_0[8], pij_0[6], pij_0[6], pij_0[4], pij_0[4], pij_0[2], pij_0[2], pij_0[0], pij_0[0]}),
		.gkj({gij_0[14], gij_0[14], gij_0[12], gij_0[12], gij_0[10], gij_0[10], gij_0[8], gij_0[8], gij_0[6], gij_0[6], gij_0[4], gij_0[4], gij_0[2], gij_0[2], gij_0[0], gij_0[0]}),
		.pij(pij_1), .gij(gij_1)
	);

	pgblackblock string2(
		.pik({pij_1[15:14], pij_0[14], p[27], pij_1[11:10], pij_0[10], p[19], pij_1[7:6], pij_0[6], p[11], pij_1[3:2], pij_0[2], p[3]}),
		.gik({gij_1[15:14], gij_0[14], g[27], gij_1[11:10], gij_0[10], g[19], gij_1[7:6], gij_0[6], g[11], gij_1[3:2], gij_0[2], g[3]}),
		.pkj({{4{pij_1[13]}}, {4{pij_1[9]}}, {4{pij_1[5]}}, {4{pij_1[1]}}}),
		.gkj({{4{gij_1[13]}}, {4{gij_1[9]}}, {4{gij_1[5]}}, {4{gij_1[1]}}}),
		.pij(pij_2), .gij(gij_2)
	);

	pgblackblock string3(
		.pik({pij_2[15:12], pij_1[13:12], pij_0[12], p[23], pij_2[7:4], pij_1[5:4], pij_0[4], p[7]}),
		.gik({gij_2[15:12], gij_1[13:12], gij_0[12], g[23], gij_2[7:4], gij_1[5:4], gij_0[4], g[7]}),
		.pkj({{8{pij_2[11]}}, {8{pij_2[3]}}}),
		.gkj({{8{gij_2[11]}}, {8{gij_2[3]}}}),
		.pij(pij_3), .gij(gij_3)
	);

	pgblackblock string4(
		.pik({pij_3[15:8], pij_2[11:8], pij_1[9:8], pij_0[8], p[15]}),
		.gik({gij_3[15:8], gij_2[11:8], gij_1[9:8], gij_0[8], g[15]}),
		.pkj({{16{pij_3[7]}}}),
		.gkj({{16{gij_3[7]}}}),
		.pij(pij_4), .gij(gij_4)
	);

	sumblock sum(
		.a(a), .b(b), .g(main_prefixes),
		.s(y)
	);

	assign main_prefixes = {gij_4, gij_3[7:0], gij_2[3:0], gij_1[1:0], gij_0[0], cin};
	assign cout = (a[31] & b[31]) | (main_prefixes[31] & (a[31] | b[31]));
endmodule

module pgblock(
	input logic [30:0] a, b,
	output logic [30:0] g, p
);
	assign p = a | b;
	assign g = a & b;
endmodule

module pgblackblock(
	input logic [15:0] pik, gik, pkj, gkj,
	output logic [15:0] pij, gij
);
	assign pij = pik & pkj;
	assign gij = gik | (pik & gkj);
endmodule

module sumblock(
	input logic [31:0] a, b, g,
	output logic [31:0] s
);
	assign s = a ^ b ^ g;
endmodule
