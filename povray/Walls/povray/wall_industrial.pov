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

#declare Anodized_Metal_Texture = texture
{
	pigment {gamma_color_adjust(<1/2,1/2,1/2>)}
	finish {Phong_Dull}
	normal
	{
		facets
		coords 1/8
		scale Width/4
	}
}

#macro Wall_Fence_c(North,East,South,West)
	#local AlignY = 0;			// should textures be rotated to match the wall face's normal?
	#local Wall_Texture = texture {Plain_Green} texture {Grade_Texture};
	#local Mask_Texture = texture {Plain_Green} texture {Grade_Texture};
	#local Roof_Texture = texture {Plain_Green} texture {Grade_Texture};
	#local Floor_Texture = texture {Plain_Green} texture {Grade_Texture};
	#local Sheet_Texture = texture {Anodized_Metal_Texture} texture {Grade_Texture};
	#local Post_Texture = texture {Anodized_Metal_Texture} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/6)
		#end
		Corrugated_Wall_Prototype_a(North,East,South,West)
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Wall_Fence_c(North,East,South,West)
}
