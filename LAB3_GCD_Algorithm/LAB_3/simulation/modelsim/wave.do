onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb/clk
add wave -noupdate -radix unsigned /tb/sw
add wave -noupdate -radix unsigned /tb/key
add wave -noupdate -radix unsigned /tb/gcd/state
add wave -noupdate -radix unsigned /tb/gcd/start
add wave -noupdate -radix unsigned /tb/gcd/A
add wave -noupdate -radix unsigned /tb/gcd/B
add wave -noupdate -radix unsigned /tb/gcd/gcd/a
add wave -noupdate -radix unsigned /tb/gcd/gcd/b
add wave -noupdate -radix unsigned /tb/gcd/gcd/gcd_result
add wave -noupdate /tb/gcd/gcd/ready
add wave -noupdate -radix unsigned /tb/gcd/LED
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {33 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 161
configure wave -valuecolwidth 50
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
WaveRestoreZoom {0 ps} {157 ps}
