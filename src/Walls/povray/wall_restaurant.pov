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

// normal window with glass
#macro Window_Deco_Object_a()
	#ifndef (Rows) #declare Rows = 12; #end			// the wall is composed of this may rows of bricks
	#ifndef (Cols) #declare Cols = 4; #end			// the wall is composed of this many columns of bricks
	#ifndef (MortarWidth) #declare MortarWidth = 2;	#end	// the width of the mortar between bricks
	#ifndef (MortarDepth) #declare MortarDepth = 1/2; #end	// the depth of the mortar between bricks
	#ifndef (TopRow_Skip) #declare TopRow_Skip = 2; #end	// this many rows of bricks separate the window from the top of the wall
	#ifndef (BotRow_Skip) #declare BotRow_Skip = 2; #end	// this many rows of bricks separate the window from the bottom of the wall	
	#ifndef (Column_Skip) #declare Column_Skip = 2; #end	// this many columns of bricks separate the window from the sides of the wall
	#ifndef (AddWindowSill) #declare AddWindowSill = 1; #end
	#ifndef (AddWindowGlass) #declare AddWindowGlass = 1; #end
	#ifndef (AddWindowBars) #declare AddWindowBars = 0; #end
	#declare Window_Sill_Texture = texture {Plain_Gray} texture {Grade_Texture}
	#declare Window_Frame_Texture = texture {Plain_Red} texture {Grade_Texture}
	#declare Window_Glass_Texture = texture {Wall_Glass_Texture} texture {Grade_Texture}
	#declare WindowFrameWidth = Width/16;	// the width of the window frame, as well as the distance it is inset into the wall
	#declare WindowFrameDepth = Width/16;
	#declare BottomPad = Height/Rows * BotRow_Skip;
	#declare WindowHeight = Height - Height/Rows * (TopRow_Skip + BotRow_Skip);
	#declare WindowWidth = Width - Width/Cols * Column_Skip;
	#declare WindowDepth = WallThick - MortarDepth * 2;
	#declare SillHeight = Height/Rows - MortarWidth;
	#declare SillWidth = WindowWidth;	// - MortarWidth * 2
	#declare SillDepth = WindowDepth + Width/16;
	Window_Frame_Prototype()
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
	#local Brick_Wall_Prototype_Texture = texture {Plain_Violet} texture {Grade_Texture};
	#local Mortar_Texture = texture {Plain_Violet} texture {Grade_Texture};
	#local Roof_Mask_Texture = texture {Plain_Black} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		#if (frame_number = 5)
			object {Window_Deco_Object_a()	rotate y * 000}
			difference {Brick_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}
		#elseif (frame_number = 10)
			object {Window_Deco_Object_a()	rotate y * 090}
			difference {Brick_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}
		#else
			Brick_Wall_Prototype(North,East,South,West)
		#end
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Wall_Brick_b(North,East,South,West)
}
