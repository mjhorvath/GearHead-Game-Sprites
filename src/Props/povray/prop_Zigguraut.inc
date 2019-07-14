// "pyramid.mcr" written by Fabien Mosen
#include "pyramid.mcr"
#include "shapes.inc"
#include "shapes2.inc"
#include "finish.inc"
#include "metals.inc"
#include "../../walls/povray/Walls_Textures.inc"

#local Scale_All = 2/3;

difference
{
	object
	{
		Pyramid_N (4,24,48)
	}
	union
	{
		box
		{
			<10,22,10,>,
			<-10,40,-10,>
		}
		plane
		{
			-y, -24
		}
	}
	union
	{
		box
		{
			<24,-6,3,>,
			<0,6,-3>
		}
		box
		{
			<3,-6,24,>,
			<-3,6,0>
		}
	}
/*
	union
	{
		box
		{
			<24,8,24,>,
			<-24,16,-24,>
		}
		box
		{
			<18,6,18,>,
			<-18,18,-18,>
		}
	}
*/
	texture
	{
		pigment {gamma_color_adjust(<137,073,171,>/255)}
//		Plain_Gray
//		Walls_Texture_c
//		T_Grnt24
		normal {Faceted_Normal_a}
		scale 1
		finish {Default_Finish}
	}
	scale 30/24
	scale Scale_All
}
box
{
	<-7,22,-7,>,
	<7,24,7>
	/*
	texture
	{
		pigment
		{
			gamma_color_adjust(<1,1/2,0,>)
		}
		finish
		{
			ambient 2
			diffuse 0
		}
	}
	*/
	texture
	{
		pigment {gamma_color_adjust(<137,073,171,>/255)}
//		Plain_Gray
//		Walls_Texture_c
//		T_Grnt24
		normal {Faceted_Normal_a}
		scale 1
		finish {Default_Finish}
	}
	scale 30/24
	scale Scale_All
}
box
{
	<-8,24,-8,>,
	<8,26,8>
	texture
	{
//		Plain_Gray
//		Walls_Texture_c
//		T_Grnt24
		T_Gold_1A
//		pigment {color rgb 0}
//		normal {Faceted_Normal_a}
		scale 1
		finish {Default_Finish phong 1 phong_size 1}
	}
	scale 30/24
	scale Scale_All
}

/*
object
{
//	Dodecahedron
	Octahedron
//	rotate x * 45
//	rotate z * 45
//	rotate y * 180
	scale 10
	translate y * (42)
	texture
	{
		Plain_Gray
//		Walls_Texture_a
//		Gold_Metal
//		New_Penny
//		Polished_Chrome
		finish {Default_Finish}
	}
}
*/

/*
sphere
{
	<0,42,0,>,
	20
	texture
	{
		Walls_Texture_a
//		Plain_White
	}
}
*/

//background {gamma_color_adjust(<1,1,0,>)}