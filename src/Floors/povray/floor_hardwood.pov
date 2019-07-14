// Desc: GearHead floors generator
// Auth: Michael Horvath
// Home: http://isometricland.net

#version 3.7;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Floors_Textures.inc"			// Source of the textures
#include "Floors_Prototypes.inc"		// Source of the object components


// -------------------------------------------------------------
// Definitions for the various floor types

#declare Hardwood_Texture_a = texture
{
	#local board_length = 1/2;
	#local board_width = 1/8;
	pigment
	{
		cells
		color_map
		{
			[0   gamma_color_adjust(<1/2,1/4,0>/2)]
			[1   gamma_color_adjust(<1/2,1/4,0>/4)]
		}
		scale x * board_width
		scale z * board_length
		warp
		{
			repeat z * board_length * 2
		}
		warp
		{
			repeat x * board_width
			offset <0,1,board_length/2,>
		}
	}
	finish {Default_Finish}
	normal
	{
		cells
		slope_map
		{
			[0   <1,0>]
//			[1/4 <0,0>]
//			[1/8 <1/2,0>]
//			[1/2 <1/2,0>]
			[1   <0,0>]
		}
		bump_size 1/1
		scale x * board_width
		scale z * board_length
		warp
		{
			repeat z * board_length
		}
		warp
		{
			repeat x * board_width
			offset z * board_length / 2
		}
	}
	translate x * frame_number
	scale Width
}

#macro Floor_Flat_Hardwood_a()
	union
	{
		Basic_Floor
		texture {Hardwood_Texture_a}
//		texture {Grade_Texture}
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the floor types by uncommenting the corresponding line


object
{
	Floor_Flat_Hardwood_a()
}
