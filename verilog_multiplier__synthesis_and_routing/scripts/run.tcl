#if { $# > 1 } {
#source scripts/4_clear_designs.tcl
#}
source scripts/0_init_design.tcl
source scripts/1_read_design.tcl
source scripts/2_synthesize_optimize.tcl
source scripts/3_export_design.tcl

exec code ${rpt_dir}/collectiveReport
