// Desc: GearHead walls generator
// Auth: Michael Horvath
// Home: http://isometricland.com
// Date: 

#declare Height = 80;
#declare Width = 64;

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

#macro Fortress_Wall_Prototype(North,East,South,West)
	#local AlignY = 1;
	#local BotThick = 1/3;
	#local TopThick = 1/2;
	#local Height = 36;
	#local RazrWid = Width/2;
	#local RazrHgh = Width/32;
	#local RazrThk = RazrHgh/4;
	#local RazrFq1 = RazrWid/2;
	#local RazrSt1 = 64;
	#local RazorY = Height;
	#local Wall_Texture = texture
	{
		pigment {gamma_color_adjust(2/4*<1,1,1>)}
		normal {granite .05 scale 1}
	}
	#local Mask_Texture = Wall_Texture;
	#local Roof_Texture = Wall_Texture;
	#local Floor_Texture = Wall_Texture;
	#local Razor_Texture = Polished_Chrome;
	#local Glass_Texture = texture
	{
		pigment {gamma_color_adjust(0*<1,1,1>) transmit 1/2}
		finish {specular 1/2 brilliance 1/2}
	}
	union
	{
		Flat_Wall_Prototype(North,East,South,West)
		Razor_Wire_Prototype(North,East,South,West)

		// towers
		#if ((North + South = 1) | (East + West = 1) | (North + East + South + West > 2) | (North + East + South + West = 0))
/*
			cylinder
			{
				0, y * Height, Width/6
				texture {Wall_Texture}
			}
			sphere
			{
				0, Width/6
				texture {Wall_Texture}
				translate y * Height
			}
*/
			// bottom
			#local BotThick = 1;
			#local TopThick = 1;
			#local Wid = Width/6;
			#local Hgh = Height;
			object
			{
				Flat_Wall_Prototype(0,0,0,0)
			}
			// roof
			#local BotThick = 1;
			#local TopThick = 1;
			#local Hgh = 2;
			#local Wid = Width/6;
			object
			{
				Flat_Wall_Prototype(0,0,0,0)
				translate y * (Height+8)
			}
			// glass
			#local BotThick = 1/2;
			#local TopThick = 2;
			#local Hgh = 8;
			#local Wid = Width/6;
			#local Wall_Texture = Glass_Texture;
			object
			{
				Flat_Wall_Prototype(0,0,0,0)
				translate y * (Height)
				texture {Glass_Texture}
			}
/*
			// pedestals
			#local BotThick = 1;
			#local TopThick = 1;
			#local Hgh = 4;
			#local Wid = 1;
			object
			{
				Flat_Wall_Prototype(0,0,0,0)
				translate x * +(Width/6 - 3)
				translate y * Height
				translate z * +(Width/6 - 3)
			}
			#local BotThick = 1;
			#local TopThick = 1;
			#local Hgh = 4;
			#local Wid = 1;
			object
			{
				Flat_Wall_Prototype(0,0,0,0)
				translate x * -(Width/6 - 3)
				translate y * Height
				translate z * +(Width/6 - 3)
			}
			#local BotThick = 1;
			#local TopThick = 1;
			#local Hgh = 4;
			#local Wid = 1;
			object
			{
				Flat_Wall_Prototype(0,0,0,0)
				translate x * -(Width/6 - 3)
				translate y * Height
				translate z * -(Width/6 - 3)
			}
			#local BotThick = 1;
			#local TopThick = 1;
			#local Hgh = 4;
			#local Wid = 1;
			object
			{
				Flat_Wall_Prototype(0,0,0,0)
				translate x * +(Width/6 - 3)
				translate y * Height
				translate z * -(Width/6 - 3)
			}
*/
		#end
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

#switch (frame_number)
	#range ( 0,15)	object {Fortress_Wall_Prototype(North,East,South,West)}	#break
#end
