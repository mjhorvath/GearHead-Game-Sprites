// Persistence of Vision Ray Tracer Scene Description File
// File: boulder.pov
// Vers: 3.6
// Desc: Mesh based boulder with texturing
// Date: 06/12/06
// Auth: Abe Madey  bullfrog AT taconic DOT net 
// 
// My objectives here were to: 
// 1. Get a decent looking mesh based boulder.  
// I decided to use the rock maker macro by John VanSickle (http://enphilistor.50megs.com/index.htm).
// A mesh can provide some nice straight edges which help give a rock a "sharp" look (something that is
// a little more difficult with isosurfaces. On the other hand, meshes come with their own chalanges,
// most notably the "shadow line" artifact. I tried mitigating this with the use of area lights with
// only moderate success.
// So, to state the obvious, the "makerock.inc" and "filerock.inc" macros are required. They are
// with this scene (with permission), but are also available from http://enphilistor.50megs.com/inc.htm
// along with instructions.
//
// 2. Fill in the details with a decent perturbed normal texture 
// The wrinkles pattern is an implementation of the classic 1/f summed perlin noise and works well 
// for texturing rough surfaces. There are, however, two things which can significantly affect how the
// wrinkles pattern (and some others too) renders. The first is the difference between using 
//      wrinkles
// or using 
//      pigment_pattern{wrinkles}
// in the normal statement. The latter is, to my eyes, more defined and is employed here. The second aspect
// is the use of the accuracy modifier (which only applies to non "traditional" POV normal patterns). It 
// basically determines the spacing between points for taking the local derivative (and hence getting 
// the gradient or slope). The default is 0.02. Changing this can have a dramatic effect on the
// appearance of the normal. In this scene it is set to .001 in order to get a crisper appearance. Note
// that anti-aliasing can knock out some of the finer detail.
//
// 3. Put some lichens on the rock using procedural textures (actually an after thought). 
// This is mainly an exercise in procedural texturing.      

#version 3.7;
#declare Show_AxisMarker = 0;
#declare Show_BasicFloor = 0;
#include "functions.inc"
#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code

//***********SCENE VARIABLES****************    

//makerock.inc parameters
#local Seed		= 15;
#local Smooth		= 1;
#local Splits		= 5;
#local Size		= 0.6;
#local Rough		= -0.6;
#local Omega		= 0.40;
#local Rounding		= 1;
#local FileName		= "bouldermesh.inc" //file name used if writing to a file

#local Seed		= 15;
#local Smooth		= 1;
#local Splits		= 5;
#local Size		= 0.6;
#local Rough		= -0.6;
#local Omega		= 0.40;
#local Rounding		= 1;
#local FileName		= "bouldermesh.inc" //file name used if writing to a file

//other controls   
#local WriteToFile	= no; //this is to invoke "filemesh.inc" to write the mesh to an inc file.
#local ReadFromFile	= no; //this is to invoke reading the previously written mesh file. 
#local RockTrans	= transform {rotate -y * 55}                 


//basic rock texture
#local RockTex = texture
{
	pigment
	{
		slope y  
		cubic_wave
		color_map
		{
			[0 gamma_color_adjust(<0.25,0.25,0.25>)  transmit 0]
			[1 gamma_color_adjust(<0.6,0.6,0.6>)   transmit 0]
		}
	}
/*
	normal
	{
		pigment_pattern {wrinkles scale 0.35 poly_wave 3}
		//wrinkles  scale 0.1 poly_wave 2
		bump_size 1.8
		accuracy 0.001
	}
	finish {brilliance 1}
*/
} 



#local f_absnoise3d = function {pow(abs(2 * f_noise3d(x,y,z) - 1), 0.3)}

#macro Turb()
	scale 2
	warp {turbulence 1 lambda 3 octaves 3}
	scale 1/2
	scale 0.05
#end

#local Spots = function {pattern {crackle form x}}

#macro LichenPig(Ltcol, Medcol, Dkcol, Coverage)
	pigment_pattern
	{
		function {Spots(x,y,z)} 
		color_map
		{
			[0 rgb 1]
			[Coverage rgb 0]
		}
		translate 10         
		scale 2
		warp {turbulence 0.3 lambda 2.5 octaves 4}
		scale 1/2 
		scale 1.5
	} 
	pigment_map
	{
		[
			0.00 
			function {f_noise3d(x,y,z)}
			Turb()
			color_map
			{
				[0.00 rgb Ltcol transmit 1]
				[1.00 rgb Dkcol transmit 1]
			}
		]
		[
			0.01 
			function {f_noise3d(x,y,z)} 
			Turb()
			color_map
			{
				[0.00 rgb Ltcol transmit 0]
				[1.00 rgb Dkcol transmit 0]
			}
		]
		[
			0.15 
			function {f_absnoise3d(x,y,z)}
			Turb()
			color_map
			{
				[0.05 rgb Medcol transmit 1]
				[0.05 rgb Medcol transmit 0]
				[1.00 rgb Dkcol  transmit 0]
			}
		]
	}
	scale .25
#end 

#local LichenTex = texture
{
	pigment
	{
		planar
		pigment_map
		{
			#local LichenLt		= gamma_color_adjust(<0.6431,0.6863,0.5686>);
			#local LichenMed	= gamma_color_adjust(<0.5451,0.5843,0.4863>);
			#local LichenDk		= gamma_color_adjust(<0.3569,0.4235,0.3137>);
			#local i = 0;
			#while (i < 100)
				[i/100 LichenPig(LichenLt, LichenMed, LichenDk, 0.6*(i/100))]
				#local i = i + 1;
			#end
		}
	}
/*
	normal
	{
		pigment_pattern
		{
			planar
			pigment_map
			{
				#local LichenLt		= gamma_color_adjust(<1.0,1.0,1.0>);
				#local LichenMed	= gamma_color_adjust(<0.5,0.5,0.5>);
				#local LichenDk		= gamma_color_adjust(<0.0,0.0,0.0>);
				#local i = 0;
				#while (i < 100)
					[
						i/100
						average
						pigment_map
						{
							[1 LichenPig(LichenLt, LichenMed, LichenDk, 0.6*(i/100))]
							[1 pigment_pattern {wrinkles scale 0.25 poly_wave 2}]
						}
					]
					#local i = i + 1;
				#end
			}
		} 
		accuracy 0.005 
		bump_size 0.25
	}
	finish {brilliance 2}
*/
}

#if (WriteToFile)
	#include "filerock.inc"
#end

#if (ReadFromFile)
	#local Rock = object {#include FileName}
#else   
	#local Rock = object {#include "makerock.inc"}
#end

// the texture is intentionally left black where the smaller rock is cut out of the larger
difference
{
	object
	{
		Rock
		texture {RockTex}
		texture {LichenTex}
	}
	plane {+y, 0}
	difference
	{
		object
		{
			Rock
			scale 1/2
			rotate y * 0
			translate <0,0,-1/3>
		}
		plane {+y, +0.1}
	}
//	texture {RockTex}
	double_illuminate
	transform {RockTrans}
	scale 32
	rotate y * -90
}
