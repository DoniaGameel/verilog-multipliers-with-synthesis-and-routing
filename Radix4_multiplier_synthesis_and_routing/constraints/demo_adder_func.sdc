
######################################################################
# 
#  ------------------------------------------------------------------
#   Design    : demo_Adder
#  ------------------------------------------------------------------
#     SDC timing constraint file
#  ------------------------------------------------------------------
#


set pad_load            10  
set transition          0.1
set io_clock_period     6
set pad_delay           0.01


create_clock -name vsysclk -period ${io_clock_period} [ get_ports clk ]

#set_false_path   -from [ get_ports reset_n ]

set_load                ${pad_load}   [ all_outputs ]
set_input_transition    ${transition} [ all_inputs ]
set_input_delay -clock  vsysclk -rise 0.2 [all_inputs]

set_output_delay -clock  vsysclk  -fall 0.5 [all_outputs]
 #   [ expr 0.3 * ${io_clock_period} ] [ all_outputs ] 
 #   [ remove_from_collection [ all_outputs ] [ get_ports { usb_plus usb_minus }] ]












