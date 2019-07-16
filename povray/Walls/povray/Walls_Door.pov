// Desc: GearHead walls generator
// Auth: Michael Horvath
// Home: http://isometricland.net
// +KFI0 +KFF3 +KC

#declare Height = 80;		// 80 for old tall style, 57 fore new short style
#declare Width = 64;
#declare WallThick = Width/16;

#declare Show_GridMarker = 0;
#declare Show_BasicFloor = 0;
#declare Show_AxisMarker = 0;
#declare BG_Color = -1;

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
/*
	// disabled because the new style of wall is too short
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
*/
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
/*
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
*/
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
/*
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
*/
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
	texture {Concrete_Texture}
	texture {Grade_Texture}
}

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
/*
		// window glass - only enable this for 32-bit images
		box
		{
			-1,1
			scale <WallThick,Height/8,Width/16>
			translate y * Height * 2/3
			texture {Wall_Glass_Texture}
		}
*/
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
/*
		// window glass - only enable this for 32-bit images
		box
		{
			-1,1
			scale <WallThick,Height/8,Width/16>
			translate y * Height * 2/3
			texture {Wall_Glass_Texture}
		}
*/
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

#declare Door_c = union
{
	union
	{
		difference
		{
			// door
			box
			{
				-1,1
				scale 0.99
				translate +y
				scale <WallThick*2,Height,Width/2>/2
			}
			// divot
			box
			{
				-1,1
				translate +y
				scale <Width/32,Height*1/3-Width/8,Width/2-Width/8>/2
				translate <+WallThick,Width/16,0>
			}
			// divot
			box
			{
				-1,1
				translate +y
				scale <Width/32,Height*2/3-Width/8,Width/2-Width/8>/2
				translate <+WallThick,Height*1/3+Width/16,0>
			}
			// divot
			box
			{
				-1,1
				translate +y
				scale <Width/32,Height*1/3-Width/8,Width/2-Width/8>/2
				translate <-WallThick,Width/16,0>
			}
			// divot
			box
			{
				-1,1
				translate +y
				scale <Width/32,Height*2/3-Width/8,Width/2-Width/8>/2
				translate <-WallThick,Height*1/3+Width/16,0>
			}
		}
		// handle
		sphere
		{
			0,1
			scale Width/32
			translate +y * Height * 1/3
			translate +x * WallThick
			translate +z * Width/8
		}
		// handle
		sphere
		{
			0,1
			scale Width/32
			translate +y * Height * 1/3
			translate -x * WallThick
			translate +z * Width/8
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
			box
			{
				-1,1
				scale 0.99
				translate +y
				scale <WallThick*2,Height,Width/2>/2
			}
			// divot
			box
			{
				-1,1
				translate +y
				scale <Width/32,Height*1/3-Width/8,Width/2-Width/8>/2
				translate <+WallThick,Width/16,0>
			}
			// divot
			box
			{
				-1,1
				translate +y
				scale <Width/32,Height*2/3-Width/8,Width/2-Width/8>/2
				translate <+WallThick,Height*1/3+Width/16,0>
			}
			// divot
			box
			{
				-1,1
				translate +y
				scale <Width/32,Height*1/3-Width/8,Width/2-Width/8>/2
				translate <-WallThick,Width/16,0>
			}
			// divot
			box
			{
				-1,1
				translate +y
				scale <Width/32,Height*2/3-Width/8,Width/2-Width/8>/2
				translate <-WallThick,Height*1/3+Width/16,0>
			}
		}
		// handle
		sphere
		{
			0,1
			scale Width/32
			translate +y * Height * 1/3
			translate +x * WallThick
			translate -z * Width/8
		}
		// handle
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
	texture
	{
		pigment {WoodPlank_Pigment_a}
		finish {Phong_Shiny}
	}
	texture {Grade_Texture}
}

#declare WallThick = Width/32;
#declare Door_d = union
{
	union
	{
		difference
		{
			// door
			box
			{
				-1,1
				scale 0.99
				translate +y
				scale <WallThick*2,Height,Width/2>/2
			}
			// hole
			box
			{
				-1,1
				translate +y
				scale <Width,Height*1/3-Width/8,Width/2-Width/8>/2
				translate <0,Width/16,0>
			}
			// hole
			box
			{
				-1,1
				translate +y
				scale <Width,Height*2/3-Width/8,Width/2-Width/8>/2
				translate <0,Height*1/3+Width/16,0>
			}
		}
		// bars
		union
		{
			cylinder
			{
				<0,Width/16,0>,
				<0,Height-Width/16,0>,
				Width/64
			}
			cylinder
			{
				<0,Width/16,0>,
				<0,Height-Width/16,0>,
				Width/64
				translate +z * Width/10
			}
			cylinder
			{
				<0,Width/16,0>,
				<0,Height-Width/16,0>,
				Width/64
				translate -z * Width/10
			}
		}
		// handle
		sphere
		{
			0,1
			scale Width/32
			translate +y * Height * 1/3
			translate +x * WallThick
			translate +z * Width/8
		}
		// handle
		sphere
		{
			0,1
			scale Width/32
			translate +y * Height * 1/3
			translate -x * WallThick
			translate +z * Width/8
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
			box
			{
				-1,1
				scale 0.99
				translate +y
				scale <WallThick*2,Height,Width/2>/2
			}
			// hole
			box
			{
				-1,1
				translate +y
				scale <Width,Height*1/3-Width/8,Width/2-Width/8>/2
				translate <Width/32,Width/16,0>
			}
			// hole
			box
			{
				-1,1
				translate +y
				scale <Width,Height*2/3-Width/8,Width/2-Width/8>/2
				translate <Width/32,Height*1/3+Width/16,0>
			}
		}
		// bars
		union
		{
			cylinder
			{
				<0,Width/16,0>,
				<0,Height-Width/16,0>,
				Width/64
			}
			cylinder
			{
				<0,Width/16,0>,
				<0,Height-Width/16,0>,
				Width/64
				translate +z * Width/10
			}
			cylinder
			{
				<0,Width/16,0>,
				<0,Height-Width/16,0>,
				Width/64
				translate -z * Width/10
			}
		}
		// handle
		sphere
		{
			0,1
			scale Width/32
			translate +y * Height * 1/3
			translate +x * WallThick
			translate -z * Width/8
		}
		// handle
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
	texture
	{
		Plain_Gray
		finish {Phong_Glossy}
	}
	texture {Grade_Texture}
}

// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
//	Door_a
//	Door_b
	Door_c
//	Door_d
	#if (DoorTurned = true)
		rotate y * -90
	#end
}
