// Desc: GearHead walls generator
// Auth: Michael Horvath
// Home: http://isometricland.net
// +KFI0 +KFF3 +KC

#version 3.7;

#declare Height = 80;		// 80 for old tall style, 57 fore new short style
#declare Width = 64;
#declare WallThick = Width/16;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Walls_Textures.inc"			// Source of the textures
#include "Walls_Prototypes.inc"			// Source of the object components

#switch (frame_number)
	#case (0)
		#local DoorClosed = 1;
		#local DoorTurned = 0;
	#break
	#case (1)
		#local DoorClosed = 0;
		#local DoorTurned = 0;
	#break
	#case (2)
		#local DoorClosed = 1;
		#local DoorTurned = 1;
	#break
	#case (3)
		#local DoorClosed = 0;
		#local DoorTurned = 1;
	#break
#end


// -------------------------------------------------------------
// Definitions for the various wall types

#declare Door_b = union
{
	union
	{
		difference
		{
			// door
			union
			{
				superellipsoid
				{
					<1/2,1/2>
					scale 0.99
					translate +y
					scale <WallThick,Height/2,Width/4>
				}
				box
				{
					-1,1
					translate +y
					scale <WallThick/2,Height/2,Width/4>
				}
			}
			// window hole
			box
			{
				-1,1
				scale <Width,Height/8,Width/16>
				translate y * Height * 2/3
			}
		}
		// window glass - only enable this for 32-bit images
		box
		{
			-1,1
			scale <WallThick,Height/8,Width/16>
			translate y * Height * 2/3
			texture {Wall_Glass_Texture}
		}
		// door handle
		sphere
		{
			0,1
			scale Width/32
			translate +y * Height * 1/3
			translate +x * WallThick
			translate +z * Width/8
		}
		// door handle
		sphere
		{
			0,1
			scale Width/32
			translate +y * Height * 1/3
			translate -x * WallThick
			translate +z * +Width/8
		}
		#if (DoorClosed = false)
			translate +z * (Width/4-WallThick)
			rotate y * -90
			translate -z * (Width/2-WallThick)
		#else
			translate -z * Width/4
		#end
	}
	union
	{
		difference
		{
			// door
			union
			{
				superellipsoid
				{
					<1/2,1/2>
					scale 0.99
					translate +y
					scale <WallThick,Height/2,Width/4>
				}
				box
				{
					-1,1
					translate +y
					scale <WallThick/2,Height/2,Width/4>
				}
			}
			// window hole
			box
			{
				-1,1
				scale <Width,Height/8,Width/16>
				translate y * Height * 2/3
			}
		}
		// window glass - only enable this for 32-bit images
		box
		{
			-1,1
			scale <WallThick,Height/8,Width/16>
			translate y * Height * 2/3
			texture {Wall_Glass_Texture}
		}
		// door handle
		sphere
		{
			0,1
			scale Width/32
			translate +y * Height * 1/3
			translate +x * WallThick
			translate -z * Width/8
		}
		// door handle
		sphere
		{
			0,1
			scale Width/32
			translate +y * Height * 1/3
			translate -x * WallThick
			translate -z * Width/8
		}
		#if (DoorClosed = false)
			translate -z * (Width/4-WallThick)
			rotate y * +90
			translate +z * (Width/2-WallThick)
		#else
			translate +z * Width/4
		#end
	}
	texture {Plain_White}
	texture {Grade_Texture}
}


// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Door_b
	#if (DoorTurned = true)
		rotate y * -90
	#end
//	no_shadow
}
