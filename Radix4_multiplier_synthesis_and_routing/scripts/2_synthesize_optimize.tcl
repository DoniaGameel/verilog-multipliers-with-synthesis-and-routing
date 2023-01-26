
#########################################################
#                 2_synthesize_optimize.tcl
#
# Description:  Synthesize and optimize the 
#               DEMO CHIP and generate
#               the Oasys-RTL databases. 
#
# Usage:        source in Oasys-RTL Command prompt
#
# Dependencies: 0_adder_init_design.tcl
#               1_read_design.tcl
#               Launched from Oasys-RTL shell
#
#########################################################


#=======================================================#
#Check Status of Flow and load prior scripts if needed
#=======================================================#

#Check if dependent scripts have been loaded
if {![info exists top_module]} {
     source scripts/0_init_design.tcl
     source scripts/1_read_design.tcl
}

#=======================================================#
#Synthesize the DEMO CHIP RTL core
#=======================================================#

#Perform Synthesis
if { $parameters == 1 } {
     synthesize -module ${top_module} -parameters ${param_values}
} else {
     synthesize -module ${top_module} 
}

write_design ${odb_dir}/2_synthesized.odb

#=======================================================#
##Read constraints (logical and physical)
#=======================================================#
read_sdc -verbose $demo_adder_sdc_files 
check_timing
report_design_metrics

# Create User Path groups
group_path -name I2R   -from [all_inputs]
group_path -name I2O   -from [all_inputs] -to [all_outputs]
group_path -name R2O   -to  [all_outputs]


#=======================================================#
#Optimize for timing 
#=======================================================#
optimize -virtual
write_design ${odb_dir}/2_virtual_opt.odb
report_timing
report_path_groups

#optimize for placement 

######################################################################
# create_chip with appropriate bloackages for IO pads
######################################################################


#create_chip -height 10 -width 100
redirect -file ${log_dir}/chip.log { create_chip   -bottom_clearance 30 -left_clearance 30 -right_clearance 30 -top_clearance 30 -utilization 60 }
#get first line
set resultedDieCommands [lindex  [split [ exec cat ${log_dir}/chip.log] \n] 1]
#remove spaces, get 7th element and remove the extra )
set die [string map { ) {}} [lindex [regexp -inline -all -- {\S+}  $resultedDieCommands ] 7]]

#set die [ exec cat ${log_dir}/chip.log | grep "create new die" | cut -c46-55 ]
set core [ expr $die - 30]


#puts [lindex [regexp -inline -all -- {\S+|\)|\(} [lindex $y 2]] 7]

create_blockage -name  blk_top -type macro -left 0 -right $die -bottom $core -top $die
create_blockage -name  blk_bottom -type macro -left 0 -right $die -bottom 0 -top 30
create_blockage -name  blk_left  -type macro -left 0 -right 30 -bottom 0 -top $die
create_blockage -name  blk_right  -type macro -left $core -right $die -bottom 0 -top $die

###Optimize place 
optimize -place
write_design ${odb_dir}/2_placed_opt.odb




echo "\n-------------------------------------"
echo "\nSynthesis, optimization complete"
echo "\n-------------------------------------\n"

#exit
