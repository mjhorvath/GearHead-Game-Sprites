// Desc: GearHead grandstands generator
// Auth: Michael Horvath
// Home Page: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm

#declare Height = 16;
#declare Width = 64;
#declare Seed = seed(122233);
#declare Rotate_Y = 0;			// direction of wind (affects flags)
#declare Number_Fans = 200;
#declare TubeThick = Width/32;

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
				rotate x * 45 / 2
			}
			translate y * Height
			texture {Plain_White}
		}
		// glass
		cylinder
		{
			<-Width/2,0,0,>,
			<+Width/2,0,0,>,
			WallThick
			scale 0.999
			hollow
			clipped_by
			{
				plane
				{
					-y,0
					rotate x * 45 / 2
				}
			}
			translate y * Height
			texture
			{
				pigment
				{
					gamma_color_adjust(<0,0,1>) transmit 3/4
				}
				finish {Finish_New}
			}
		}
		// end caps
		difference
		{
			cylinder
			{
				<-Width/2-Width/64,0,0,>,
				<+Width/2+Width/64,0,0,>,
				Width/16
			}
			cylinder
			{
				<-Width/2,0,0,>,
				<+Width/2,0,0,>,
				Width
			}
			translate y * Height
			texture {Plain_White}
		}
/*
		difference
		{
			cylinder
			{
				<-Width/2,0,0,>,
				<+Width/2,0,0,>,
				WallThick
			}
			cylinder
			{
				<-Width/2,0,0,>*0.99,
				<+Width/2,0,0,>*0.99,
				WallThick*1.1
			}
			cylinder
			{
				<-Width/2,0,0,>*1.1,
				<+Width/2,0,0,>*1.1,
				WallThick*0.9
			}
			translate y * Height
			texture {Plain_White}
		}
*/
		// tori
		torus
		{
			WallThick,TubeThick
			rotate z * 90
			translate y * +Height
			translate x * -Width/2
			texture {Plain_White}
		}
		torus
		{
			WallThick,TubeThick
			rotate z * 90
			translate y * +Height
			translate x * +Width/2
			texture {Plain_White}
		}
	
		object {Red_Flag translate <-Width/2,Height + WallThick,0,>}
		object {Red_Flag translate <+Width/2,Height + WallThick,0,>}

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
			}
			#local Count_Fans = Count_Fans + 1;
		#end
		rotate y * Ang
	}
	plane {y,0}
}

