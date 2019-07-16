// Source for the Dragonfly Ground Unit of the Hinsectoids
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
#declare abdom01tex = texture
{
	pigment { image_map {png "drag_a.png"} scale < 40, 40, 40> rotate 90*y}
	normal
	{
		leopard 20
		scale 1.5
	}
	finish { phong 1 } 
}

#declare redtex = texture
{
	pigment {Red}
}

#declare bluetex = texture
{
	pigment {Blue}
}

#declare bodysect02tex = texture
{
	pigment
	{
		image_map {png "drag_a.png"} 
		scale < 45, 45, 65>
		rotate 90*z 
	}
	finish { phong 1 } 
}

#declare leg01tex = texture
{
	pigment
	{
		image_map {png "drag_a.png"} 
		scale < 45, 45, 45>
		rotate 90*y 
	}
	finish { phong 1 } 
}

#declare membranetex = texture
{
	pigment { White filter 0.8 } 
	normal
	{
		crackle 10
		scale 10
	}
	normal
	{
		bumps 
		scale 0.5
	}  
	normal
	{
		hexagon 100
		scale 1
		rotate 45*y
	}
	finish
	{
		ambient 0.02
		diffuse 0.01
		reflection .01
		specular .01
		roughness .1 
		irid {  0.3 thickness 0.01 turbulence 2 }
	}     
}

#declare wing01tex = texture
{
	pigment
	{
		image_map {png "drag_a.png"} 
		scale < 15, 1, 5>
		rotate -65*y
	}
	finish { phong 1 }
}

#declare antenna1tex = texture
{
	pigment {HuntersGreen} 
}

#declare headspheretex = texture
{
	pigment {Black}
	finish{ phong 1}
}

#declare head02tex = texture
{
	pigment
	{
		image_map {png "drag_a.png"} 
		scale < 25, 25, 25>
		rotate 90*y 
	}
	finish { phong 1 } 
}
*/

#declare abdom01tex = MTX;
#declare redtex = MTX;
#declare bluetex = CTX;
#declare bodysect02tex = MTX;
#declare leg01tex = HTX;
#declare membranetex = CTX;
#declare wing01tex = HTX;
#declare antenna1tex = CTX;
#declare headspheretex = CTX;
#declare head02tex = HTX;




#declare abdom01 = union
{    
	sphere
	{
		<0, 0, 0>, 30 
		texture {abdom01tex}
	}
	cone { <  0, 70, 10>, 0.0, <0, -1, 0>, 3 texture {redtex} }
	cone { < 20, 55,  0>, 0.0, <0, -1, 0>, 3 texture {redtex} }
	cone { <-20, 55,  0>, 0.0, <0, -1, 0>, 3 texture {redtex} }
}

#declare abdom02 = union
{   
	object {abdom01}
	object {abdom01 scale 0.9  rotate   5*x translate <  0,    0,  35> } 
	object {abdom01 scale 0.85 rotate  15*x translate <  0,   -5,  70> } 
	object {abdom01 scale 0.8  rotate  25*x translate <  0,  -15, 105> } 
	object {abdom01 scale 0.75 rotate  35*x translate <  0,  -28, 135> } 
	object {abdom01 scale 0.7  rotate  45*x translate <  0,  -50, 155> } 
	object {abdom01 scale 0.65 rotate  55*x translate <  0,  -70, 170> } 
	object {abdom01 scale 0.6  rotate  70*x translate <  0,  -95, 170> } 
	object {abdom01 scale 0.55 rotate  95*x translate <  0, -110, 160> } 
	object {abdom01 scale 0.5  rotate 105*x translate <  0, -125, 145> }
	cone { <  0, 0, 0> , 5, <  20, -20, -100>, 0 scale < 1, 0.4, 1> translate <  0, -125, 145> texture {redtex} }
	cone { <  0, 0, 0> , 5, < -20, -20, -100>, 0 scale < 1, 0.4, 1> translate <  0, -125, 145> texture {redtex} }    
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
		scale < 40, 40, 20>
		rotate 90*x
		translate < 0, 7, 0>
		texture {bodysect02tex}
	}
}

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
//	sphere { <0, 0, 0>, 15 scale < 0.3, 0.10, 0.3 > rotate -35*z translate <  80, 0, 1> }
	translate < 70, 0, 0>
}

#declare leg01 = union
{
	object {limbsect02 scale < -0.45, 1, 1.2> rotate 190*x rotate 180*z }
	object {limbsect02 scale < -0.25, 1, 0.9> rotate 190*x rotate 120*z translate < 68, -1, 0> }
	texture {leg01tex}
}

