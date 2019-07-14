// author: someone at VGA Planets Crayon World

//#declare Camera_Mode = 3;
//#declare Show_GridMarker = 0;
//#declare Show_BasicFloor = 0;
//#declare Show_AxisMarker = 1;
//#declare Show_HeightScale = 1;

#include "GearHead.inc"
#include "colors.inc"
#include "metals.inc"
#include "glass.inc"

#declare treds = 1;

#declare standard = texture
{
	pigment
	{ 
		bozo
		turbulence 3 
		lambda .3
		omega .6
		octaves 8
		color_map
		{
			[0.3 color OrangeRed]
			[1 color Black]
		}
		scale 70
	}
	normal { bumps .5 scale 8 }
	finish
	{
		diffuse .4
		specular 0.20
		roughness 1/120
	}
}
#declare standard = MTX;

#declare armortex = texture
{
	pigment { color P_Chrome5 }
	normal { bumps .5 scale 15 }
	finish
	{ 
		ambient 0.1
		brilliance 8
		diffuse 0.3
		metallic
		specular 0.20
		roughness 1/120
		reflection 0.1
	}
}
#declare armortex = HTX;

#declare glassmat = material
{
	texture
	{
		pigment { color rgbf<1, 1, 1, .6> }
		finish
			{
			specular 1
			roughness 0.001
			ambient 0
			diffuse 0
			reflection .1
		}
	}
	interior{ ior 1 } 
}
#declare glassmat = CMT;

#declare extratex = texture
{
	pigment { P_Chrome3 }
	finish { F_MetalB }
}
#declare extratex = HTX;

#declare body = union
{
	box { <-50, 0, -50>, <50, 20, 50> }
	polygon { 5, <-50, 0, -50>, <-50, 20, -60>, <50, 20, -60>, <50, 0, -50>, <-50, 0, -50> }
	polygon { 5, <-50, 20, -60>, <-50, 20, -50>, <50, 20, -50>, <50, 20, -60>, <-50, 20, -60> }
	polygon { 5, <-50, 0, 50>, <-50, 20, 60>, <50, 20, 60>, <50, 0, 50>, <-50, 0, 50> }
	polygon { 5, <-50, 20, 60>, <-50, 20, 50>, <50, 20, 50>, <50, 20, 60>, <-50, 20, 60> }
	difference
	{
		union
		{ 
			difference
			{
				union
				{
					sphere { <-50, 0, -50> 30 }
					sphere { <50, 0, -50> 30 }
					sphere { <-50, 0, 50> 30 }
					sphere { <50, 0, 50> 30 }
				}
				box { <-100, -100, -100>, <100, 0, 100> }
			}
			sphere { <-50, 0, -50> 30 scale y*.5 }
			sphere { <50, 0, -50> 30 scale y*.5 }
			sphere { <-50, 0, 50> 30 scale y*.5 }
			sphere { <50, 0, 50> 30 scale y*.5 }
		}
		union
		{
			box { <-100, -100, -100>, <-50, 100, 100> }
			box { <50, -100, -100>, <100, 100, 100> }
		}
	}
	cylinder { <0, 19, 0>, <0, 26, 0> 50 }
	texture { standard }
} 
      
#declare spikey = union
{
	cylinder { <0, 49, 0>, <0, 51, 0> 1.5 pigment { color BlueViolet } }
	cylinder { <0, 49, 0>, <0, 53, 0> 1 texture { armortex } }
}
      
