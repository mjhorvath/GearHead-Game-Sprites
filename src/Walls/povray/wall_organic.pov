// Desc: GearHead walls generator
// Auth: Michael Horvath
// Home: http://isometricland.com
// Note: the curvature of the wall may be off when, for example, the South and West directions are set to equal 1. I started a thread in the POV-Ray newsgroup about this, but can't remember if I committed the changes.

#version 3.7

#declare Show_CeilingMask = 0;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Walls_Textures.inc"			// Source of the textures
#include "Walls_Prototypes.inc"			// Source of the object components


// -------------------------------------------------------------
// Definitions for the various wall types

#declare Guts_Texture = texture
{
	pigment
	{
		image_pattern {png "../walls/texture_bowels.png"}
		color_map
		{
			[0 gamma_color_adjust(<255,160,128>/255)]
			[1 gamma_color_adjust(<255,160,128>/255/2)]
		}
	}
	finish {Default_Finish}
	translate x * Height/Width/2
	rotate y * 180
	scale Width	// square texture
}

#declare Guts_Roof_Texture = texture
{
	pigment
	{
		image_pattern {png "../walls/texture_bowels.png"}
		color_map
		{
			[0 gamma_color_adjust(<255,160,128>/255)]
			[1 gamma_color_adjust(<255,160,128>/255/2)]
		}
	}
	finish {Default_Finish}
	translate x * 0.5
	rotate y * 180
	scale Width	// square texture
	scale 2
	rotate x * 090
	translate z * Width/2
}

#macro Wall_TubeGuts(North,East,South,West)
	#local Wall_Texture = texture {Guts_Texture} texture {Grade_Texture};
	#local Mask_Texture = texture {Plain_Red} texture {Grade_Texture};
	#local Roof_Texture = texture {Guts_Roof_Texture} texture {Grade_Texture};
	#local Floor_Texture = texture {Guts_Roof_Texture} texture {Grade_Texture};
	union
	{
		Tube_Wall_Prototype(North,East,South,West)
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Wall_TubeGuts(North,East,South,West)
//	Wall_TubeConcrete(North,East,South,West)
}
