// Source for the Plasma Beetle Ground Unit of the Hinsectoids
//
// Author - Oliver Harlow 
//  
// e-mail Contact : crayons@twoflower.fsnet.co.uk
//
// Designed for - The Hinsectoids (For VGA Planets Version 4)
//
// Copyright (C) 2004 Oliver Harlow
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published
// by the Free Software Foundation; either version 2 of the License,
// or (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of 
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
// See the GNU General Public License for more details.
// 
// You should have been able to view a copy of the GNU General Public License 
// along with this program; if not, write to 
// the Free SoftwareFoundation, Inc., 59 Temple Place - Suite 330, 
// Boston, MA 02111-1307, USA.  
//
// The license can also be viewed on the www at
// www.gnu.org/licenses/gpl.html
// the main GNU site is at   
// www.gnu.org
// This code is supplied free for use - credit for the origin
// would be appreciated.      
//

#declare Camera_Mode = 1;
#declare Show_GridMarker = 0;
#declare Show_BasicFloor = 0;
#declare Show_AxisMarker = 0;

#include "GearHead.inc"
#include "colors.inc"    

/*
#declare limbsect01tex = texture
{
	pigment
	{
		image_map {png "plasma2.png"} 
		scale < 10, 10, 10>
		rotate 90*y 
	}
	normal { dents 0.5 scale 1 }
	normal { bumps 0.5 scale 1 }
	finish { phong 1 }
}

#declare limbsect02tex = texture
{
	pigment
	{
		image_map {png "plasma2.png"} 
		scale < 10, 10, 10>
		rotate 90*y
		rotate 20*z 
	}
	normal { dents 0.5 scale 1 }
	normal { bumps 0.5 scale 1 }
	finish { phong 1 }
}

#declare shield01tex = texture
{
	pigment
	{
		image_map {png "plasma_a.png"} 
		scale < 25, 25, 25>
		rotate 90*z 
	}
	normal { dents 0.2 scale 1 }
	normal { bumps 0.2 scale 1 }
	finish { phong 1 }
}

#declare shield02tex = texture
{
	pigment
	{
		image_map {png "plasma_a.png"} 
		scale < 25, 25, 25>
		//rotate 90*z
	}
	normal { dents 0.2 scale 1 }
	normal { bumps 0.2 scale 1 }
	finish { phong 1 }
}

#declare bodysect01tex = texture
{
	pigment
	{
		image_map {png "plasma_a.png"} 
		scale < 25, 25, 25>
		rotate 90*z
	}
}

#declare bodysect02tex = texture
{
	pigment {Red}
	pigment
	{
		image_map {png "plasma_a.png"} 
		scale < 25, 25, 25>
		rotate 90*z 
	}
}

#declare sweeptex = texture
{
	pigment {Blue filter 0.85} 
	normal { bumps 5 scale 25 }
	finish
	{
		ambient 0.4
		diffuse 0.4
		reflection 0.1
		specular 1
		roughness .1
	}
}

#declare spheretex1 = texture
{
	pigment { White   filter 0.90 }
	normal { bumps 10 scale 15 }
	finish
	{
		ambient 0.4
		diffuse 0.4
		reflection 0.1
		specular .1
		roughness .5
		irid {  0.2 thickness 0.05 turbulence 2 }
	}
}

#declare spheretex2 = texture
{
	pigment { White   filter 0.85 }
	normal { bumps 10 scale 15 }
	finish
	{
		ambient 0.4
		diffuse 0.4
		reflection 0.1
		specular .1
		roughness .5
		irid {  0.2 thickness 0.05 turbulence 2 }
	}
}

#declare spheretex3 = texture
{
	pigment { White   filter 0.85 }
	normal { bumps 10 scale 15 }
	finish
	{                
		ambient 0.4
		diffuse 0.4
		reflection 0.1
		specular .1
		roughness .5
		irid {  0.2 thickness 0.05 turbulence 2 }
	}
}

#declare spheretex4 = texture
{
	pigment { White   filter 0.80 }
	normal { bumps 10 scale 15 }
	finish
	{
		ambient 0.4
		diffuse 0.4
		reflection 0.1
		specular .1
		roughness .5
		irid {  0.2 thickness 0.05 turbulence 2 }
	}
}

#declare antenna1tex = texture
{
	pigment {HuntersGreen}
}
*/

#declare limbsect01tex = MTX;
#declare limbsect02tex = MTX;
#declare shield01tex = HTX;
#declare shield02tex = HTX;
#declare bodysect01tex = CTX;
#declare bodysect02tex = CTX;
#declare sweeptex = CTX;
#declare spheretex1 = CTX;
#declare spheretex2 = CTX;
#declare spheretex3 = CTX;
#declare spheretex4 = CTX;
#declare antenna1tex = HTX;










