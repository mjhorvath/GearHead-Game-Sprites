// Desc: GearHead walls generator
// Auth: Michael Horvath
// Home: http://isometricland.net

#version 3.7

//#declare North = 1;
//#declare East = 1;
//#declare South = 1;
//#declare West = 1;
//#declare Show_BasicFloor = 1;
//#declare Show_CeilingMask = 0;
//#declare Show_AxisMarker = 1;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
//#include "Walls_Textures.inc"			// Source of the textures
//#include "Walls_Prototypes.inc"			// Source of the object components


#local grad_none = pigment {color rgb 0}
#local grad_x = pigment
{
	gradient -x
	color_map
	{
		[0/4 color rgbt <0,0,0,2/2>]
		[1/4 color rgbt <0,0,0,1/2>]
		[3/4 color rgbt <0,0,0,1/2>]
		[4/4 color rgbt <0,0,0,2/2>]
	}
	scale 2
	translate +x
}
#local grad_z = pigment
{
	gradient -z
	color_map
	{
		[0/4 color rgbt <0,0,0,2/2>]
		[1/4 color rgbt <0,0,0,1/2>]
		[3/4 color rgbt <0,0,0,1/2>]
		[4/4 color rgbt <0,0,0,2/2>]
	}
	scale 2
	translate +z
}

#macro Wall_Shadow(North,East,South,West)
	union
	{
		#if (North = 1)
			polygon
			{
				4, <-1,0,-2>, <+1,0,-2>, <+1,0,-1>, <-1,0,-1>
				pigment {grad_x}
				scale WallThick
			}
			polygon
			{
				3, <-1,0,-1>, <+1,0,-1>, 0
				pigment {grad_x}
				scale WallThick
			}
		#else
			polygon
			{
				3, <-1,0,-1>, <+1,0,-1>, 0
				pigment {grad_z}
				scale WallThick
			}
		#end
		#if (East = 1)
			polygon
			{
				4, <-2,0,+1>, <-2,0,-1>, <-1,0,-1>, <-1,0,+1>
				pigment {grad_z}
				scale WallThick
			}
			polygon
			{
				3, <-1,0,-1>, <-1,0,+1>, 0
				pigment {grad_z}
				scale WallThick
			}
		#else
			polygon
			{
				3, <-1,0,-1>, <-1,0,+1>, 0
				pigment {grad_x}
				scale WallThick
			}
		#end
		#if (South = 1)
			polygon
			{
				4, <+1,0,+2>, <-1,0,+2>, <-1,0,+1>, <+1,0,+1>
				pigment {grad_x}
				scale WallThick
			}
			polygon
			{
				3, <-1,0,+1>, <+1,0,+1>, 0
				pigment {grad_x}
				scale WallThick
			}
		#else
			polygon
			{
				3, <-1,0,+1>, <+1,0,+1>, 0
				pigment {grad_z}
				scale WallThick
			}
		#end
		#if (West = 1)
			polygon
			{
				4, <+2,0,-1>, <+2,0,+1>, <+1,0,+1>, <+1,0,-1>
				pigment {grad_z}
				scale WallThick
			}
			polygon
			{
				3, <+1,0,-1>, <+1,0,+1>, 0
				pigment {grad_z}
				scale WallThick
			}
		#else
			polygon
			{
				3, <+1,0,-1>, <+1,0,+1>, 0
				pigment {grad_x}
				scale WallThick
			}
		#end
	}
#end



// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Wall_Shadow(North,East,South,West)
}
