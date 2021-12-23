onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/top/CLOCK_50
add wave -noupdate -group top /tb/top/start
add wave -noupdate -group top /tb/top/prevKey
add wave -noupdate -group top /tb/top/position
add wave -noupdate -group top /tb/top/outsegment
add wave -noupdate -group top /tb/top/LED
add wave -noupdate -group top /tb/top/KEY
add wave -noupdate -group top /tb/top/digitAtPosition
add wave -noupdate -group top /tb/top/digital_out
add wave -noupdate -group top /tb/top/clock_25
add wave -noupdate -group top /tb/top/ADC_SDO
add wave -noupdate -group top /tb/top/ADC_SDI
add wave -noupdate -group top /tb/top/ADC_SCLK
add wave -noupdate -group top /tb/top/ADC_CONVST
add wave -noupdate -expand -group adc /tb/top/adc_inst/clk
add wave -noupdate -expand -group adc /tb/top/adc_inst/start
add wave -noupdate -expand -group adc /tb/top/adc_inst/CONVST
add wave -noupdate -expand -group adc /tb/top/adc_inst/t_whconv_counter
add wave -noupdate -expand -group adc /tb/top/adc_inst/T_whconv
add wave -noupdate -expand -group adc /tb/top/adc_inst/t_conv_counter
add wave -noupdate -expand -group adc /tb/top/adc_inst/T_conv
add wave -noupdate -expand -group adc /tb/top/adc_inst/start_conversion
add wave -noupdate -expand -group adc /tb/top/adc_inst/start_reading
add wave -noupdate -expand -group adc /tb/top/adc_inst/bits_counter
add wave -noupdate -expand -group adc -color Cyan /tb/top/adc_inst/SCK
add wave -noupdate -expand -group adc /tb/top/adc_inst/SDI
add wave -noupdate -expand -group adc /tb/top/adc_inst/SDO
add wave -noupdate -expand -group adc /tb/top/adc_inst/digital_out
add wave -noupdate -expand -group adc /tb/top/adc_inst/channel
add wave -noupdate -expand -group digit_position_decoder /tb/top/dapd_inst/position
add wave -noupdate -expand -group digit_position_decoder /tb/top/dapd_inst/in
add wave -noupdate -expand -group digit_position_decoder /tb/top/dapd_inst/digitAtPosition
add wave -noupdate -expand -group digit_position_decoder /tb/top/dapd_inst/count
add wave -noupdate -expand -group digit_position_decoder /tb/top/dapd_inst/CLK_HZ
add wave -noupdate -expand -group digit_position_decoder /tb/top/dapd_inst/clk_counter
add wave -noupdate -expand -group digit_position_decoder /tb/top/dapd_inst/clk
add wave -noupdate -group segment_decoder /tb/top/sd_inst/outsegment
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2714 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 242
configure wave -valuecolwidth 100
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
WaveRestoreZoom {2475 ps} {2817 ps}