// create a curved tube object translating a sphere along a certain path
#declare limbsect01 = sphere_sweep
{
	cubic_spline
	9,
	< 0, -25, 0>, 3
	< 0, -25, 0>, 3
	< 3, -20, 0>, 4
	< 7, -10, 0>, 5
	< 9,   0, 0>, 6
	< 7,  10, 0>, 5
	< 3,  20, 0>, 4
	< 0,  25, 0>, 3
	< 0,  25, 0>, 3
	//tolerance 0.001             // optional
	texture {limbsect01tex}
}

// create a curved tube object translating a sphere along a certain path
#declare limbsect02 = sphere_sweep
{
	cubic_spline
	9,
	< 0, -25, 0>, 1
	< 0, -25, 0>, 1
	< 3, -20, 0>, 2
	< 7, -10, 0>, 2
	< 9,   0, 0>, 3
	< 7,  10, 0>, 4
	< 3,  20, 0>, 4
	< 0,  25, 0>, 5
	< 0,  25, 0>, 5
	//tolerance 0.001             // optional
	texture {limbsect02tex}
	translate -25*y
}

#declare shield01 = difference
{
	sphere { <0, 0, 0>, 16 scale < 1, 2, 0.5> } 
	sphere { <0, 0, 0>, 16 scale < 0.9, 1.9, 0.4> }
	box { <-20, -50, -20>, < 2, 50, 20> rotate 55*y} 
	box { <-20, -50, -20>, < 2, 50, 20> rotate -55*y} 
	texture {shield01tex}
}

#declare shield02 = difference
{
	sphere { <0, 0, 0>, 16 scale < 1, 2, 0.5> } 
	sphere { <0, 0, 0>, 16 scale < 0.9, 1.9, 0.4> }
	box { <-20, -50, -20>, < 2, 50, 20> rotate 55*y} 
	box { <-20, -50, -20>, < 2, 50, 20> rotate -55*y} 
	texture {shield02tex}
}

#declare legsect01 = union
{
	object {limbsect01}
	object {shield01 scale <1, 1, 1.8> translate <-1, 0, 0>}
	translate <0, -25, 0>
}

#declare leg01 = union
{
	object {legsect01 rotate 140*z}
	object {legsect01  scale < 0.8, 1.3, 0.9> rotate 45*z translate <35,  36, 0>}
	object {limbsect02 scale <0.7, 0.75, 0.7> rotate 10*z translate <83, -13, 0> }
}

#declare bodysect01 = union
{                                                      
	julia_fractal
	{
		<-0.083,0.0,-0.83,-0.025>
		quaternion 
		cube 
		max_iteration 4
		precision 20
		scale < 50, 50, 25>
		rotate 90*x
		translate < 0, 7, 0>
		texture {bodysect01tex}
	}
	object {shield02 scale <2, 1.7, 7> rotate 90*z rotate -20*x translate <0,4, 0>} 
}

#declare bodysect02 = union
{                                                      
	julia_fractal
	{
		<-0.083,0.0,-0.83,-0.025>
		quaternion 
		cube 
		max_iteration 4
		precision 20
		scale < 50, 50, 25>
		rotate 90*x
		translate < 0, 7, 0>
		texture {bodysect02tex}
	}
}

/*
#declare wingcovers = union
{
	object {shield02 scale < 2, 4, 4> rotate 75*x rotate 45*y translate < 60, 0, 100> rotate  10*z }
	object {shield02 scale < 2, 4, 4> rotate 75*x rotate 45*y translate < 60, 0, 100> rotate  40*z }
	object {shield02 scale < 2, 4, 4> rotate 75*x rotate 45*y translate < 60, 0, 100> rotate 140*z }
	object {shield02 scale < 2, 4, 4> rotate 75*x rotate 45*y translate < 60, 0, 100> rotate 170*z }
}
*/

#declare shield03 = object {shield02 translate < -8, 30, 0> scale < 2, 4, 5> rotate 90*y rotate -00*z translate < 0, 0, 0> rotate  0*z }

#declare wingcovers = union
{
	object {shield03 rotate  50*x rotate -90*z }
	object {shield03 rotate  40*x rotate -50*z }
	object {shield03 rotate  50*x rotate  90*z }
	object {shield03 rotate  40*x rotate  50*z }
}

#declare plasmasac = union
{
	sphere_sweep
	{
		//linear_spline
		cubic_spline 
		//b_spline
		13,
		<  0,  0,  0>, 3 
		< 10,  1,  0>, 1 
		< 20,  3,  0>, 3 
		< 30,  5,  0>, 1 
		< 40,  8,  0>, 3 
		< 50,  9,  0>, 1 
		< 58,  11,  0>, 3 
		< 66,  13,  0>, 1 
		< 72,  16,  0>, 3 
		< 80,  20,  0>, 1 
		< 84,  24,  0>, 3 
		< 87,  32,  0>, 2 
		< 85,  30,  0>, 1
		rotate -90*y
		scale <10, 5 , 1>
		texture {sweeptex}
	}
	sphere
	{
		< 0 , 30, 30>, 45
		texture {spheretex1}
	}
	sphere
	{
		< 0 , 50, 50>, 55
		texture {spheretex2}
	}
	sphere
	{
		< 0 , 90, 70>, 45
		texture {spheretex3}
	}
	sphere
	{
		< 0 , 130, 80>, 35
		texture {spheretex4}
	}
}