#declare turret = union
{
	cylinder { <0, 25, 0>, <0, 30, 0> 45 }
	cylinder { <0, 28, 0>, <0, 35, 0> 50 }
	union
	{
		difference
		{
			sphere { <0, 0, 0> 50 }
			union
			{      
				sphere { <0, 0, 0> 43 pigment { color Black } }
				box { <-100, -100, -100>, <100, 0, 100> }
				box { <-7, 0, -100>, <7, 100, 0> }
			}
		}
		difference
		{ 
			sphere { <0, 0, 0> 52 }
			union
			{
				sphere { <0, 0, 0> 50 }
				box { <-100, -100, -100>, <100, 0, 100> }
				box { <-10, 0, -100>, <10, 100, 100> }
				box { <0, 16, -13>, <100, 30, 13> }
				box { <0, 0, -13>, <100, 12, 13> rotate z*30 translate y*15 }
				box { <0, 0, -13>, <100, 100, -10> }
				box { <0, 0, 10>, <100, 100, 13> }
			}
			texture { armortex }
		}
		scale y*.8
		translate y*35
	}
	union
	{
		difference
		{
			intersection
			{
				sphere { <0, 0, 0> 50 }
				box { <-5, 0, 5>, <5, 100, 100> }
			}
			union
			{
				cone { <0, 45, 6.9> 1, <0, 45, 8> 0 pigment { color Gray60 } }
				cone { <0, 45, 5.9> 3, <0, 45, 7> 2 }
				cone { <0, 45, 4.9> 4.5, <0, 45, 6> 4 pigment { color Gray60 } }
			}
		}
		object { spikey rotate x*10 }
		object { spikey rotate x*20 }
		object { spikey rotate x*30 }
		object { spikey rotate x*40 }
		object { spikey rotate x*50 }
		object { spikey rotate x*60 }
		object { spikey rotate x*70 }
		object { spikey rotate x*80 }
		translate y*35
	}
	union
	{
		difference
		{
			union
			{
				sphere { <0, 0, -10>, 15 }
				sphere { <0, 0, 10>, 15 }
				cylinder { <0, 0, -10>, <0, 0, 10> 15 }
			}
			union
			{
				sphere { <0, 0, -10>, 12 }
				sphere { <0, 0, 10>, 12 }
				cylinder { <0, 0, -10.1>, <0, 0, 10.1> 12 }
				box { <-50, 0, -50>, <50, 50, 0> }
				cylinder { <-4, -4, 0>, <-4, -4, -50> 1.5 }
				cylinder { <5, -5, 0>, <5, -5, -50> 1.5 }
				cylinder { <2, -8, 0>, <2, -8, -50> 1.5 }
			}
		}
		union
		{
			sphere { <0, 0, -10>, 14 }
			cylinder { <0, 0, -10>, <0, 0, 10> 14 }
			hollow
			material {glassmat}
		}
		difference
		{
			union
			{
				cylinder { <-4, -4, 0>, <-4, -4, -45> 1 }
				cylinder { <5, -5, 0>, <5, -5, -30> 1 pigment { color Gold } }
				cylinder { <2, -8, 0>, <2, -8, -30> 1 }
			}
			union
			{
				cylinder { <-4, -4, 0>, <-4, -4, -100> .8 }
				cylinder { <5, -5, 0>, <5, -5, -50> .8 }
				cylinder { <2, -8, 0>, <2, -8, -50> .8 }
			}                                         
			texture { armortex }
		}
		triangle { <-30, -10, -10>, <-10, -50, -10>, <9, 0, -10> }
		triangle { <-30, -10, 10>, <-10, -50, 10>, <9, 0, 10> }
		polygon { 5, <-30, -10, -10>, <-10, -50, -10>, <-10, -50, 10>, <-30, -10, 10>, <-30, -10, -10> }
		polygon { 5, <-10, -50, -10>, <9, 0, -10>, <9, 0, 10>, <-10, -50, 10>, <-10, -50, -10> }
		polygon { 5, <9, 0, -10>, <-30, -10, -10>, <-30, -10, 10>, <9, 0, 10>, <9, 0, -10> }
		translate <47, 75, 0>
	}
	union
	{
		difference
		{
			union
			{
				cylinder { <0, 0, 0>, <0, 0, -120> 5 }
				cylinder { <0, 0, -100>, <0, 0, -120> 6 }
			}
			cylinder { <0, 0, 1>, <0, 0, -121> 4 pigment { color Black } }
		}
		rotate x*10
		translate y*40
		texture { armortex }
	}
	texture { standard }
	rotate y*0
}

#declare cut = union
{
	union
	{
		box { <-100, -6, -.5>, <100, 0, .5> }
		box { <-100, -50, -.5>, <100, 0, .5> rotate x*60 translate y*-6 }
		rotate x*-40
	}
	union
	{
		box { <-100, 0, -.5>, <100, 6, .5> }
		box { <-100, 0, -.5>, <100, 50, .5> rotate x*-60 translate y*6 }
		rotate x*40
	}
}

#declare spoke = union
{
	difference
	{
		box { <3, -25, -1>, <27, 0, 1> }
		box { <0, 0, -5>, <50, 50, 5> rotate z*20 translate <27, -20, 0> } 
		box { <0, 0, -5>, <-50, 50, 5> rotate z*-20 translate <3, -20, 0> }
	}
}


