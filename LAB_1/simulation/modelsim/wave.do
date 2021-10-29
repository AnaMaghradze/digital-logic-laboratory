onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/clk
add wave -noupdate /tb/key
add wave -noupdate /tb/press_multiplier/stage
add wave -noupdate /tb/press_multiplier/press_counter_A
add wave -noupdate /tb/press_multiplier/press_counter_B
add wave -noupdate /tb/led
add wave -noupdate /tb/press_multiplier/FPGA_CLK_50
add wave -noupdate /tb/press_multiplier/KEY
add wave -noupdate /tb/press_multiplier/keyreg1
add wave -noupdate /tb/press_multiplier/keyreg2
add wave -noupdate /tb/press_multiplier/pressed
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 231
configure wave -valuecolwidth 55
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {60 ps}
