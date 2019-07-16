// Desc: GearHead floors generator
// Auth: Michael Horvath
// Home: http://isometricland.net

#version 3.7;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Floors_Textures.inc"			// Source of the textures
#include "Floors_Prototypes.inc"		// Source of the object components


// -------------------------------------------------------------
// Definitions for the various floor types

#declare Guts_Texture = texture
{
	pigment
	{
		image_pattern {png "texture_bowels.png"}
		color_map
		{
			[0 gamma_color_adjust(<255,160,128>/255)]
			[1 gamma_color_adjust(<255,160,128>/255/2)]
		}
	}
	finish {Default_Finish}
	rotate x * 90
	translate <-1/2,0,-1/2>
	scale Width	// square texture
}

#macro Floor_Flat_Guts()
	union
	{
		Basic_Floor
		texture {Guts_Texture}
//		texture {Grade_Texture}
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the floor types by uncommenting the corresponding line


object
{
	Floor_Flat_Guts()
}
