// Desc: GearHead walls generator
// Auth: Michael Horvath
// Home: http://isometricland.com

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
			[0/4 gamma_color_adjust(<1,1,1>)]
			[3/4 gamma_color_adjust(<1,1,1>)]
			[4/4 gamma_color_adjust(<1/4,1/4,1/4>)]
		}
		scale 4
	}
	normal {wrinkles scale 4}
	finish {Default_Finish}
	no_bump_scale
}

#macro RedCross_Deco_Object()
	#local RedCross_Texture = texture {Plain_Red} texture {Grade_Texture};
	union
	{
		box
		{
			-1,+1
			scale <Width/4,Width/3,Width/8>
		}
		box
		{
			-1,+1
			scale <Width/4,Width/8,Width/3>
		}
		translate y * Height/2
		texture {RedCross_Texture}
	}
#end

// used for hospitals
#macro Wall_Brick_b(North,East,South,West)
	#local AlignY = 0;			// should textures be rotated to match the wall face's normal?
	#local BotThick = 1/4;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
	#local TopThick = 1;			// the thickness of the wall top as a factor of the wall top (should always be 1 when using brick walls)
	#local Rows = 6;			// the wall is composed of this many rows of bricks
	#local Cols = 2;			// the wall is composed of this many colums of bricks
	#local MortarWidth = 4;			// the width of the mortar between bricks
	#local MortarDepth = 1/2;		// the depth of the mortar between bricks
	#local TopRow_Skip = 1;			// this many rows of bricks separate the window from the top of the wall
	#local BotRow_Skip = 1;			// this many rows of bricks separate the window from the bottom of the wall	
	#local Column_Skip = 1;			// this many columns of bricks separate the window from the sides of the wall
	#local Brick_Wall_Prototype_Texture = texture {Wrinkle_Texture_a} texture {Grade_Texture};
	#local Mortar_Texture = texture {Wrinkle_Texture_a} texture {Grade_Texture};
	#local Roof_Mask_Texture = texture {Plain_Black} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		Brick_Wall_Prototype(North,East,South,West)
		#if (frame_number = 5)
			object {RedCross_Deco_Object()	rotate y * 000}
		#end
		#if (frame_number = 10)
			object {RedCross_Deco_Object()	rotate y * 090}
		#end
	}
#end

// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Wall_Brick_b(North,East,South,West)
}
