// Source for the Flame Roach Ground Unit of the Hinsectoids
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
#declare leg01tex = texture
{
	pigment
	{
		image_map {png "flame_a.png"} 
		scale < 25, 25, 25>
		rotate 90*z 
	}
	normal { dents 0.2 scale 1 }
	normal { bumps 0.2 scale 1 }
	finish { phong 1 } 
}

#declare shield01tex = texture
{
	pigment {Blue}
	pigment
	{
		image_map {png "flame_a.png"} 
		scale < 25, 25, 25>
		rotate 90*z
	}
	normal { dents 0.2 scale 1 }
	normal { bumps 0.2 scale 1 }
	finish { phong 1 }
}

#declare bodysect01tex = texture
{
	pigment
	{
		image_map {png "flame_a.png"} 
		scale < 25, 25, 25>
		rotate 90*z 
	}
}

#declare bodysect02tex = texture
{
	pigment
	{
		image_map {png "flame_a.png"} 
		scale < 25, 25, 25>
		rotate 90*z 
	}
}

#declare sweep1tex = texture
{
	pigment {Yellow}
}

#declare headtex = texture
{
	pigment { image_map {png "flame_a.png"} scale < 25, 25, 25> rotate 90*y }
}

#declare redtex = texture
{
	pigment {Red}
}
*/

#declare leg01tex = HTX;
#declare shield01tex = MTX;
#declare bodysect01tex = HTX;
#declare bodysect02tex = HTX;
#declare sweep1tex = HTX;
#declare headtex = MTX;
#declare redtex = CTX;




















#declare limbsect01 = union
{
	intersection
	{
		cylinder { <-1.6, 20,   0>, < 80, 25,   0>, 25 }
		cylinder { <-1.6,-20,   0>, < 80,-25,   0>, 25 }
		cylinder { <-1.6,  0,   0>, < 80,  0,   9>, 12 }
	}
	intersection
	{
		cylinder { < 1.6, 20,   0>, <-80, 25,   0>, 25 }
		cylinder { < 1.6,-20,   0>, <-80,-25,   0>, 25 }
		cylinder { < 1.6,  0,   0>, <-80,  0,   9>, 12 }
	}
}

#declare limbsect02 = union
{
	difference
	{
		object {limbsect01}

		sphere { <0,  -8, 0>, 15 scale < 0.6, 1, 2 > rotate 20*y translate <   0, 0, 15> }

		sphere { <0,  -9, 0>, 15 scale < 0.6, 1, 2 > rotate 20*y translate < -10, 0, 15> }
		sphere { <0, -10, 0>, 15 scale < 0.5, 1, 2 > rotate 20*y translate < -20, 0, 16> }
		sphere { <0, -10, 0>, 15 scale < 0.5, 1, 2 > rotate 20*y translate < -30, 0, 17> }
		sphere { <0, -10, 0>, 15 scale < 0.5, 1, 2 > rotate 20*y translate < -40, 0, 18> }
		sphere { <0, -10, 0>, 15 scale < 0.5, 1, 2 > rotate 20*y translate < -50, 0, 19> }
		sphere { <0, -10, 0>, 15 scale < 0.5, 1, 2 > rotate 20*y translate < -60, 0, 20> }
		sphere { <0, -10, 0>, 15 scale < 0.5, 1, 2 > rotate 20*y translate < -70, 0, 22> }

		sphere { <0,  -9, 0>, 15 scale < 0.6, 1, 2 > rotate 20*y translate <  10, 0, 12> }
		sphere { <0, -10, 0>, 15 scale < 0.5, 1, 2 > rotate 20*y translate <  20, 0, 14> }
		sphere { <0, -10, 0>, 15 scale < 0.5, 1, 2 > rotate 20*y translate <  30, 0, 15> }
		sphere { <0, -10, 0>, 15 scale < 0.5, 1, 2 > rotate 20*y translate <  40, 0, 17> }
		sphere { <0, -10, 0>, 15 scale < 0.5, 1, 2 > rotate 20*y translate <  50, 0, 19> }
		sphere { <0, -10, 0>, 15 scale < 0.5, 1, 2 > rotate 20*y translate <  60, 0, 20> }
		sphere { <0, -10, 0>, 15 scale < 0.5, 1, 2 > rotate 20*y translate <  70, 0, 22> }
	}
	sphere { <0, 0, 0>, 15 scale < 0.3, 0.10, 0.3 > rotate -35*z translate <  80, 0, 1> }
	translate < 70, 0, 0>
}

#declare leg01 = union
{
	object {limbsect02 scale < 0.7, 1.1, 1.3> rotate -20*x rotate  35*z}
	object {limbsect02 scale < 0.7, 1.0, 1.3> rotate -10*x rotate -35*z translate < 90, 58, 0>}
	object {limbsect02 scale < 0.5, 0.9, 0.7> rotate -10*x rotate  -5*z rotate -10*y translate <179, -2, -1>}
	texture {leg01tex}
} 