#declare antenna1 = sphere_sweep
{
	cubic_spline
	7,         
	<  0,  0,  0>, .5
	<  0,  0,  0>, .5
	<  0,  6,  0>, .5
	<  0, 12, -1>, .4
	<  0, 25, -3>, .3
	<  0, 35, -3>, .1
	<  0, 35, -3>, .1
	texture {antenna1tex}
}

#declare antennapetals = union
{
	object {antenna1}
	object {antenna1 scale <2,   0.2, 0.4>  rotate -60*z translate < 0 , 10,   0>}
	object {antenna1 scale <2,   0.3, 0.4>  rotate -60*z translate < 0 , 13,  -1>}
	object {antenna1 scale <2,   0.4, 0.4>  rotate -60*z translate < 0 , 16,  -2>}
	object {antenna1 scale <2,   0.5, 0.4>  rotate -60*z translate < 0 , 19,  -2.5>}
	object {antenna1 scale <2,   0.6, 0.4>  rotate -60*z translate < 0 , 22,  -3>}
	object {antenna1 scale <2,   0.6, 0.4>  rotate -60*z translate < 0 , 25,  -3>}
	object {antenna1 scale <2,   0.5, 0.4>  rotate -60*z translate < 0 , 28,  -3>}
	object {antenna1 scale <2,   0.4, 0.4>  rotate -60*z translate < 0 , 31,  -3>}
	object {antenna1 scale <1.5, 0.3, 0.4>  rotate -55*z translate < 0 , 34, -3>}
	object {antenna1 scale <1.4, 0.3, 0.4>  rotate -40*z translate < 0 , 34, -3>}
	object {antenna1 scale <1.8, 0.3, 0.4>  rotate -15*z translate < 0 , 34, -3>}
}

#declare antennaarray = union
{
	    object {antenna1}
	    object {antennapetals}
	    object {antennapetals scale <-1, 0 , 0> }
}

#declare head = union
{ 
	difference
	{
		union
		{
			object {shield01 scale <1, 1, 2> }
			object {shield01 scale <1, 1, 2> rotate  30*y rotate  15*x translate < 0, 2, -9> }
			object {shield01 scale <1, 1, 2> rotate -30*y rotate -15*x translate < 0, 2,  9> }
		}
		box {< -100, -100, -100> < 100, 0, 100>}
		box {< -100, -100, -100> < 100, 0, 100> rotate  20*x}
		box {< -100, -100, -100> < 100, 0, 100> rotate -20*x}
		rotate -90*y
		rotate -115*x
	}
	object {antennaarray scale <0.8 1.2, 1> rotate  30*y rotate -30*x translate < -10, 0, -25> }   
	object {antennaarray scale <0.8 1.2, 1> rotate  60*y rotate  30*z translate < -10, 5, -20> }   
	object {antennaarray scale <0.8 1.2, 1> rotate -30*y rotate -30*x translate < 10, 0, -25> }   
	object {antennaarray scale <0.8 1.2, 1> rotate -60*y rotate -30*z translate < 10, 5, -20> }   
}

#declare plasmabeetle = union
{
	object {bodysect02 scale <0.5, 0.8, 0.8> translate <0, 0,  40> }
	object {bodysect01}
	object {bodysect01 scale 0.8 translate <0, 0, -40> }
	object {bodysect01 scale 0.6 translate <0, 0, -70> }
	
	object {leg01                     rotate -60*y translate <58, 0,   0> }
	object {leg01 scale <1.3, 1, 0.8> rotate  -0*y translate <45, 0, -40> }
	object {leg01 scale <0.8, 1, 0.8> rotate  50*y translate <28, 0, -70> }
	
	object {leg01                     rotate -60*y translate <58, 0,   0> scale <-1, 0, 0> }
	object {leg01 scale <1.3, 1, 0.8> rotate  -0*y translate <45, 0, -40> scale <-1, 0, 0> }
	object {leg01 scale <0.8, 1, 0.8> rotate  50*y translate <28, 0, -70> scale <-1, 0, 0> }
	
	object {wingcovers translate < 0 , 0, 10> }
	object {plasmasac scale < 0.8, 0.9, 0.9> translate <0, 0,  50>} 
	object {head translate < 0, -5, -85> }   
}

object
{
	plasmabeetle
	translate y * 50
	scale 1/8
	rotate y * 135
	rotate y * clock * 360
}
