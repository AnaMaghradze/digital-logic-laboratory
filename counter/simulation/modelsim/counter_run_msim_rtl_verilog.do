transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/ninom/OneDrive/Desktop/CE475/counter {C:/Users/ninom/OneDrive/Desktop/CE475/counter/de0_nano_soc_baseline.v}
vlog -vlog01compat -work work +incdir+C:/Users/ninom/OneDrive/Desktop/CE475/counter {C:/Users/ninom/OneDrive/Desktop/CE475/counter/tb.v}

