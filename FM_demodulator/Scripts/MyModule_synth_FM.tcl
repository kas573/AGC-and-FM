## Setup technology files
include ../Scripts/X-FAB_typ_FM.tcl
## Setup variables
set DESIGN FM_demodulator
set PARAMS {}
## Read in Verilog HDL files
# Top module
read_hdl -v2001 ../Source/FM_demodulator.v
#Instatiated modules
## Compile our code (create a technology-independent schematic)
elaborate -parameters $PARAMS $DESIGN
## Setup design constraints
read_sdc ../Source/FM.sdc
## Synthesize our schematic (create a technology-dependent schematic)
#synthesize -to_generic
synthesize -to_mapped
synthesize -incremental
## Write out area and timing reports
report area > ../Reports/Synthesis/TYP_CORNER/Top_synth_area_report_FM
report timing > ../Reports/Synthesis/TYP_CORNER/Top_synth_timing_report_FM
## Write out synthesized Verilog netlist
write_hdl -mapped > ../Outputs/Synthesis/TYP_CORNER/FM_Top_synth.v
## Write out the SDC file we will take into the place n route tool
write_sdc > ../Outputs/Synthesis/TYP_CORNER/FM_Top_out.sdc
gui_show
