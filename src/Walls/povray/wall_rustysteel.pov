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

#declare Wrinkle_Texture_a = texture
{
	pigment
	{
		wrinkles
		color_map
		{
			[0/4 gamma_color_adjust(<1/2,1/2,1/2>)]
			[3/4 gamma_color_adjust(<1/2,1/2,1/2>)]
			[4/4 gamma_color_adjust(<3/4,1/2,1/4>)]
		}
		scale 4
	}
	normal {wrinkles scale 4}
	finish {Default_Finish}
	no_bump_scale
}

#macro Wall_FlatConcrete(North,East,South,West)
	#local AlignY = 0;			// should textures be rotated to match the wall face's normal?
	#local BotThick = 1/4;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
	#local TopThick = 1/1;			// the thickness of the wall top as a factor of the wall bottom (should always be 1 when using brick walls)
	#local Wall_Texture = texture {Wrinkle_Texture_a} texture {Grade_Texture};
	#local Mask_Texture = texture {Wrinkle_Texture_a} texture {Grade_Texture};
	#local Floor_Texture = texture {Wrinkle_Texture_a} texture {Grade_Texture};
	#local Roof_Texture = texture {Plain_Black} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		#if (frame_number = 5)
			object {Window_Deco_Object_b()	rotate y * 000}
			difference {Flat_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}
		#elseif (frame_number = 10)
			object {Window_Deco_Object_b()	rotate y * 090}
			difference {Flat_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}
		#else
			Flat_Wall_Prototype(North,East,South,West)
		#end
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Wall_FlatConcrete(North,East,South,West)
}
