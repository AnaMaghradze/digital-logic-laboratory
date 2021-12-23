onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/clk
add wave -noupdate /tb/SW
add wave -noupdate -radix unsigned /tb/KEY
add wave -noupdate /tb/uart/DATA
add wave -noupdate /tb/uart/START_TX
add wave -noupdate /tb/uart/TX/DATA
add wave -noupdate /tb/uart/Tx
add wave -noupdate /tb/uart/TX/DATA_transmit
add wave -noupdate /tb/uart/DATA_OUT
add wave -noupdate /tb/uart/TX/count
add wave -noupdate /tb/uart/TX/clock_counter
add wave -noupdate /tb/uart/TX/START_BIT
add wave -noupdate /tb/uart/TX/STOP_BIT
add wave -noupdate /tb/uart/TX/ODD_PARITY_BIT
add wave -noupdate /tb/uart/RX/DATA_received
add wave -noupdate /tb/uart/RX/clock_counter
add wave -noupdate /tb/uart/RX/Rx
add wave -noupdate /tb/uart/RX/DATA_OUT
add wave -noupdate /tb/LED
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {23 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 65
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {68 ps}
