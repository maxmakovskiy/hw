// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Fri Sep 03 12:52:11 2021"

module priorityCoder(
	a1,
	a2,
	a3,
	a4,
	a5,
	a6,
	a7,
	a0,
	y0,
	y1,
	y2
);


input wire	a1;
input wire	a2;
input wire	a3;
input wire	a4;
input wire	a5;
input wire	a6;
input wire	a7;
input wire	a0;
output wire	y0;
output wire	y1;
output wire	y2;

wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_31;




assign	SYNTHESIZED_WIRE_41 = SYNTHESIZED_WIRE_35 & SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_13 = SYNTHESIZED_WIRE_36 & SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_22 = SYNTHESIZED_WIRE_37 & SYNTHESIZED_WIRE_5;

assign	y0 = SYNTHESIZED_WIRE_6 | SYNTHESIZED_WIRE_38 | SYNTHESIZED_WIRE_39 | SYNTHESIZED_WIRE_40;

assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_41 & SYNTHESIZED_WIRE_36;

assign	SYNTHESIZED_WIRE_42 = SYNTHESIZED_WIRE_41 & SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_35 & a1;

assign	SYNTHESIZED_WIRE_27 = SYNTHESIZED_WIRE_41 & a2;

assign	SYNTHESIZED_WIRE_44 = SYNTHESIZED_WIRE_16 & a3;

assign	SYNTHESIZED_WIRE_6 = SYNTHESIZED_WIRE_42 & a4;

assign	SYNTHESIZED_WIRE_26 = SYNTHESIZED_WIRE_18 & a7;

assign	SYNTHESIZED_WIRE_23 = SYNTHESIZED_WIRE_42 & SYNTHESIZED_WIRE_37;

assign	SYNTHESIZED_WIRE_43 = SYNTHESIZED_WIRE_42 & SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_40 = SYNTHESIZED_WIRE_23 & a5;

assign	SYNTHESIZED_WIRE_38 = SYNTHESIZED_WIRE_43 & a6;

assign	SYNTHESIZED_WIRE_39 = SYNTHESIZED_WIRE_43 & SYNTHESIZED_WIRE_26;

assign	y1 = SYNTHESIZED_WIRE_27 | SYNTHESIZED_WIRE_38 | SYNTHESIZED_WIRE_38 | SYNTHESIZED_WIRE_44;

assign	y2 = SYNTHESIZED_WIRE_31 | SYNTHESIZED_WIRE_40 | SYNTHESIZED_WIRE_39 | SYNTHESIZED_WIRE_44;

assign	SYNTHESIZED_WIRE_35 =  ~a0;

assign	SYNTHESIZED_WIRE_1 =  ~a1;

assign	SYNTHESIZED_WIRE_36 =  ~a2;

assign	SYNTHESIZED_WIRE_3 =  ~a3;

assign	SYNTHESIZED_WIRE_37 =  ~a4;

assign	SYNTHESIZED_WIRE_5 =  ~a5;

assign	SYNTHESIZED_WIRE_18 =  ~a6;


endmodule