#declare Arena_Tower = union
{
/*
	#local Fx = function(u,v) {u*cos(v)}
	#local Fy = function(u,v) {u*sin(v)}
	#local Fz = function(u,v) {v}
	object
	{
		Parametric(Fx,Fy,Fz,<0,0>,<1,2*pi>,24,12,"")
		rotate x * 90
		rotate y * -45
		scale y/(2*pi)
		translate y
		scale <Width/4, Width, Width/4>
		texture {Plain_Red}
	}
*/
	cylinder
	{
		y*-1,y*+1,WallThick-1
		translate y * Height
		texture {Plain_White}
	}
	difference
	{
		sphere
		{
			0, WallThick * 0.9
			translate y * (WallThick/2+Height)
		}
		merge
		{
			sphere {0, WallThick}
			#if (North = 1)
				cylinder {<0,0,0,>, <0,0,-Width/2,>, WallThick}
			#end
			#if (East = 1)
				cylinder {<0,0,0,>, <-Width/2,0,0,>, WallThick}
			#end
			#if (South = 1)
				cylinder {<0,0,0,>, <0,0,+Width/2,>, WallThick}
			#end
			#if (West = 1)
				cylinder {<0,0,0,>, <+Width/2,0,0,>, WallThick}
			#end
			translate y * Height
		}
		texture
		{
			pigment
			{
				gamma_color_adjust(<0,0,1>) transmit 3/4
			}
			finish {Default_Finish}
		}
		hollow
	}
	#local Count_Fans = 0;
	#while (Count_Fans < Number_Fans*1/4)
		#local rand_x = rand(Seed);
		#local rand_z = rand(Seed);
		object
		{
			ped_macro(Seed)
			translate x * (rand_x * WallThick * 9/10 * cos(rand_x * pi * 2))
			translate z * (rand_z * WallThick * 9/10 * sin(rand_z * pi * 2))
			translate y * Height
			translate y
		}
		#local Count_Fans = Count_Fans + 1;
	#end
	union
	{
		polygon
		{
			4, <0,0,Height/2>, <0,0,-Height/2>, <0,Height*2/4,-Height/2>, <0,Height*2/4,Height/2>
			scale 19/20
			translate x * -WallThick
		}
		polygon
		{
			4, <0,0,Height/2>, <0,0,-Height/2>, <0,Height*2/4,-Height/2>, <0,Height*2/4,Height/2>
			scale 19/20
			translate x * +WallThick
		}
		polygon
		{
			4, <Height/2,0,0>, <-Height/2,0,0>, <-Height/2,Height*2/4,0>, <Height/2,Height*2/4,0>
			scale 19/20
			translate z * +WallThick
		}
		polygon
		{
			4, <Height/2,0,0>, <-Height/2,0,0>, <-Height/2,Height*2/4,0>, <Height/2,Height*2/4,0>
			scale 19/20
			translate z * -WallThick
		}
		texture
		{
			pigment
			{
				gamma_color_adjust(<0,0,1>) transmit 3/4
			}
			finish {Finish_New}
		}
	}
	object {Red_Flag translate <0,WallThick/2+Height+WallThick,0,>}
	difference
	{
		merge
		{
			sphere {0, WallThick}
			#if (North = 1)
				cylinder {<0,0,0,>, <0,0,-Width/2,>, WallThick}
			#end
			#if (East = 1)
				cylinder {<0,0,0,>, <-Width/2,0,0,>, WallThick}
			#end
			#if (South = 1)
				cylinder {<0,0,0,>, <0,0,+Width/2,>, WallThick}
			#end
			#if (West = 1)
				cylinder {<0,0,0,>, <+Width/2,0,0,>, WallThick}
			#end
			translate y * Height
		}
		merge
		{
			sphere {0, WallThick-1}
			#if (North = 1)
				cylinder {<0,0,+1,>, <0,0,-Width/2-1,>, WallThick-1}
			#end
			#if (East = 1)
				cylinder {<+1,0,0,>, <-Width/2-1,0,0,>, WallThick-1}
			#end
			#if (South = 1)
				cylinder {<0,0,-1,>, <0,0,+Width/2+1,>, WallThick-1}
			#end
			#if (West = 1)
				cylinder {<-1,0,0,>, <+Width/2+1,0,0,>, WallThick-1}
			#end
			translate y * Height
		}
		plane {y,0}
		sphere
		{
			0, WallThick * 0.9
			translate y * (WallThick/2+Height)
		}
		box
		{
			<-WallThick,0,-Height/2,>,
			<+WallThick,+Height/2,+Height/2,>
		}
		box
		{
			<-Height/2,0,-WallThick,>,
			<+Height/2,+Height/2,+WallThick,>
		}
		texture {Plain_White}
	}
	difference
	{
		box
		{
			<-WallThick,0,-Height/2,>,
			<+WallThick,+Height/2,+Height/2,>
		}
		box
		{
			<-WallThick,0,-Height/2,>,
			<+WallThick,+Height/2,+Height/2,>
			scale <21/20,19/20,19/20>
		}
		texture {Plain_White}
	}
	difference
	{
		box
		{
			<-Height/2,0,-WallThick,>,
			<+Height/2,+Height/2,+WallThick,>
		}
		box
		{
			<-Height/2,0,-WallThick,>,
			<+Height/2,+Height/2,+WallThick,>
			scale <19/20,19/20,21/20>
		}
		texture {Plain_White}
	}
	difference
	{
		union
		{
			#if (North = 1)
				box {<-WallThick+1,0,-Width/2,>, <+WallThick-1,1,0,>}
				torus
				{
					WallThick,TubeThick
					rotate x * 90
					translate z * -WallThick
				}
			#end
	
			#if (East = 1)
				box {<-Width/2,0,-WallThick+1,>, <0,1,+WallThick-1,>}
				torus
				{
					WallThick,TubeThick
					rotate z * 90
					translate x * -WallThick
				}
			#end
			#if (South = 1)
				box {<-WallThick+1,0,0,>, <+WallThick-1,1,+Width/2,>}
				torus
				{
					WallThick,TubeThick
					rotate x * 90
					translate z * +WallThick
				}
			#end
			#if (West = 1)
				box {<0,0,-WallThick+1,>, <+Width/2,1,+WallThick-1,>}
				torus
				{
					WallThick,TubeThick
					rotate z * 90
					translate x * +WallThick
				}
			#end
			translate y * Height
			texture {Plain_White}
		}
		plane {y,0}
	}
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
