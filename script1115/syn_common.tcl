###################################
#   Synopsys Tool Common Script   #
#      For Design Compiler        #
###################################
# Author:	Congyin Shi       #
# Version:	1.0 for IBM018    #
# Update:	2014-02-19        #
###################################

# Set Environment #

set link_force_case  "check_reference"

 ## User-defined Paths ##
#set library_path "/disk/amsc/TSMC_PDK/TSMCHOME/digital/Front_End"
set library_path "/disk/amsc/IBM_PDK/cmrf8sf/digital/RVt/aci/sc-x"
set synopsys_db_path ${library_path}/synopsys
set synopsys_sdb_path ${library_path}/symbols/synopsys
set synopsys_max_db_name scx3_cmos8rf_rvt_ss_1p08v_125c
set synopsys_min_db_name scx3_cmos8rf_rvt_ff_1p32v_m40c
set synopsys_typ_db_name scx3_cmos8rf_rvt_tt_1p2v_25c

set iopad_path  "/disk/amsc/IBM_PDK/cmrf8sf/digital/RVt/aci/io"
set iopad_db_path   ${iopad_path}/synopsys
set iopad_sdb_path  ${iopad_path}/symbols/synopsys
set iopad_max_db_name iogpil_cmrf8sf_rvt_ss_1p08v_2p3v_125c  
set iopad_min_db_name iogpil_cmrf8sf_rvt_ff_1p32v_2p7v_m40c
set iopad_typ_db_name iogpil_cmrf8sf_rvt_tt_1p2v_2p5v_25c

set macro_db_path "/home/grads/j/jiafan0420/ECEN468/CPU_design/macros"
set ibm_sram_max_db_name RA1SHD_IBM1024X8_ss_1p08v_125c_syn
set ibm_sram_min_db_name RA1SHD_IBM1024X8_ff_1p32v_m40c_syn
set ibm_sram_typ_db_name RA1SHD_IBM1024X8_tt_1p2v_25c_syn

set search_path [list . ${synopsys_root}/libraries/syn ${synopsys_root}/dw/sim_ver ${synopsys_db_path} ${iopad_db_path} ${macro_db_path}]

 ## Set libraries
set target_library  [list ${synopsys_typ_db_name}.db ${synopsys_max_db_name}.db ${synopsys_min_db_name}.db ${iopad_typ_db_name}.db ${iopad_max_db_name}.db ${iopad_min_db_name}.db ${ibm_sram_typ_db_name}.db ${ibm_sram_max_db_name}.db ${ibm_sram_min_db_name}.db]
set symbol_library  [list ${synopsys_sdb_path}/ibm13rfrvt.sdb ${iopad_sdb_path}/iogpil_cmrf8sf_rvt.sdb]
set synthetic_library  ""
set link_library "* $target_library $synthetic_library"
 
 ## Set wire load model
set wl_model ibm13_wl10

# Build Directory Structure #

 ## Set Directory Structure Environment ##
set syn_dir "./syn"
#set syn_db_dir "./syn/database"
#set syn_nlst_dir "./syn/netlist"
#set syn_rpt_dir "./syn/report"
set syn_db_dir ${syn_dir}/database
set syn_nlst_dir ${syn_dir}/netlist
set syn_rpt_dir ${syn_dir}/report

set icc_dir "./icc"
#set icc_db_dir "./icc/database"
#set icc_nlst_dir "./icc/netlist"
#set icc_rpt_dir "./icc/report"
set icc_db_dir ${icc_dir}/database
set icc_nlst_dir ${icc_dir}/netlist
set icc_rpt_dir ${icc_dir}/report

set fm_dir "./fm"
#set fm_db_dir "./fm/database"
#set fm_rpt_dir "./fm/report"
set fm_db_dir ${fm_dir}/database
set fm_rpt_dir ${fm_dir}/report

 ## Create Directories ##
if {![file exist $syn_dir]} {sh mkdir $syn_dir}
if {![file exist $syn_db_dir]} {sh mkdir $syn_db_dir}
if {![file exist $syn_nlst_dir]} {sh mkdir $syn_nlst_dir}
if {![file exist $syn_rpt_dir]} {sh mkdir $syn_rpt_dir}