#declare shield01 = difference
{
	sphere { <0, 0, 0>, 16 scale < 1, 2, 0.5> } 
	sphere { <0, 0, 0>, 16 scale < 0.9, 1.9, 0.4> }
	box { <-20, -50, -20>, < 2, 50, 20> rotate 55*y} 
	box { <-20, -50, -20>, < 2, 50, 20> rotate -55*y}
	texture {shield01tex}
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
	object {shield01 scale <2, 1.7, 7> rotate 90*z rotate -20*x translate <0,4, 0>} 
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

#declare mandible = difference
{
	sphere { <0, 0, 0>, 40 scale < 1, 0.08 , 1>  }
	sphere { <0, 0, 0>, 40 scale < 1, 0.3 , 1> rotate 90*x rotate  20*y translate <  20, 0,  12> }
	sphere { <0, 0, 0>, 40 scale < 1, 0.3 , 1> rotate 90*x rotate  20*y translate <  20, 0,  25> }
	sphere { <0, 0, 0>, 40 scale < 1, 0.3 , 1> rotate 90*x rotate  20*y translate <   8, 0,   0> }
	sphere { <0, 0, 0>, 40 scale < 1, 0.3 , 1> rotate 90*x rotate  20*y translate <   5, 0, -15> }
	sphere { <0, 0, 0>, 40 scale < 1, 0.25, 1> rotate 90*x rotate   0*y translate <  10, 0, -18> }
	sphere { <0, 0, 0>, 40 scale < 1, 0.25, 1> rotate 90*x rotate   0*y translate <  15, 0, -26> }
	sphere { <0, 0, 0>, 40 scale < 1, 0.3 , 1> rotate 90*x rotate  20*y translate <  5,  0, -29> }
}

#declare sweep1 = sphere_sweep
{
	cubic_spline
	7,         
	<  0,  0,  0>, 3
	<  0,  0,  0>, 3
	<  0, 16,  0>, 2
	<  0, 28, -1>, 2
	<  0, 40, -3>, 2
	<  0, 55, -3>, 3
	<  0, 55, -3>, 3
	texture {sweep1tex}
}

#declare torch = difference
{
	object {sweep1 scale < 1.2, 1.4, 1  >}
	object {sweep1 scale < 1.1, 1.3, 0.9>}
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
}

#declare head = union
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
		texture {headtex}
		rotate -25*x
		scale < 1, 1, 1.2>
	}
	object {shield01 scale < 1.5, 1.5, 4> rotate -130*z rotate 90*y translate < 0, 70, 0> rotate   0*z translate 5*z}
	object {shield01 scale < 1.5, 1.5, 4> rotate -130*z rotate 90*y translate < 0, 60, 0> rotate  55*z translate 5*z}
	object {shield01 scale < 1.5, 1.5, 4> rotate -130*z rotate 90*y translate < 0, 60, 0> rotate -55*z translate 5*z}
	
	object {shield01 scale < 2, 2, 5> rotate 65*z rotate 90*y translate < 0, 5, 0> rotate   0*z translate -18*z}
	
	object {mandible rotate 20*y rotate -15*x translate < 0, -10, -90> texture {redtex} }
	object {mandible rotate 20*y rotate -15*x scale <-1 , 1, 1> translate < 0, -10, -90> texture {redtex} }
	
	object {torch scale < 1.2, 1.3, 1> rotate 90*x rotate  10*y translate < 20, 0, -95> }
	object {torch scale < 1.2, 1.3, 1> rotate 90*x rotate -10*y rotate 10*x translate < 45, 0, -85> }
	object {torch scale < 1.2, 1.3, 1> rotate 90*x rotate  10*y rotate 20*x translate < 20, 25, -105> scale <-1, 1, 1> }
	object {torch scale < 1.2, 1.3, 1> rotate 90*x rotate   0*y translate < 25, 5, -95> scale <-1, 1, 1> }
	object {antenna1 scale < 2, 3, 2> rotate -10*x rotate -10*z translate <  10, 10,-70> texture {redtex} }
	object {antenna1 scale < 2, 3, 2> rotate -10*x rotate  10*z translate < -10, 10,-70> texture {redtex} }
}

#declare flameroach = union
{
	object {bodysect01 scale < 1.0, 0.7, 1.0> }
	object {bodysect01 scale < 1.1, 0.7, 1.1> translate < 0, 0,  45>}
	object {bodysect01 scale < 0.6, 0.6, 0.8> translate < 0, 0, -45>}
	object {leg01 scale <  0.7, 1, 1.5> rotate   0*y translate <50, 0, 0> }
	object {leg01 scale <  1  , 1, 1.5> rotate -60*y translate <55, 0, 45> }
	object {leg01 scale <  1  , 1, 1.5> rotate  50*y translate <40, 0, -45> }
	object {leg01 scale < -0.7, 1, 1.5> rotate   0*y translate <-50, 0, 0> }
	object {leg01 scale < -1  , 1, 1.5> rotate  60*y translate <-55, 0, 45> }
	object {leg01 scale < -1  , 1, 1.5> rotate -50*y translate <-40, 0, -45> }

	object {shield01 scale < 5, 5, 8> rotate 90*z rotate 92*y rotate -40*z scale < 1, 0.6, 1> translate < 1, -20, 190> }
	object {shield01 scale < 5, 5, 8> rotate 90*z rotate 92*y rotate -40*z scale < -1, 0.6, 1> translate < -1, -20, 190> }
	object {head  scale < 0.7, 0.7, 0.7> rotate -10*x translate < 0, 10, -80> }
}

object
{
	flameroach
	translate y * 10
	scale 1/10
	rotate y * 135
	rotate y * clock * 360
}
