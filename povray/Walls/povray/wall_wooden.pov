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

#declare WoodPlank_Pigment_a = pigment
{
	wood
	color_map
	{
		[0 gamma_color_adjust(<128,64,32>/255)]
		[1 gamma_color_adjust(<128,64,32>/255)]
	}
	warp
	{
		black_hole <rand(Seed), rand(Seed), rand(Seed)>, 0.5
		turbulence 1/100
	}
	warp
	{
		black_hole <rand(Seed), rand(Seed), rand(Seed)>, 0.5
		turbulence 1/100
	}
	warp
	{
		black_hole <rand(Seed), rand(Seed), rand(Seed)>, 0.5
		turbulence 1/100
	}
	scale x * 1/Width/2
	scale z * 1/Width/2
	scale y * Height
	rotate y * 45
}

#declare WoodPlank_Pigment_b = pigment
{
	wood
	color_map
	{
		[0 gamma_color_adjust(<128,64,32>/255/3)]
		[1 gamma_color_adjust(<128,64,32>/255/3)]
	}
	warp
	{
		black_hole <rand(Seed), rand(Seed), rand(Seed)>, 0.5
		turbulence 1/100
	}
	warp
	{
		black_hole <rand(Seed), rand(Seed), rand(Seed)>, 0.5
		turbulence 1/100
	}
	warp
	{
		black_hole <rand(Seed), rand(Seed), rand(Seed)>, 0.5
		turbulence 1/100
	}
	scale x * 1/Width/2
	scale z * 1/Width/2
	scale y * Height
	rotate y * 45
}

#declare WoodPlank_Texture_b = texture
{
	#local board_length = 1;
	#local board_width = 1/6;
	pigment
	{
		cells
		pigment_map
		{
			[0/2 WoodPlank_Pigment_a]
			[2/2 WoodPlank_Pigment_b]
		}
		scale <board_width,board_length,board_width,>

//		warp
//		{
//			turbulence 1/200
//		}
		warp
		{
			repeat z * board_width
			offset y * board_length / 4 * 7
		}
		warp
		{
			repeat x * board_width
			offset y * board_length / 4 * 7
		}
		warp
		{
			repeat y * board_length * 2
		}

	}
	finish {Default_Finish}
/*
	normal
	{
		cells
		slope_map
		{
			[0    <0,1>]
//			[1/16 <0,0>]
//			[1/16 <1/2,0>]
//			[1/2  <1/2,0>]
			[1    <1,1>]
		}
		bump_size 1
		scale <board_width,board_length,board_width,>

//		warp
//		{
//			turbulence 1/200
//		}
		warp
		{
			repeat z * board_width
			offset y * board_length / 4 * 7
		}
		warp
		{
			repeat x * board_width
			offset y * board_length / 4 * 7
		}

	}
*/
	scale <Width,Height,Width,>
}

#macro Wall_FlatShack(North,East,South,West)
	#local AlignY = 0;
	#local BotThick = 1/4;
	#local TopThick = 1/1;
	#local Wall_Texture = texture {WoodPlank_Texture_b} texture {Grade_Texture};
	#local Mask_Texture = texture {Plain_Black} texture {Grade_Texture};
	#local Floor_Texture = texture {Plain_Black} texture {Grade_Texture};
	#local Roof_Texture = texture {Plain_Black} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		#switch (frame_number)
			#range ( 0,15)	Flat_Wall_Prototype(North,East,South,West)	#break
			#range (16,17)	object {Badge_Deco_Object()	rotate y * Deco_Rotate}	Flat_Wall_Prototype(North,East,South,West)	#break
			#range (18,19)	object {Gear_Deco_Object()	rotate y * Deco_Rotate}	Flat_Wall_Prototype(North,East,South,West)	#break
			#range (20,21)	object {Dollar_Deco_Object()	rotate y * Deco_Rotate}	Flat_Wall_Prototype(North,East,South,West)	#break
			#range (22,23)	object {RedCross_Deco_Object()	rotate y * Deco_Rotate}	Flat_Wall_Prototype(North,East,South,West)	#break
			#range (24,25)	object {Window_Deco_Object_a()	rotate y * Deco_Rotate}	difference {Flat_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
			#range (26,27)	object {Window_Deco_Object_b()	rotate y * Deco_Rotate}	difference {Flat_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
		#end
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Wall_FlatShack(North,East,South,West)
}