if {![file exist $icc_dir]} {sh mkdir $icc_dir}
if {![file exist $icc_db_dir]} {sh mkdir $icc_db_dir}
if {![file exist $icc_nlst_dir]} {sh mkdir $icc_nlst_dir}
if {![file exist $icc_rpt_dir]} {sh mkdir $icc_rpt_dir}

if {![file exist $fm_dir]} {sh mkdir $fm_dir}
if {![file exist $fm_db_dir]} {sh mkdir $fm_db_dir}
if {![file exist $fm_rpt_dir]} {sh mkdir $fm_rpt_dir}

 ## My Design ##
#set my_design PCPU_SA_TOP_LEVEL
set my_design SCPU_SRAM_8BIT_ALU_SPI_TOP

##################################
# Parameters for Design Compiler #
##################################

 ## Clock Attribute ##
set ck_port CLK
set ck_period 10
set ck_tran 0.5
set ck_latency_max 0
set ck_latency_min 0
set ck_uncertainty 0.2
 ## Set clock/reset/scan_enable/scan_mode network as ideal network ##
set rst_port RST_N
#set fs_path_from [list ${rst_port}]
#set fs_path_to [list i_addr d_addr d_we d_dataout]
#set ideal_net ${fs_path_from}
set ideal_net ${rst_port}
 ## Set port constraint ##
set in_delay 2
set out_delay 2 
 ## Set load ##
#set drv_cell BUFX6TF
#set drv_cell_pin Y
set out_load 0.8
 ## Set global constraint ##
set glb_max_fan 10
set glb_max_tran 1
#set glb_max_cap 5
set glb_op_con ${synopsys_typ_db_name}
#set glb_op_con scx3_cmos8rf_rvt_tt_1p2v_25c

##############################
# Parameters for IC Compiler #
##############################
set icc_tech_dir /disk/amsc/IBM_PDK/cmrf8sf/digital/tech/cmos8rf_synopsys_20100416/synopsys/v.20100416
set icc_max_lib ${synopsys_max_db_name}.db
set icc_min_lib ${synopsys_min_db_name}.db
set apollo_path ${library_path}/astro
set icc_tech_file ${apollo_path}/tf/ibm13_8lm_2thick_3rf.tf
set icc_plib_file ${apollo_path}/plib/ibm13_8lm_2thick_3rf.plib
#set icc_ref_lib ${apollo_path}/ibm13rfrvt_fram
set icc_ref_lib "/home/grads/s/scytulip/digital/ibm130/ibm13rfrvt_fram_update"
#set icc_tdf_file ./src/${my_design}.tdf
set icc_maxtlu_file ${icc_tech_dir}/tluplus/cmos8rf_8MA_32_FuncCmax.tluplus
set icc_mintlu_file ${icc_tech_dir}/tluplus/cmos8rf_8MA_32_FuncCmin.tluplus
set icc_tlu_map ${icc_tech_dir}/tluplus/cmos8rf_8MA_32.icc_maskname.map
set icc_gds_layermap ${apollo_path}/gds2OutLayer_8lm_2thick_3rf.map
set icc_lef_lib ${library_path}/lef
set icc_lef_file ${icc_lef_lib}/ibm13_8lm_2thick_3rf.lef
#set icc_pad_dir /disk/amsc/IBM_PDK/cmrf8sf/digital/RVt/aci/io/apollo
set icc_pad_dir "/home/grads/j/jiafan0420/lib130/aci/io/apollo"
set icc_pad_lib ${icc_pad_dir}/iogpil_cmrf8sf_rvt_M2_3_3


#############
# ECO Usage #
#############
set pt_dir /softwares/Common/synopsys/PTStandalone_D-2009.12/amd64/syn/bin
set star_dir /softwares/Common/synopsys/StarRC_vD-2010.06/bin
set max_grd ${icc_tech_dir}/nxtgrd/cmos8rf_8MA_32_FuncCmax.nxtgrd
set min_grd ${icc_tech_dir}/nxtgrd/cmos8rf_8MA_32_FuncCmin.nxtgrd
set grd_map ${icc_tech_dir}/nxtgrd/cmos8rf_8MA_32.star.map