#declare winglead01 = sphere_sweep
{
	//linear_spline                 // linear curve
	cubic_spline                // alternative spline curves
	//b_spline
	7,                            // number of specified sphere positions
	<  0, 0, 0>, 4
	<  0, 0, 0>, 4
	< 20, 0, 1>, 3.2
	< 30, 0, 4>, 3.2
	< 40, 0, -4>, 2
	< 48, 0, -15>, 0.8
	< 48, 0, -15>, 0.1
	//tolerance 0.001             // optional
	scale < 1, 0.4, 1>
}

#declare membrane = prism
{
	cubic_spline // linear_spline 
	-0.05,         // height 1
	 0.05,         // height 2
	12,           // number of points
	<   2,  -1>, 
	<   2,  -1>, 
	<  30,   3>, 
	<  60,   7>, 
	<  88,  14>, 
	< 100,  20>, 
	< 105,  34>, 
	<  60,  30>, 
	<  30,  22>, 
	<  10,  15>, 
	<   2,  -1>, 
	<   2,  -1> 
	//open
	//sturm  
}

#declare wing01 = union
{
	object
	{
		membrane
		texture {membranetex}
	}
	object {winglead01 scale <1, 0.15, 1>}
	object {winglead01 scale <1, 0.15, 0.8> translate < 30, 0, 4> }
	object {winglead01 rotate -15*y scale <1, 0.15, 0.6> translate < 60, 0, 7> }
	object {winglead01 rotate -30*y scale <0.7, 0.15, 0.5> translate < 88, 0, 14> }
	object {winglead01 rotate -60*y scale <0.5, 0.15, 0.3> translate <100, 0, 20> }
	texture {wing01tex}
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

#declare head01 = sphere_sweep
{
	cubic_spline
	7,
	<  -5,  0,   0>, 20
	< -15,  0, -20>, 15
	<  -9,  0, -35>, 11
	<  -7,  0, -50>,  7
	<  -4,  0, -65>,  4
	<  -2,  0, -80>,  1
	<  -2,  0, -80>,  1
}

#declare head02 = union
{
	object {head01}
	object {head01 rotate -90*z scale < 1.3, 0.6, 1.2> }
	object {head01 rotate 180*z}
	object {mandible scale < 1, 1, 1.5> rotate  20*y translate < 0, -5, -90> texture {redtex} }
	object {mandible scale <-1, 1, 1.5> rotate -20*y translate < 0, -5, -90> texture {redtex} }
	object {antennaarray rotate -10*y rotate -20*x rotate -20*z translate < 10, 8, -50> texture {bluetex} }
	object {antennaarray rotate  10*y rotate -20*x rotate  20*z translate <-10, 8, -50> texture {bluetex} }
	sphere { <0, 0, 0>, 13  translate < 18, -0, -25> texture {headspheretex} }
	sphere { <0, 0, 0>, 13  translate <-18, -0, -25> texture {headspheretex} }
//	sphere { <0, 0, 0>, 10  translate <  0, 12, -25> texture {headspheretex} }
	texture {head02tex}
}

#declare dragonfly = union
{
	object {abdom02 translate < 0, 10, 30> }
	object {bodysect02 translate < 0, 0,  0> }
	object {bodysect02 scale < 0.8, 0.8, 0.8> translate < 0, 0,-30> }
	object {bodysect02 scale < 0.7, 0.6, 0.7> translate < 0, 0,-60> }
	object {leg01 scale <  1, 1.2, 1  > rotate -20*y translate < 45, 0,  0>}
	object {leg01 scale <  1, 1.2, 0.8> rotate  10*y translate < 35, 0, -35>}
	object {leg01 scale <  1, 1.2, 0.6> rotate  50*y translate < 30, 0, -65>}
	
	object {leg01 scale < -1, 1.2, 1  > rotate  20*y translate <-45, 0,  0>}
	object {leg01 scale < -1, 1.2, 0.8> rotate -10*y translate <-35, 0, -35>}
	object {leg01 scale < -1, 1.2, 0.6> rotate -50*y translate <-30, 0, -65>}        
	object {wing01 scale < 3, 5, 2> rotate -20*y rotate  20*x rotate  0*z translate < 14, 25, 5>}
	object {wing01 scale < 3, 5, 2> rotate - 0*y rotate  20*x rotate 20*z translate < 12, 20, -30>}
	object {wing01 scale < 3, 5, 2> rotate  30*y rotate -10*x rotate 40*z translate < 10, 15, -60>}
	
	object {wing01 scale <-3, 5, 2> rotate  20*y rotate  20*x rotate  0*z translate <-14, 25, 5>}
	object {wing01 scale <-3, 5, 2> rotate   0*y rotate  20*x rotate -20*z translate <-12, 20, -30>}
	object {wing01 scale <-3, 5, 2> rotate -30*y rotate -10*x rotate -40*z translate <-10, 15, -60>}
	
	object {head02 rotate -30*x scale < 0.6, 0.6, 0.6> translate < 0 , 10, -80> }
}

object
{
	dragonfly
	translate y * 120
	scale 1/10
	rotate y * 135
	rotate y * clock * 360
}
