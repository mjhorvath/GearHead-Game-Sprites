// Desc: GearHead walls generator
// Auth: Michael Horvath
// Home: http://isometricland.net

#version 3.7

//#declare Height = 80;
//#declare Width = 64;
//#declare Show_GridMarker = 1;
//#declare Show_BasicFloor = 1;
//#declare Show_AxisMarker = 0;
#declare Show_CeilingMask = 0;
//#declare Blue_Background = 1;
//#declare Camera_Mode = 2;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Walls_Textures.inc"			// Source of the textures
#include "Walls_Prototypes.inc"			// Source of the object components

#if (frame_number > 15)
	#local frame_mod = mod(frame_number,2);
	#if (frame_mod = 1)
		#declare North = 1;
		#declare East  = 0;
		#declare South = 1;
		#declare West  = 0;
		#declare Deco_Rotate = 0;
	#else
		#declare North = 0;
		#declare East  = 1;
		#declare South = 0;
		#declare West  = 1;
		#declare Deco_Rotate = 90;
	#end
#end

// -------------------------------------------------------------
// Definitions for the various wall types

#macro Wall_FlatStone_a(North,East,South,West)
	#local AlignY = 1;
	#local BotThick = 1/2;
	#local TopThick = 1/2;
	#local Wall_Texture = texture {StoneBlock_Texture_c} texture {Grade_Texture};
	#local Mask_Texture = texture {StoneBlock_Texture_c} texture {Grade_Texture};
	#local Roof_Texture = texture {StoneBlock_Texture_c} texture {Grade_Texture};
	#local Floor_Texture = texture {StoneBlock_Texture_c} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/4)
		#end
		#switch (frame_number)
			#range ( 0,15)	Flat_Wall_Prototype(North,East,South,West)	#break
		#end
	}
#end

#macro Wall_FlatStone_b(North,East,South,West)
	#local AlignY = 1;
	#local BotThick = 1/2;
	#local TopThick = 1/2;
	#local Wall_Texture = texture {StoneBlock_Texture_d} texture {Grade_Texture};
	#local Mask_Texture = texture {StoneBlock_Texture_d} texture {Grade_Texture};
	#local Floor_Texture = texture {StoneBlock_Texture_d} texture {Grade_Texture};
	#local Roof_Texture = texture {StoneBlock_Texture_d} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		#switch (frame_number)
			#range ( 0,15)	Flat_Wall_Prototype(North,East,South,West)	#break
		#end
	}
#end

#macro Wall_FlatShack(North,East,South,West)
	#local AlignY = 0;
	#local BotThick = 1/3;
	#local TopThick = 1/1;
	#local Wall_Texture = texture {WoodPlank_Texture_b} texture {Grade_Texture};
	#local Mask_Texture = texture {Plain_Red} texture {Grade_Texture};
	#local Floor_Texture = texture {Plain_Red} texture {Grade_Texture};
	#local Roof_Texture = texture {Plain_Red} texture {Grade_Texture};
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

#macro Wall_FlatConcrete(North,East,South,West)
	#local AlignY = 0;			// should textures be rotated to match the wall face's normal?
	#local BotThick = 1/3;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
	#local TopThick = 1/1;			// the thickness of the wall top as a factor of the wall bottom (should always be 1 when using brick walls)
	#local Wall_Texture = texture {Wrinkle_Texture_a} texture {Grade_Texture};
	#local Mask_Texture = texture {Wrinkle_Texture_a} texture {Grade_Texture};
	#local Floor_Texture = texture {Wrinkle_Texture_a} texture {Grade_Texture};
	#local Roof_Texture = texture {Wrinkle_Texture_a} texture {Grade_Texture};
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

// low res bump map
#macro Wall_FlatTechy_a(North,East,South,West)
	#local AlignY = 1;			// should textures be rotated to match the wall face's normal?
	#local BotThick = 1/3;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
	#local TopThick = 1/1;			// the thickness of the wall top as a factor of the wall bottom (should always be 1 when using brick walls)
	#local Wall_Texture = texture {Techy_Texture_a} texture {Grade_Texture};
	#local Mask_Texture = texture {Techy_Texture_a} texture {Grade_Texture};
	#local Floor_Texture = texture {Plain_Black} texture {Grade_Texture};
	#local Roof_Texture =texture {Techy_Roof_Texture_a} texture {Grade_Texture};
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

// low res bump map
#macro Wall_FlatTechy_b(North,East,South,West)
	#local AlignY = 1;			// should textures be rotated to match the wall face's normal?
	#local BotThick = 1/3;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
	#local TopThick = 1/1;			// the thickness of the wall top as a factor of the wall bottom (should always be 1 when using brick walls)
	#local Wall_Texture = texture {Techy_Texture_b} texture {Grade_Texture};
	#local Mask_Texture = texture {Techy_Texture_b} texture {Grade_Texture};
	#local Floor_Texture = texture {Plain_Black} texture {Grade_Texture};
	#local Roof_Texture = texture {Techy_Roof_Texture_b} texture {Grade_Texture};
	#local is_frame = 0;
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

#macro Wall_FlatSteel(North,East,South,West)
	#local AlignY = 1;			// should textures be rotated to match the wall face's normal?
	#local BotThick = 1/3;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
	#local TopThick = 1/1;			// the thickness of the wall top as a factor of the wall bottom (should always be 1 when using brick walls)
	#local Wall_Texture = texture {Wrinkle_Texture_b} texture {Grade_Texture};
	#local Mask_Texture = texture {Wrinkle_Texture_b} texture {Grade_Texture};
	#local Floor_Texture = texture {Plain_Black} texture {Grade_Texture};
	#local Roof_Texture = texture {Wrinkle_Texture_b} texture {Grade_Texture};
	#local is_frame = 0;
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
//	Wall_FlatStone_a(North,East,South,West)
//	Wall_FlatStone_b(North,East,South,West)
//	Wall_FlatShack(North,East,South,West)
	Wall_FlatConcrete(North,East,South,West)
//	Wall_FlatTechy_a(North,East,South,West)
//	Wall_FlatTechy_b(North,East,South,West)
//	Wall_FlatSteel(North,East,South,West)
//	dummy_object
}
