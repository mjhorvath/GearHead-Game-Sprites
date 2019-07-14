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

#macro Wall_IsoCrackle_b(North,East,South,West)
	#local BotThick = 1/4;
	#local TopThick = 1/1;		// not used
	#local MakeCracklePigment = IsoCrackle_Pigment_b;
	#local Wall_Texture = texture {Plain_Beige} texture {Grade_Texture};
	#local Mask_Texture = texture {Plain_Black} texture {Grade_Texture};
	union
	{
//		#if (Show_CeilingMask = 1)
//			Fake_Roof(North,East,South,West,Width/3)
//		#end
		Crackle_Wall_Prototype(North,East,South,West)
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Wall_IsoCrackle_b(North,East,South,West)
}
