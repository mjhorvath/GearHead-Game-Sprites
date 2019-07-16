// Desc: GearHead walls generator
// Auth: Michael Horvath
// Home: http://isometricland.net

#version 3.7

#declare Show_CeilingMask = 0;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Walls_Textures.inc"			// Source of the textures
#include "Walls_Prototypes.inc"			// Source of the object components


// -------------------------------------------------------------
// Definitions for the various wall types

#declare StoneBlock_Texture_c = texture
{
	pigment
	{
		crackle
		color_map
		{
			[1/16 gamma_color_adjust(<4/16,4/16,4/16>)]
			[9/16 gamma_color_adjust(<12/16,12/16,12/16>)]
		}
		warp { turbulence <1,1,1>/4 octaves 3 lambda 1.5 omega 0.3 }
		noise_generator 3
		scale Width/8
	}
	finish {Default_Finish}
	normal
	{
		// pattern for use in texture/pigment/normal/density
		crackle   8      // crackled pattern
		warp { turbulence <1,1,1>/4 octaves 3 lambda 1.5 omega 0.3 }
		noise_generator 3
		scale Width/8
	}
	no_bump_scale
}

#macro Wall_FlatStone_a(North,East,South,West)
	#local AlignY = 1;
	#local BotThick = 1/2;
	#local TopThick = 1/2;
	#local Wall_Texture = texture {StoneBlock_Texture_c} texture {Grade_Texture};
	#local Mask_Texture = texture {StoneBlock_Texture_c} texture {Grade_Texture};
	#local Roof_Texture = texture {Plain_Black} texture {Grade_Texture};
	#local Floor_Texture = texture {Plain_Black} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/4)
		#end
		Flat_Wall_Prototype(North,East,South,West)
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Wall_FlatStone_a(North,East,South,West)
}
