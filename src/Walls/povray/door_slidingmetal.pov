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

#declare Door_a = union
{
	// disable for new style of wall since it is too short
	difference
	{
		box
		{
			-1,1
			translate +y
			scale 1/2
			scale <Width/8,Height,Width> 
		}
		cylinder
		{
			<-Width,Height/2,0>,
			<+Width,Height/2,0>,
			Height/2
		}
		box
		{
			-1,1
			translate +y
			scale 1/2
			scale <Width/20,Height,Width> 
			scale 0.99
		}
	}
	difference
	{
		union
		{
			union
			{
				difference
				{
					box
					{
						-1,1
						scale 0.99
						translate +y
						scale <Width/32,Height/2,Width/4>
					}
					cylinder
					{
						<-Width,0,0>,
						<+Width,0,0>,
						Width/8
						scale y * 1
						translate y * Height*2/3
					}
				}
				// only enable this for 32-bit images
				cylinder
				{
					<-Width/32,0,0>,
					<+Width/32,0,0>,
					Width/8
					scale y * 1
					translate y * Height*2/3
					texture {Wall_Glass_Texture}
				}
				#if (DoorClosed = true)
					translate -z * Width/4
				#else
					translate -z * Width*2/3
				#end
			}
			union
			{
				difference
				{
					box
					{
						-1,1
						scale 0.99
						translate +y
						scale <Width/32,Height/2,Width/4>
					}
					cylinder
					{
						<-Width,0,0>,
						<+Width,0,0>,
						Width/8
						scale y * 1
						translate y * Height*2/3
					}
				}
				// only enable this for 32-bit images
				cylinder
				{
					<-Width/32,0,0>,
					<+Width/32,0,0>,
					Width/8
					scale y * 1
					translate y * Height*2/3
					texture {Wall_Glass_Texture}
				}
				#if (DoorClosed = true)
					translate +z * Width/4
				#else
					translate +z * Width*2/3
				#end
			}
		}
		box
		{
			-1,1
			scale 0.99
			translate +y
			scale <Width,Height,Width/32>/2
		}
		box
		{
			-1,1
			translate +y
			scale <Width/8,Height,Width/2>
			inverse
		}
	}
	texture {Plain_Gray}
	texture {Grade_Texture}
}


// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Door_a
	#if (DoorTurned = true)
		rotate y * -90
	#end
}
