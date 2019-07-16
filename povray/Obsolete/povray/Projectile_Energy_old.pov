#declare Sprite_Height = 128;
#declare Ambient_Factor = 1;
#declare Use_Radiosity = 0;
#declare Use_Isometric = 1;
#declare Use_Shadows = 1;
#declare Width = 64;
#declare Height = 16;
#declare Rotate_Y = clock * 360 - 45;
#declare Burst = 1;

#include "GearHead.inc"

   global_settings {max_trace_level 10}

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

//   #declare camera_location = Camera_Location;
//   #declare camera_look_at = Camera_LookAt;
//   #declare effect_location = <0,Height,0,>;
//   #declare camera_sky = vcross(vcross(camera_location-camera_look_at, Camera_Location),Camera_Location);
   #declare camera_location = vaxis_rotate(<0,Height,0,>, y, Rotate_Y);
   #declare camera_look_at = vaxis_rotate(<0,Height,0,>, y, Rotate_Y);
   #declare effect_location = vaxis_rotate(<0,Height,0,>, y, Rotate_Y);
   #declare camera_sky = y;
   #declare effect_colour = <.9, 1, 1.1>;
   #declare source_color = <1.1, 1.2, 1.3>;
   #declare effect_scale = Width*Width;		// 10000	// Width
   #declare effect_spin = 1;
//   #declare effect_flicker = 1;
//   #declare effect_intensity = 2;
//   #declare effect_brightness = 1;
   #declare streak_type = 3;

   #include "LNSEFCTS.INC"	// LENS EFFECTS INCLUDE FILE Created by Chris Colefax

#if (Burst = true)
//   #declare camera_location = Camera_Location;
//   #declare camera_look_at = Camera_LookAt;
//   #declare effect_location = <0,Height,0,>;
//   #declare camera_sky = vcross(vcross(camera_location-camera_look_at, Camera_Location),Camera_Location);
   #declare camera_location = vaxis_rotate(<Width/4,Height,0,>, y, Rotate_Y);
   #declare camera_look_at = vaxis_rotate(<Width/4,Height,0,>, y, Rotate_Y);
   #declare effect_location = vaxis_rotate(<Width/4,Height,0,>, y, Rotate_Y);
   #declare camera_sky = y;
   #declare effect_colour = <.9, 1, 1.1>;
   #declare source_color = <1.1, 1.2, 1.3>;
   #declare effect_scale = Width*Width;		// 10000	// Width
   #declare effect_spin = 1;
//   #declare effect_flicker = 1;
//   #declare effect_intensity = 2;
//   #declare effect_brightness = 1;
   #declare streak_type = 3;

   #include "LNSEFCTS.INC"

//   #declare camera_location = Camera_Location;
//   #declare camera_look_at = Camera_LookAt;
//   #declare effect_location = <0,Height,0,>;
//   #declare camera_sky = vcross(vcross(camera_location-camera_look_at, Camera_Location),Camera_Location);
   #declare camera_location = vaxis_rotate(<-Width/4,Height,0,>, y, Rotate_Y);
   #declare camera_look_at = vaxis_rotate(<-Width/4,Height,0,>, y, Rotate_Y);
   #declare effect_location = vaxis_rotate(<-Width/4,Height,0,>, y, Rotate_Y);
   #declare camera_sky = y;
   #declare effect_colour = <.9, 1, 1.1>;
   #declare source_color = <1.1, 1.2, 1.3>;
   #declare effect_scale = Width*Width;		// 10000	// Width
   #declare effect_spin = 1;
//   #declare effect_flicker = 1;
//   #declare effect_intensity = 2;
//   #declare effect_brightness = 1;
   #declare streak_type = 3;

   #include "LNSEFCTS.INC"
#end