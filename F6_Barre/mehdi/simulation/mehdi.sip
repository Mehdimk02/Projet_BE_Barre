set_global_assignment -entity "mehdi" -library "lib_mehdi" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "mehdi" -library "lib_mehdi" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "mehdi" -library "lib_mehdi" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_mehdi" -name SPD_FILE [file join $::quartus(sip_path) "../mehdi.spd"]
set_global_assignment -library "lib_mehdi" -name MISC_FILE [file join $::quartus(sip_path) "../../mehdi.qsys"]

set_global_assignment -library "lib_mehdi" -name MISC_FILE [file join $::quartus(sip_path) "mehdi.vhd"]
