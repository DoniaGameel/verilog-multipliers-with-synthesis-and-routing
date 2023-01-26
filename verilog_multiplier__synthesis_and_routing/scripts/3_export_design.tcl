
#########################################################
#                  3_export_design.tcl
#
# Description:  Export the design data
#
# Usage:        source in Oasys-RTL Command prompt
#
# Dependencies: init_design.tcl
#               1_load_design.tcl
#               2_synthesize_optimize.tcl
#               Launched from Oasys-RTL shell after
#               synthesis and optimization
#
#########################################################

#Check if dependent scripts have been loaded
if {![info exists top_module]} {
    source scripts/0_init_design.tcl
    source scripts/1_read_design.tcl
    source scripts/2_synthesize_optimize.tcl
}

#file mkdir ${output_dir}
#file mkdir ${rpt_dir}
report_units
report_timing           > ${rpt_dir}/time.rpt
report_path_groups      > ${rpt_dir}/path.rpt
report_endpoints        > ${rpt_dir}/endpoints.rpt
report_power            > ${rpt_dir}/power.rpt
report_design_metrics   > ${rpt_dir}/design.rpt
report_area   		> ${rpt_dir}/area.rpt

exec cat ${rpt_dir}/design.rpt ${rpt_dir}/path.rpt > ${rpt_dir}/collectiveReport
exec tail -3 ${rpt_dir}/power.rpt >> ${rpt_dir}/collectiveReport
#Write odb
#file mkdir ${odb_dir}
#write_design ${odb_dir}/demo_${top_module}.odb

#file mkdir ${db_dir}
#write_db ${db_dir}/demo_${top_module}.db

#write MXDB
#file mkdir ${mxdb_dir}
#write_mxdb ${mxdb_dir}/demo_${top_module}.mxdb

#Write verilog
file mkdir ${output_dir}/verilog
write_verilog ${output_dir}/verilog/demo_${top_module}.syn.v
#exec cp ${output_dir}/verilog/demo_${top_module}.syn.v  /home/vlsi/Desktop/sim/source_after/demo_${top_module}.syn.v
#exec cp ${output_dir}/verilog/demo_${top_module}.syn.v  /home/vlsi/Desktop/Lab3/verilog/demo_${top_module}.syn.v
#Write SDC
#file mkdir ${output_dir}/constraints
#write_sdc ${output_dir}/constraints/demo_${top_module}.oasys.sdc

#save_upf

#save_upf ${output_dir}/constraints/demo_${top_module}.oasys.upf

#Write Floorplan (DEF)
#file mkdir ${output_dir}/floorplan
#write_def -floorplan ${output_dir}/floorplan/demo_${top_module}.def


echo "\n-----------------------------"
echo "\nDesign data exported to output dir."
echo "\n-----------------------------\n"
