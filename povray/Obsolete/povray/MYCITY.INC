// CITY GENERATOR INCLUDE FILE: File output using FileCity.mcr

	#ifndef (city_default_objects) #include "DEFAULT.OBJ"  #include "VEHICLES.OBJ"  #include "HOTELS.OBJ"  #include "FLATS.OBJ"  #include "OFFICES.OBJ" #end

	plane {y, 0 hollow clipped_by {box {<-70,-0.1,-70> ,<70,0.1,70> }} texture {street_texture}}
	box {<-70,0,-70> ,<70,0.001,-70>  texture {street_overlay scale 0 translate <-70,0,-70> } rotate <-0,-0,-0> }
	box {<-70,0,70> ,<70,0.002,70>  texture {street_overlay scale 0 translate <-70,0,70> } rotate <-0,-90,-0> }
	box {<-70,0,-70> ,<70,0.15,70>  texture {pavement_texture}}
	union {
	object {building_details[4] translate <0,0,0> }
	object {building_details[4] translate <0,2,0> }
	object {building_details[4] translate <0,4,0> }
	object {building_windows[4] scale <1,3,1>  texture {building_window_texture[4] translate <2,138,-28> }}
	object {building_roof[4] translate <0,6,0> }
	rotate <-0,-0,-0>  scale <6.4,6.4,6.4>  translate <-34,0.15,-34> 
	texture {building_texture[4] scale <6.4,6.4,6.4> }
	}

	union {
	object {building_profile[5] scale <1,2,1> }
	object {building_details[5] translate <0,0,0> }
	object {building_details[5] translate <0,0.5,0> }
	object {building_windows[5] scale <1,2,1>  texture {building_window_texture[5] translate <8.75,19.5,-1.75> }}
	object {building_roof[5] translate <0,1,0> }
	rotate <-0,-270,-0>  scale <32,32,32>  translate <-34,0.15,34> 
	texture {building_texture[5] scale <32,32,32> }
	}

	union {
	object {building_profile[2] scale <1,2,1> }
	object {building_base[2]}
	object {building_details[2] translate <0,50,0> }
	object {building_windows[2] texture {building_window_texture[2] translate <-345,4400,-0> } translate <0,0,0> }
	object {building_windows[2] texture {building_window_texture[2] translate <-120,3900,-0> } translate <0,50,0> }
	object {building_roof[2] translate <0,100,0> }
	rotate <-0,-90,-0>  scale <0.32,0.32,0.32>  translate <34,0.15,-34> 
	texture {building_texture[2] scale <0.32,0.32,0.32> }
	}

	union {
	object {building_profile[5] scale <1,2,1> }
	object {building_details[5] translate <0,0,0> }
	object {building_details[5] translate <0,0.5,0> }
	object {building_windows[5] scale <1,2,1>  texture {building_window_texture[5] translate <4,22.5,7.5> }}
	object {building_roof[5] translate <0,1,0> }
	rotate <-0,-180,-0>  scale <32,32,32>  translate <34,0.15,34> 
	texture {building_texture[5] scale <32,32,32> }
	}