#declare wheel = union
{
	difference
	{ 
		cylinder { <3, 0, 0>, <27, 0, 0> 30 }
		cylinder { <0, 0, 0>, <30, 0, 0> 27 }
	}
	#ifdef (treds)
		difference
		{
			torus { 30, 4 scale y*3 }
			union
			{
				object { cut }
				object { cut rotate y*5 }
				object { cut rotate y*10 }
				object { cut rotate y*15 }
				object { cut rotate y*20 }
				object { cut rotate y*25 }
				object { cut rotate y*30 }
				object { cut rotate y*35 }
				object { cut rotate y*40 }
				object { cut rotate y*45 }
				object { cut rotate y*50 }
				object { cut rotate y*55 }
				object { cut rotate y*60 }
				object { cut rotate y*65 }
				object { cut rotate y*70 }
				object { cut rotate y*75 }
				object { cut rotate y*80 }
				object { cut rotate y*85 }
				object { cut rotate y*90 }
				object { cut rotate y*95 }
				object { cut rotate y*100 }
				object { cut rotate y*105 }
				object { cut rotate y*110 }
				object { cut rotate y*115 }
				object { cut rotate y*120 }
				object { cut rotate y*125 }
				object { cut rotate y*130 }
				object { cut rotate y*135 }
				object { cut rotate y*140 }
				object { cut rotate y*145 }
				object { cut rotate y*150 }
				object { cut rotate y*155 }
				object { cut rotate y*160 }
				object { cut rotate y*165 }
				object { cut rotate y*170 }
				object { cut rotate y*175 }
				box { <-100, -100, -100>, <100, -11, 100> }
				box { <-100, 11, -100>, <100, 100, 100> }
				box { <-100, -9, -100>, <100, -8, 100> }
				box { <-100, -5.1, -100>, <100, -4.1, 100> }
				box { <-100, -.5, -100>, <100, .5, 100> }
				box { <-100, 4.1, -100>, <100, 5.1, 100> }
				box { <-100, 8, -100>, <100, 9, 100> }
			}
			rotate z*90 
			translate x*15
		}                             
	#end
	torus { 30, 3 scale y*4 rotate z*90 translate x*15 }
	union
	{
		difference
		{
			cylinder { <3, 0, 0>, <27, 0, 0> 27 }
			cylinder { <0, 0, 0>, <30, 0, 0> 24 }
		}
		union
		{
			object { spoke }
			object { spoke rotate x*30 }
			object { spoke rotate x*60 }
			object { spoke rotate x*90 }
			object { spoke rotate x*120 }
			object { spoke rotate x*150 }
			object { spoke rotate x*180 }
			object { spoke rotate x*210 }
			object { spoke rotate x*240 }
			object { spoke rotate x*270 }
			object { spoke rotate x*300 }
			object { spoke rotate x*330 }
			cylinder { <7, 0, 0>, <23, 0, 0> 7 }
			cylinder { <-20, 0, 0>, <10, 0, 0> 3 texture { armortex } }
		}
		intersection
		{ 
			union
			{
				cylinder { <28, 0, 0>, <29, 0, 0> 30 }
				cone { <28.9, 0, 0> 30, <30.9, 0, 0> 0 }
				difference
				{
					cone { <29, 0, 0> 30, <31, 0, 0> 0 }
					difference
					{
						cylinder { <0, 0, 0>, <50, 0, 0> 21 }
						cylinder { <0, 0, 0>, <50, 0, 0> 20 }
					}
					difference
					{
						cylinder { <0, 0, 0>, <50, 0, 0> 13 }
						cylinder { <0, 0, 0>, <50, 0, 0> 12 }
					}
				}
			}
			union
			{ 
				cylinder { <0, 0, 0>, <50, 0, 0> 27 }     
				box { <0, -50, -5>, <50, 50, 5> }
				box { <0, -50, -5>, <50, 50, 5> rotate x*30 }
				box { <0, -50, -5>, <50, 50, 5> rotate x*60 }
				box { <0, -50, -5>, <50, 50, 5> rotate x*90 }
				box { <0, -50, -5>, <50, 50, 5> rotate x*120 }
				box { <0, -50, -5>, <50, 50, 5> rotate x*150 }
			}
		}
		texture {extratex}
	}
	pigment { Gray20 }  
}

#declare wheels = union
{
	object { wheel scale x*-1 translate <-50, 0, -50> }
	object { wheel scale x*-1 translate <-50, 0, 50> }
	object { wheel translate <50, 0, -50> }
	object { wheel translate <50, 0, 50> }
}


union
{              
	object { body }
	object { turret }
	object { wheels }
//	object { spoke }
	translate y * 34
	scale 1/120
	scale 8 * Meters
	scale Scale_Mecha
	rotate y * 135
	rotate y * clock * 360
}