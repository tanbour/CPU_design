onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider sram
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/CLK
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/RST_N
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/sram/CLK
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/sram/CEN
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/sram/WEN
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/sram/Q
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/sram/A
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/sram/D
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/WEN_AFTER_MUX
add wave -noupdate {/SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/\scpu_ctrl_spi/uut /D_WE}
add wave -noupdate {/SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/\scpu_ctrl_spi/put/spi_MUX_reg /Q}
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/CTRL_BGN
add wave -noupdate {/SYS_PC_WRT_SRAM_SUM10_VG_TEST/scpu_sram_alu/\scpu_ctrl_spi/cct/D_WE_reg /Q}
add wave -noupdate -divider spi_module
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/CPU_BGN
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/coe_cpu_bgn_export
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/coe_ctrl_bgn_export
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/coe_ctrl_load_export
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/coe_ctrl_si_export
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/coe_ctrl_rdy_export
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/coe_anag_lat_export
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/coe_anag_sclk1_export
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/coe_anag_sclk2_export
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/coe_anag_spi_so_export
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/coe_app_done_export
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/coe_app_start_export
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/ADC_PI_dly
add wave -noupdate -divider ctrl_logic
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/CFSA_FOUT
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/csi_clk
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/CTRL_SO
add wave -noupdate -radix unsigned /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/cnt_bit_load
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/reg_sram_all
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/reg_LOAD
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/reg_ctrl_mode
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/reg_sram_addr
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/reg_sram_data
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/reg_ctrl_bgn_dly
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/is_LOAD
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/is_load2_ctrl
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/is_rfrom_ctrl
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/reg_cpu_bgn
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/csi_split_clk
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/coe_clk_export
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/cntsclk
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/reg_cpu_bgn_dly
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/reg_cntsclk
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/rsi_reset_n
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/reg_clk_chg
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/reg_clk_discrt
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/is_start_cnt
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/is_1time_init
add wave -noupdate /SYS_PC_WRT_SRAM_SUM10_VG_TEST/fpga/reg_clk_1time_dly
add wave -noupdate -divider uut_cpu
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {388414000 ps} 0} {{Cursor 2} {1909054000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 366
configure wave -valuecolwidth 102
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
WaveRestoreZoom {0 ps} {442155 ns}