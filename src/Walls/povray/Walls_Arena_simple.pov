// Desc: GearHead grandstands generator
// Auth: Michael Horvath
// Home Page: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm

#declare Height = 16;
#declare Width = 64;
#declare Seed = seed(122233);
#declare Rotate_Y = 0;			// direction of wind (affects flags)
#declare Number_Fans = 32;
#declare TubeThick = Width/32;
//#declare WallThick = Width/2;

#include "GearHead.inc"				// Source of the camera and lighting code, basic scene description
#include "functions.inc"
#include "param.inc"			// http://www.econym.demon.co.uk/isotut/param.htm

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
// prototypes

#local Ang = 0;

#if ((North + South = 0) & (East + West = 2))
	#local Ang = 000;
#end
#if ((North + South = 2) & (East + West = 0))
	#local Ang = 090;
#end

#declare Red_Flag = polygon
{
	3, <0,0,0,>, <0,8,-8,>, <0,8,0,>
	texture {Plain_Red}
	rotate y * (Rotate_Y - Ang)
	no_shadow
}

#macro ped_macro(in_seed)
	#local col1 = gamma_color_adjust(<rand(in_seed),rand(in_seed),rand(in_seed)>);
	#local col2 = gamma_color_adjust(<rand(in_seed),rand(in_seed),rand(in_seed)>);
	#local col3 = gamma_color_adjust(<128,080,048>/255+rand(in_seed)*128/255);
	union
	{
		sphere
		{
			y/2, 1/2
			pigment {col1}
			scale <1/4,4/3,1/4>
		}
		difference
		{
			sphere {y/2, 1/2}
			plane {y, 1/2}
			pigment {col2}
			scale <1/3,4/3,1/3>
		}
		sphere
		{
			y, 1/12
			pigment {col3}
			scale <4/3,4/3,4/3>
		}
		scale 4
		scale <rand(in_seed) * 1/3 + 2/3,rand(in_seed) * 1/3 + 2/3,rand(in_seed) * 1/3 + 2/3>
	}
#end

#macro ped_macro(in_seed)
	sphere
	{
		0,
		1
		translate y
		scale <2/3,2,2/3,>
		pigment {gamma_color_adjust(<rand(in_seed),rand(in_seed),rand(in_seed)>)}
		scale 2
	}
#end

#declare Arena_Stands = difference
{
	union
	{
		// stands
		difference
		{
			cylinder
			{
				<-Width/2,0,0,>,
				<+Width/2,0,0,>,
				WallThick
			}
			plane
			{
				-y,0
				rotate +x * 45 / 2			// this line turns on the slope of the grandstands
			}
			translate y * Height
			texture {Plain_White}
		}
		
//		object {Red_Flag translate <-Width/2,Height + WallThick,0,>}
//		object {Red_Flag translate <+Width/2,Height + WallThick,0,>}

		// people
		#local Count_Fans = 0;
		#while (Count_Fans < Number_Fans)
			#local rand_x = rand(Seed);
			#local rand_z = rand(Seed);
			#local size_x = Width - 4;
			#local size_z = WallThick*2 - 4;
			#local post_x = rand_x * size_x - size_x/2;			//!!! should not use absolute distances
			#local post_z = rand_z * size_z - size_z/2;
			object
			{
				ped_macro(Seed)
				translate vaxis_rotate(<post_x,0,post_z>,x,45/2) + y * Height
//				translate vaxis_rotate(<post_x,0,post_z>,x,0) + y * Height			// this line turns off the slope of the grandstands
			}
			#local Count_Fans = Count_Fans + 1;
		#end
		rotate y * Ang
	}
	plane {y,0}
}

#declare Arena_Tower = difference
{
	union
	{
//		box {<-WallThick,0,-WallThick>, <+WallThick,+Height+WallThick,+WallThick>}
		cylinder
		{
			<-Width/2,+Height,0>,
			<+Width/2,+Height,0>,
			WallThick
		}
		cylinder
		{
			<0,+Height,-Width/2>,
			<0,+Height,+Width/2>,
			WallThick
		}
	}
	union
	{
		box
		{
			<-WallThick/2,0.1,-Width>,
			<+WallThick/2,+Height,+Width>

		}
		box
		{
			<-Width,0.1,-WallThick/2>,
			<+Width,+Height,+WallThick/2>

		}
	}
	plane {y,0}
	texture {Plain_White}
}

// -------------------------------------------------------------
// the final object

#switch (frame_number)
	#range ( 0,15)
		#if (((North + South = 2) & (East + West = 0)) | ((North + South = 0) & (East + West = 2)))
			object {Arena_Stands}
		#else
			object {Arena_Tower}
		#end
	#break
	#range (16,17)
		object {Arena_Stands rotate y * 180}
	#break
#end
