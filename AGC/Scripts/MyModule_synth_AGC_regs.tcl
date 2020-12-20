## Setup technology files
include ../Scripts/X-FAB_typ_AGC.tcl
## Setup variables
set DESIGN AGC
set PARAMS {}
## Read in Verilog HDL files
# Top module
read_hdl -v2001 ../Source/AGC.v
#Instatiated modules
read_hdl -v2001 ../Source/EXP_APPROX_CHEBYSHEV.v
read_hdl -v2001 ../Source/AGC_regs/EXPONENTIAL_AVERAGING_FILTER.v
read_hdl -v2001 ../Source/LN_X_MNK_0_001_to_5000.v
## Compile our code (create a technology-independent schematic)
elaborate -parameters $PARAMS $DESIGN
## Setup design constraints
read_sdc ../Source/AGC.sdc
## Synthesize our schematic (create a technology-dependent schematic)
#synthesize -to_generic
synthesize -to_mapped
synthesize -incremental
## Write out area and timing reports
report area > ../Reports/Synthesis/TYP_CORNER/Top_synth_area_report_AGC
report timing > ../Reports/Synthesis/TYP_CORNER/Top_synth_timing_report_AGC
## Write out synthesized Verilog netlist
write_hdl -mapped > ../Outputs/Synthesis/TYP_CORNER/AGC_Top_synth.v
## Write out the SDC file we will take into the place n route tool
write_sdc > ../Outputs/Synthesis/TYP_CORNER/AGC_Top_out.sdc
gui_show

