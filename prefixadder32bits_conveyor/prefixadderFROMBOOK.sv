module prefixaddpipe(
    input logic clk, 
    input logic [31:0] a, b,
    input logic cin,
    output logic [31:0] s, output cout
);
    // p and g prefixes for rows 0 - 5
    logic [30:0] p0, p1, p2, p3, p4, p5;
    logic [30:0] g0, g1, g2, g3, g4, g5;
    logic p_1_0, p_1_1, p_1_2, p_1_3, p_1_4, p_1_5,
          g_1_0, g_1_1, g_1_2, g_1_3, g_1_4, g_1_5;

    // pipeline values for a and b
    logic [31:0] a0, a1, a2, a3, a4, a5,
                 b0, b1, b2, b3, b4, b5;

    // row 0
    flop #(2) flop0_pg_1(
        clk,
        {1'b0,cin},
        {p_1_0,g_1_0}
    );
    pandg row0(
        clk,
        a[30:0], 
        b[30:0], 
        p0, 
        g0
    );

    // row 1
    flop #(2) flop1_pg_1(
        clk, 
        {p_1_0,g_1_0}, 
        {p_1_1,g_1_1}
    );
    flop #(30) flop1_pg(
        clk,
        {p0[29],p0[27],p0[25],p0[23],p0[21],p0[19],p0[17],p0[15], p0[13],p0[11],p0[9],p0[7],p0[5],p0[3],p0[1],
         g0[29],g0[27],g0[25],g0[23],g0[21],g0[19],g0[17],g0[15], g0[13],g0[11],g0[9],g0[7],g0[5],g0[3],g0[1]},
        {p1[29],p1[27],p1[25],p1[23],p1[21],p1[19],p1[17],p1[15], p1[13],p1[11],p1[9],p1[7],p1[5],p1[3],p1[1],
         g1[29],g1[27],g1[25],g1[23],g1[21],g1[19],g1[17],g1[15], g1[13],g1[11],g1[9],g1[7],g1[5],g1[3],g1[1]});
    blackbox row1(
        clk,
        {p0[30],p0[28],p0[26],p0[24],p0[22], p0[20],p0[18],p0[16],p0[14],p0[12], p0[10],p0[8],p0[6],p0[4],p0[2],p0[0]},
        {p0[29],p0[27],p0[25],p0[23],p0[21], p0[19],p0[17],p0[15],p0[13],p0[11], p0[9], p0[7], p0[5],p0[3],p0[1],1'b0},
        {g0[30],g0[28],g0[26],g0[24],g0[22], g0[20],g0[18],g0[16],g0[14],g0[12], g0[10], g0[8],g0[6],g0[4],g0[2],g0[0]},
        {g0[29],g0[27],g0[25],g0[23],g0[21], g0[19],g0[17],g0[15],g0[13],g0[11], g0[9], g0[7], g0[5],g0[3],g0[1],g_1_0},
        {p1[30],p1[28],p1[26],p1[24],p1[22],p1[20], p1[18],p1[16],p1[14],p1[12],p1[10], p1[8], p1[6],p1[4],p1[2],p1[0]},
        {g1[30],g1[28],g1[26],g1[24],g1[22],g1[20], g1[18],g1[16],g1[14],g1[12],g1[10],g1[8], g1[6],g1[4],g1[2],g1[0]});

    // row 2
    flop #(2) flop2_pg_1(
        clk, 
        {p_1_1,g_1_1}, 
        {p_1_2,g_1_2}
    );
    flop #(30) flop2_pg(
        clk,
        {p1[28:27],p1[24:23],p1[20:19],p1[16:15],p1[12:11], p1[8:7],p1[4:3],p1[0],
         g1[28:27],g1[24:23],g1[20:19],g1[16:15],g1[12:11], g1[8:7],g1[4:3],g1[0]},
        {p2[28:27],p2[24:23],p2[20:19],p2[16:15],p2[12:11], p2[8:7],p2[4:3],p2[0],
         g2[28:27],g2[24:23],g2[20:19],g2[16:15],g2[12:11], g2[8:7],g2[4:3],g2[0]}
    );

    blackbox row2(
        clk,
        {p1[30:29],p1[26:25],p1[22:21],p1[18:17],p1[14:13],p1[10:9],p1[6:5],p1[2:1]},
        {{2{p1[28]}}, {2{p1[24]}}, {2{p1[20]}}, {2{p1[16]}}, {2{p1[12]}}, {2{p1[8]}}, {2{p1[4]}}, {2{p1[0]}}},
        {g1[30:29],g1[26:25],g1[22:21],g1[18:17],g1[14:13],g1[10:9],g1[6:5],g1[2:1]},
        {{2{g1[28]}}, {2{g1[24]}}, {2{g1[20]}}, {2{g1[16]}}, {2{g1[12]}}, {2{g1[8]}}, {2{g1[4]}}, {2{g1[0]}}},
        {p2[30:29],p2[26:25],p2[22:21],p2[18:17],p2[14:13],p2[10:9],p2[6:5],p2[2:1]},
        {g2[30:29],g2[26:25],g2[22:21],g2[18:17],g2[14:13],g2[10:9],g2[6:5],g2[2:1]}
    );

    // row 3
    flop #(2) flop3_pg_1(
        clk, 
        {p_1_2,g_1_2}, 
        {p_1_3,g_1_3}
    );
    flop #(30) flop3_pg(
        clk, 
        {p2[26:23],p2[18:15],p2[10:7],p2[2:0], g2[26:23],g2[18:15],g2[10:7],g2[2:0]},
        {p3[26:23],p3[18:15],p3[10:7],p3[2:0], g3[26:23],g3[18:15],g3[10:7],g3[2:0]}
    );
    blackbox row3(
        clk,
        {p2[30:27],p2[22:19],p2[14:11],p2[6:3]},
        {{4{p2[26]}}, {4{p2[18]}}, {4{p2[10]}}, {4{p2[2]}}},
        {g2[30:27],g2[22:19],g2[14:11],g2[6:3]},
        {{4{g2[26]}}, {4{g2[18]}}, {4{g2[10]}}, {4{g2[2]}}},
        {p3[30:27],p3[22:19],p3[14:11],p3[6:3]},
        {g3[30:27],g3[22:19],g3[14:11],g3[6:3]}
    );

    // row 4
    flop #(2) flop4_pg_1(
        clk,
        {p_1_3,g_1_3},
        {p_1_4,g_1_4}
    );
    flop #(30) flop4_pg(
        clk,
        {p3[22:15],p3[6:0], g3[22:15],g3[6:0]},
        {p4[22:15],p4[6:0], g4[22:15],g4[6:0]}
    );
    blackbox row4(
        clk,
        {p3[30:23],p3[14:7]},
        {{8{p3[22]}}, {8{p3[6]}}},
        {g3[30:23],g3[14:7]},
        {{8{g3[22]}}, {8{g3[6]}}},
        {p4[30:23],p4[14:7]},
        {g4[30:23],g4[14:7]}
    );

    // row 5
    flop #(2) flop5_pg_1(
        clk, 
        {p_1_4,g_1_4},
        {p_1_5,g_1_5}
    );
    flop #(30) flop5_pg(
        clk,
        {p4[14:0],g4[14:0]},
        {p5[14:0],g5[14:0]}
    );
    blackbox row5(
        clk,
        p4[30:15],
        {16{p4[14]}},
        g4[30:15],
        {16{g4[14]}},
        p5[30:15],
        g5[30:15]
    );

    // pipeline registers for a and b
    flop #(64) flop0_ab(clk, {a,b}, {a0,b0});
    flop #(64) flop1_ab(clk, {a0,b0}, {a1,b1});
    flop #(64) flop2_ab(clk, {a1,b1}, {a2,b2});
    flop #(64) flop3_ab(clk, {a2,b2}, {a3,b3});
    flop #(64) flop4_ab(clk, {a3,b3}, {a4,b4});
    flop #(64) flop5_ab(clk, {a4,b4}, {a5,b5});
    sum row6(clk, {g5,g_1_5}, a5, b5, s);

    // generate cout
    assign cout = (a5[31] & b5[31]) | (g5[30] & (a5[31] | b5[31]));
endmodule

// submodules
module pandg(
    input logic clk,
    input logic [30:0] a, b,
    output logic [30:0] p, g
);
    always_ff @(posedge clk)
    begin
        p <= a | b;
        g <= a & b;
    end
endmodule

module blackbox(
    input logic clk,
    input logic [15:0] pleft, pright, gleft, gright,
    output logic [15:0] pnext, gnext
);

    always_ff @(posedge clk)
    begin
        pnext <= pleft & pright;
        gnext <= pleft & gright | gleft;
    end
endmodule

module sum(
    input logic clk,
    input logic [31:0] g, a, b,
    output logic [31:0] s
);

    always_ff @(posedge clk)
        s <= a ^ b ^ g;
endmodule

module flop
    #(parameter width = 8)
(
    input logic clk,
    input logic [width-1:0] d,
    output logic [width-1:0] q
);

    always_ff @(posedge clk)
        q <= d;
endmodule