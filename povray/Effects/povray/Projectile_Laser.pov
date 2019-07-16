#declare Sprite_Height = 128;
#declare Ambient_Factor = 1;
#declare Width = 64;
#declare Height = 16;
#declare Rotate_Y = clock * 360 - 45;
#declare Burst = 0;
#if ((frame_number = 4) | (frame_number = 12))
	#declare Hack = 1;		// hack to get the effect to show up when it is parallel with the camera
#else
	#declare Hack = 0;		// hack to get the effect to show up when it is parallel with the camera
#end
#declare Use_Radiosity = 0;
#declare Use_Isometric = 1;
#declare Use_Shadows = 1;

#include "GearHead.inc"

   global_settings {max_trace_level 10}

   // this is a hack to turn off the camera in LNSEFCTS.INC. comment it out to turn the normal camera back on.
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

   #declare camera_location = vaxis_rotate(<Width,Height,0,>, y, Rotate_Y);
   #declare camera_look_at = vaxis_rotate(<0,Height,0,>, y, Rotate_Y);
   #declare effect_location = vaxis_rotate(<0,Height,0,>, y, Rotate_Y);
   #declare effect_colour = <0,4/4,0,>;
   #declare effect_always_on_top = false;
   #declare effect_scale = 1/2;
   #declare effect_intensity = 4;
   #declare streak_type = 7;
   #if (Hack = true)
      #declare camera_location = <Width,Height,0,>;
      #declare camera_sky = <1,0,-1,>;
   #end

   #include "LNSEFCTS.INC"	// LENS EFFECTS INCLUDE FILE Created by Chris Colefax
#if (Burst = true)
   #declare camera_location = vaxis_rotate(<Width+Width/4,Height,0,>, y, Rotate_Y);
   #declare camera_look_at = vaxis_rotate(<Width/4,Height,0,>, y, Rotate_Y);
   #declare effect_location = vaxis_rotate(<Width/4,Height,0,>, y, Rotate_Y);
   #declare effect_colour = <0,4/4,0,>;
   #declare effect_always_on_top = false;
   #declare effect_scale = 1/2;
   #declare effect_intensity = 4;
   #declare streak_type = 7;
   #if (Hack = true)
      #declare camera_location = <Width,Height,0,>;
      #declare camera_sky = <1,0,-1,>;
   #end

   #include "LNSEFCTS.INC"

   #declare camera_location = vaxis_rotate(<-Width-Width/4,Height,0,>, y, Rotate_Y);
   #declare camera_look_at = vaxis_rotate(<-Width/4,Height,0,>, y, Rotate_Y);
   #declare effect_location = vaxis_rotate(<-Width/4,Height,0,>, y, Rotate_Y);
   #declare effect_colour = <0,4/4,0,>;
   #declare effect_always_on_top = false;
   #declare effect_scale = 1/2;
   #declare effect_intensity = 4;
   #declare streak_type = 7;
   #if (Hack = true)
      #declare camera_location = <Width,Height,0,>;
      #declare camera_sky = <1,0,-1,>;
   #end

   #include "LNSEFCTS.INC"
#end
