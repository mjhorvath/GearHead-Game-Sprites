// Desc: GearHead walls generator
// Auth: Michael Horvath
// Home: http://isometricland.com

#declare Rotate = 0;
#declare Height = 80;
#declare Width = 64;
#declare Decos = 0;
#declare AddWindowGlass = false;

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

// used for restaraunts
#macro Wall_Brick_a(North,East,South,West)
	#local AlignY = 0;			// should textures be rotated to match the wall face's normal?
	#local BotThick = 1/3;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
	#local TopThick = 1;			// the thickness of the wall top as a factor of the wall top (should always be 1 when using brick walls)
	#local Rows = 12;			// the wall is composed of this may rows of bricks
	#local Cols = 4;			// the wall is composed of this many colums of bricks
	#local MortarWidth = 2;			// the width of the mortar between bricks
	#local MortarDepth = 1/2;		// the depth of the mortar between bricks
	#local Brick_Wall_Prototype_Texture = BrickWall_Texture_c() texture {Grade_Texture};
	#local Mortar_Texture = texture {Plain_Yellow} texture {Grade_Texture};
	#declare Roof_Texture = texture {Plain_Red}
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		#switch (frame_number)
			#range ( 0,15)	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (16,17)	object {Badge_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (18,19)	object {Gear_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (20,21)	object {Dollar_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (22,23)	object {RedCross_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (24,25)	object {Window_Deco_Object_a()	rotate y * Deco_Rotate}	difference {Brick_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
			#range (26,27)	object {Window_Deco_Object_b()	rotate y * Deco_Rotate}	difference {Brick_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
		#end
	}
#end

// used for hospitals
#macro Wall_Brick_b(North,East,South,West)
	#local AlignY = 0;			// should textures be rotated to match the wall face's normal?
	#local BotThick = 1/3;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
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
	#local Roof_Mask_Texture = texture {Wrinkle_Texture_a} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		#switch (frame_number)
			#range ( 0,15)	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (16,17)	object {Badge_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (18,19)	object {Gear_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (20,21)	object {Dollar_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (22,23)	object {RedCross_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (24,25)	object {Window_Deco_Object_a()	rotate y * Deco_Rotate}	difference {Brick_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
			#range (26,27)	object {Window_Deco_Object_b()	rotate y * Deco_Rotate}	difference {Brick_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
		#end
	}
#end

// used for prisons
#macro Wall_Brick_c(North,East,South,West)
	#local AlignY = 0;			// should textures be rotated to match the wall face's normal?
	#local AddWindow = Decos;			// should windows be inserted into long walls?
	#local BotThick = 1/3;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
	#local TopThick = 1;			// the thickness of the wall top as a factor of the wall top (should always be 1 when using brick walls)
	#local Rows = 8;			// the wall is composed of this may rows of bricks
	#local Cols = 4;			// the wall is composed of this many colums of bricks
	#local MortarWidth = 2;			// the width of the mortar between bricks
	#local MortarDepth = 1/2;		// the depth of the mortar between bricks
	#local Brick_Wall_Prototype_Texture = BrickWall_Texture_a() texture {Grade_Texture};
	#local Mortar_Texture = texture {Plain_Yellow} texture {Grade_Texture};
	#local Roof_Mask_Texture = texture {Plain_Red} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		#switch (frame_number)
			#range ( 0,15)	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (16,17)	object {Badge_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (18,19)	object {Gear_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (20,21)	object {Dollar_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (22,23)	object {RedCross_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (24,25)	object {Window_Deco_Object_a()	rotate y * Deco_Rotate}	difference {Brick_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
			#range (26,27)	object {Window_Deco_Object_b()	rotate y * Deco_Rotate}	difference {Brick_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
		#end
	}
#end

// similar to Wall_Brick_b, except the mortar is a different color
#macro Wall_Brick_d(North,East,South,West)
	#local AlignY = 0;			// should textures be rotated to match the wall face's normal?
	#local BotThick = 1/3;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
	#local TopThick = 1;			// the thickness of the wall top as a factor of the wall top (should always be 1 when using brick walls)
	#local Rows = 6;			// the wall is composed of this many rows of bricks
	#local Cols = 2;			// the wall is composed of this many colums of bricks
	#local MortarWidth = 2;			// the width of the mortar between bricks
	#local MortarDepth = 1/2;		// the depth of the mortar between bricks
	#local TopRow_Skip = 1;			// this many rows of bricks separate the window from the top of the wall
	#local BotRow_Skip = 1;			// this many rows of bricks separate the window from the bottom of the wall	
	#local Column_Skip = 1;			// this many columns of bricks separate the window from the sides of the wall
	#local Brick_Wall_Prototype_Texture = texture {Wrinkle_Texture_a} texture {Grade_Texture};
	#local Mortar_Texture = texture {Plain_Yellow} texture {Grade_Texture};
	#local Roof_Mask_Texture = texture {Plain_Red} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		#switch (frame_number)
			#range ( 0,15)	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (16,17)	object {Badge_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (18,19)	object {Gear_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (20,21)	object {Dollar_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (22,23)	object {RedCross_Deco_Object()	rotate y * Deco_Rotate}	Brick_Wall_Prototype(North,East,South,West)	#break
			#range (24,25)	object {Window_Deco_Object_a()	rotate y * Deco_Rotate}	difference {Brick_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
			#range (26,27)	object {Window_Deco_Object_b()	rotate y * Deco_Rotate}	difference {Brick_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
		#end
	}
#end

// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
//	Wall_Brick_a(North,East,South,West)
//	Wall_Brick_b(North,East,South,West)
//	Wall_Brick_c(North,East,South,West)
	Wall_Brick_d(North,East,South,West)
}
