# 1) create CTS specs for group of non-communicating clocks cts_group_0: vsysclk_new_mode
#    spec for clock defined on single source pin
create_cts_spec -name cts_vsysclk_new_mode \
  -balance_roots false \
  -root_pins [get_pins -of [get_clocks  vsysclk_new_mode  ]]

# 2) final check & compile cts
check_cts_constraints -write_repair scr/cts_repair_11843_1672812512.tcl -cts_spec { cts_vsysclk_new_mode }
read_constraints -context scr/cts_repair_11843_1672812512.tcl
compile_cts -cts_spec { cts_vsysclk_new_mode }

# Cleanup temporary exclude/explicit leaf pins / dont_modify specs

remove_timing -type context
