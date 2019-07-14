#version 3.7

#declare Show_CeilingMask = 0;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Walls_Textures.inc"			// Source of the textures
#include "Walls_Prototypes.inc"			// Source of the object components


// -------------------------------------------------------------
// Definitions for the various wall types

#macro BrickWall_Texture_a()
	#local board_length = 1/Cols;
	#local board_height = 1/Rows;
	texture
	{
		pigment
		{
			cells
			color_map
			{
				[0 gamma_color_adjust(<1,1/2,0>)]
				[1 gamma_color_adjust(<1,1/2,0>/2)]
			}
			scale <board_length,board_height,board_length,>
			warp
			{
				repeat x * board_length * 2
			}
			warp
			{
				repeat z * board_length * 2
			}
			warp
			{
				repeat y * board_height
				offset <board_length/2,2,board_length/2,>
			}
		}
		finish {Default_Finish}
		no_bump_scale
		scale <Width,Height,Width,>
	}
#end

// used for prisons
#macro Wall_Brick_c(North,East,South,West)
	#local AlignY = 0;			// should textures be rotated to match the wall face's normal?
	#local AddWindow = false;		// should windows be inserted into long walls?
	#local BotThick = 1/4;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
	#local TopThick = 1;			// the thickness of the wall top as a factor of the wall top (should always be 1 when using brick walls)
	#local Rows = 8;			// the wall is composed of this may rows of bricks
	#local Cols = 4;			// the wall is composed of this many colums of bricks
	#local MortarWidth = 2;			// the width of the mortar between bricks
	#local MortarDepth = 1/2;		// the depth of the mortar between bricks
	#local Brick_Wall_Prototype_Texture = BrickWall_Texture_a() texture {Grade_Texture};
	#local Mortar_Texture = texture {Plain_Gray} texture {Grade_Texture};
	#local Roof_Mask_Texture = texture {Plain_Black} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		Brick_Wall_Prototype(North,East,South,West)
	}
#end

// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Wall_Brick_c(North,East,South,West)
}
