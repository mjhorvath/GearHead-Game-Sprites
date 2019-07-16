// CITY GENERATOR INCLUDE FILE: File output using FileCity.mcr

	#ifndef (city_default_objects) #include "DEFAULT.OBJ"  #include "VEHICLES.OBJ"  #include "HOTELS.OBJ"  #include "FLATS.OBJ"  #include "OFFICES.OBJ" #end

	plane {y, 0 hollow clipped_by {box {<-36,-0.1,-36> ,<36,0.1,36> }} texture {street_texture}}
	box {<-36,0,-36> ,<36,0.001,-36>  texture {street_overlay scale 0 translate <-36,0,-36> } rotate <-0,-0,-0> }
	box {<-36,0,36> ,<36,0.002,36>  texture {street_overlay scale 0 translate <-36,0,36> } rotate <-0,-90,-0> }
	box {<-36,0,-36> ,<36,0.15,36>  texture {pavement_texture}}
	union {
	object {building_profile[2] scale <1,1,1> }
	object {building_base[2]}
	object {building_windows[2] texture {building_window_texture[2] translate <-750,2300,-0> } translate <0,0,0> }
	object {building_roof[2] translate <0,50,0> }
	rotate <-0,-270,-0>  scale <0.32,0.32,0.32>  translate <0,0.15,0> 
	texture {building_texture[2] scale <0.32,0.32,0.32> }
	}

