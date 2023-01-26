# Enable capture of commands
# config_shell -echo true

###################Top Module Specification###########
set max_route_layer "8"

############################TODO Set design file path variables ###########################
set ekit_dir      "$env(PWD)"
set demo_rtl_dir  "${ekit_dir}/rtl/"
set script_dir    "${ekit_dir}/scripts"
set library_path  "${ekit_dir}/lib_data"
set search_path    "${demo_rtl_dir}/ ${library_path} "


#Set Oasys-RTL script and output path variables
###########################TODO Update top Module parameters#####################
set parameters 0
set param_values { {N 8} }
set top_module "Booth"
set output_dir "${ekit_dir}/${top_module}"

###########################TODO RTL and Constraints paths ######################
set rtl_list { "booth.v" }
set demo_adder_sdc_files "${ekit_dir}/constraints/demo_adder_func.sdc"
################################# RTL and Libraries ###########################################


#Set Technology path variables

#set macro_libs
set std_vlt_lib "NangateOpenCellLibrary_typical.lib"
set tech_file   "NangateOpenCellLibrary.tech.lef"
set lef_files   "NangateOpenCellLibrary.macro.lef"
set ptf_file    "NCSU_FreePDK_45nm.ptf"
set power_files "${ekit_dir}/constraints/demo_adder.85.upf"

#################################################################################


set odb_dir "${output_dir}/odb"
set log_dir "${output_dir}/logs"
set rpt_dir "${output_dir}/rpt"


foreach f  "${output_dir}  ${log_dir} ${rpt_dir} ${odb_dir}" {

	if {[file exist $f]} {
		puts "$f exists and will be used."
	} else {
	    puts "Directory $f does not exists, creating..."
	    file mkdir $f
	}

}



##set a consistant reporting format for timing
config_report timing -format "cell edge arrival delay arc_delay net_delay slew net_load load fanout location power_domain"



echo "\n-----------------------------"
echo "\nDone setting design variables"
echo "\n-----------------------------\n"
