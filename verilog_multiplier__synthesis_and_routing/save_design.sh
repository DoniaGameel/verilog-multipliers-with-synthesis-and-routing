#write_db -file db/final.db
write_sdf -file multiplier.sdf -corner corner_0_0 -mode new_mode -skip_backslash true
write_verilog -file multiplier.route.v

place_filler_cells -partition [get_top_partition] -lib_cells {FILLCELL_*}
propagate_power_and_ground_nets
write_verilog -file $dataDir/${design}.power.v.gz -power true -well_connections true


set required_gds [get_lib_cells -of_objects [get_objects -type cell -leaf]]

config_search_path -dir "/home/vlsi/Desktop/lab5/lab5/Lab5_2022/Lab5_2022/lib_data/NangateOpenCellLibrary_PDKv1_3_v2010_12/Back_End/gds" [config_search_path]

foreach x $required_gds {	
    config_stream_lib -common "${x}.gds"
}



# set_stream_layer_map -type layer_default -layer active -gds_map 1:0
# set_stream_layer_map -type layer_default -layer pwell -gds_map 2:0
# set_stream_layer_map -type layer_default -layer nwell -gds_map 3:0
# set_stream_layer_map -type layer_default -layer nimplant -gds_map 4:0

# set_stream_layer_map -type layer_default -layer pimplant -gds_map 5:0
# set_stream_layer_map -type layer_default -layer vtg -gds_map 6:0
# set_stream_layer_map -type layer_default -layer vts -gds_map 7:0
# set_stream_layer_map -type layer_default -layer thkox -gds_map 8:0
# set_stream_layer_map -type layer_default -layer poly -gds_map 9:0
# set_stream_layer_map -type layer_default -layer contact -gds_map 10:0

set_stream_layer_map -type layer_default -layer metal1 -gds_map 11:0
set_stream_layer_map -type layer_default -layer metal2 -gds_map 13:0
set_stream_layer_map -type layer_default -layer metal3 -gds_map 15:0


set_stream_layer_map -type layer_default -layer metal4 -gds_map 17:0

set_stream_layer_map -type layer_default -layer metal5 -gds_map 19:0
set_stream_layer_map -type layer_default -layer metal6 -gds_map 21:0
set_stream_layer_map -type layer_default -layer metal7 -gds_map 23:0
set_stream_layer_map -type layer_default -layer metal8 -gds_map 25:0
set_stream_layer_map -type layer_default -layer metal9 -gds_map 27:0
set_stream_layer_map -type layer_default -layer metal10 -gds_map 29:0

set_stream_layer_map -type layer_default -layer via1 -gds_map 12:0
set_stream_layer_map -type layer_default -layer via2 -gds_map 14:0
set_stream_layer_map -type layer_default -layer via3 -gds_map 16:0
set_stream_layer_map -type layer_default -layer via4 -gds_map 18:0

set_stream_layer_map -type layer_default -layer via5 -gds_map 20:0
set_stream_layer_map -type layer_default -layer via6 -gds_map 22:0
set_stream_layer_map -type layer_default -layer via7 -gds_map 24:0
set_stream_layer_map -type layer_default -layer via8 -gds_map 26:0
set_stream_layer_map -type layer_default -layer via9 -gds_map 28:0

set_stream_layer_map -type pr_boundary -gds_map 100:0

write_stream -file ${MGC_topDesign}.gds 

#propagate_power_and_ground_nets
#write_verilog -file $dataDir/${design}.power.v.gz -power true -well_connections true

