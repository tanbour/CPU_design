onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/clk
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/coe_ctrl_bgn_export
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/coe_ctrl_si_export
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/coe_ctrl_load_export
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/coe_ctrl_rdy_export
add wave -noupdate -radix hexadecimal -childformat {{{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[31]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[30]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[29]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[28]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[27]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[26]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[25]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[24]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[23]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[22]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[21]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[20]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[19]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[18]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[17]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[16]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[15]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[14]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[13]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[12]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[11]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[10]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[9]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[8]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[7]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[6]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[5]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[4]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[3]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[2]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[1]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[0]} -radix hexadecimal}} -subitemconfig {{/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[31]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[30]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[29]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[28]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[27]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[26]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[25]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[24]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[23]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[22]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[21]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[20]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[19]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[18]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[17]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[16]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[15]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[14]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[13]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[12]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[11]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[10]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[9]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[8]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[7]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[6]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[5]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[4]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[3]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[2]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[1]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata[0]} {-height 15 -radix hexadecimal}} /SRAM_IO_CTRL_LOGIC_TEST/avs_cpuctrl_writedata
add wave -noupdate -divider fpga_lofic
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_write
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/fpga/rsi_reset_n
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/fpga/reg_LOAD
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/fpga/reg_ctrl_bgn
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/fpga/reg_ctrl_mode
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/fpga/reg_sram_addr
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/fpga/reg_sram_data
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/fpga/cnt_bit_load
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/fpga/CTRL_SO
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/fpga/is_LOAD
add wave -noupdate -radix hexadecimal -childformat {{{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[31]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[30]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[29]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[28]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[27]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[26]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[25]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[24]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[23]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[22]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[21]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[20]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[19]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[18]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[17]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[16]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[15]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[14]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[13]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[12]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[11]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[10]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[9]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[8]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[7]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[6]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[5]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[4]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[3]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[2]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[1]} -radix hexadecimal} {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[0]} -radix hexadecimal}} -subitemconfig {{/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[31]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[30]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[29]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[28]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[27]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[26]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[25]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[24]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[23]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[22]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[21]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[20]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[19]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[18]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[17]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[16]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[15]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[14]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[13]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[12]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[11]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[10]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[9]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[8]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[7]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[6]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[5]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[4]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[3]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[2]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[1]} {-height 15 -radix hexadecimal} {/SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata[0]} {-height 15 -radix hexadecimal}} /SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_cpuctrl_writedata
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_sram_addr_readdata
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/fpga/avs_sram_data_readdata
add wave -noupdate -divider sram_ctrl
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/cct/LOAD_N
add wave -noupdate /SRAM_IO_CTRL_LOGIC_TEST/cct/reg_bits
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {157251 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 225
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
configure wave -timelineunits ps
update
WaveRestoreZoom {143159 ps} {300659 ps}
