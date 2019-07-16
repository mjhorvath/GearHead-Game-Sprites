#declare Sprite_Height = 128;
#declare Width = 64;
#declare Height = 16;
#declare Use_Isometric = 1;
#declare Effect_Scale = 1/150;
#declare Use_Radiosity = 0;
#declare Use_Shadows = 0;
#declare Diffuse_Factor = 1;
#declare Ambient_Factor = 1;

#include "GearHead.inc"

//background {color rgb 1}
global_settings {max_trace_level 100}



// this is a hack to turn off the camera in LNSEFCTS.INC. comment it out to turn it back on.
#declare camera_off = true;

// LENS EFFECTS: STREAK COMPONENTS
// *******************************
// This scene illustrates the 8 different types of streaks included
// with the Lens Effects Include File.  These are numbered from
// left to right, starting at the top-left corner, ie:
//
//     1   2   3   4
//     5   6   7   8
//
// Note that the streaks have been scaled to 30% of normal size to
// fit them all in one image.

// CAMERA AND EFFECT OPTIONS

#declare camera_location = Camera_Location;
#declare camera_look_at = Camera_LookAt;
#declare effect_location = <0,Height,0,>;
#declare effect_always_on_top = 0;
//#declare camera_location = vaxis_rotate(<Width,Height,0,>, y, Rotate_Y);
//#declare camera_look_at = vaxis_rotate(<0,Height,0,>, y, Rotate_Y);
//#declare effect_location = vaxis_rotate(<0,Height,0,>, y, Rotate_Y);
//#declare effect_always_on_top = false;
//#declare effect_scale = clock * Width;
//#declare effect_intensity = 1 - 3*clock/4;
//#declare effect_brightness = 2;
#declare effect_type = "Camera2";

#declare Cut_Off = 1;
#switch (clock)
	#range (0, Cut_Off)
		#declare effect_scale = clock * Effect_Scale + 0.0000000000001;
	#break
	#range (Cut_Off, 1)
		#declare Clock_Reverse = (1 - ((clock - Cut_Off) * 1/(1 - Cut_Off))) * Cut_Off;
		#declare effect_scale = Clock_Reverse * Effect_Scale;
	#break
#end
PrintValue("clock_delta = ", clock_delta)
PrintValue("clock = ", clock)

#include "LENS.INC"	// LENS EFFECTS INCLUDE FILE Created by Chris Colefax
   