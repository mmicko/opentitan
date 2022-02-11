all: lowrisc_systems_top_earlgrey_0.1

lowrisc_systems_top_earlgrey_0.1: lowrisc_systems_top_earlgrey_0.1.scr
	yosys -p 'verific -set-warning VERI-1348; verific -f -sv lowrisc_systems_top_earlgrey_0.1.scr; hierarchy -top top_earlgrey; stat'

