transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+F:/digital\ electronics/mux_via_tribuff {F:/digital electronics/mux_via_tribuff/mux2_8bit.sv}
vlog -sv -work work +incdir+F:/digital\ electronics/mux_via_tribuff {F:/digital electronics/mux_via_tribuff/tristate.sv}
vlog -sv -work work +incdir+F:/digital\ electronics/mux_via_tribuff {F:/digital electronics/mux_via_tribuff/mux2.sv}

vlog -sv -work work +incdir+F:/digital\ electronics/mux_via_tribuff {F:/digital electronics/mux_via_tribuff/mux2_8bit_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  mux2_8bit_tb

add wave *
view structure
view signals
run -all
