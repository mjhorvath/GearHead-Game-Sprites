// Desc: textures for terrain generator
// Auth: Michael Horvath
// Home: http://isometricland.com

#ifndef (Height) #declare Height = 32; #end
#ifndef (Width) #declare Width = 64; #end
#ifndef (Seed) #declare Seed = seed(9823); #end
#ifndef (MaxSteps) #declare MaxSteps = 3; #end
#ifndef (StepHeight) #declare StepHeight = 32; #end

#include "Common_Textures.inc"		// generic textures used by all sprites in common

global_settings { number_of_waves 1 }

// 1) include grass tex include file
#include "grasstex.inc"			// Grass Texture Include by Rune

// 2) define camera location
#declare camera_location = Camera_Location;

// 3) define grass tex options
#declare gt_height = 1/16;
#declare gt_color = <0.50,0.65,0.30> * 1/2;
#declare gt_samples = 1000;

// 4) define the textures
#declare RealGrass_Ground = texture
{
	gt_ground()
	finish {Default_Finish}
	normal {bumps 0.5 scale 0.01}
}
#declare RealGrass_Grass = texture
{
	gt_grass()
	finish {Default_Finish}
}
#declare RealGrass_Flowers = texture
{
	gt_flowers()
	finish {Default_Finish}
}

// -------------------------------------------------------------
// ground

// green->green->beige bozo
#declare Grass_Texture_a = texture
{

	pigment
	{
		granite
		color_map
		{
			[0 gamma_color_adjust(<065,105,060,>/255)]
//			[0 gamma_color_adjust(<073,116,060,>/255)]
			[1 gamma_color_adjust(<080,125,060,>/255)]
		}
		translate frame_number
		scale 32
		noise_generator 3
		warp
		{
			turbulence 4
		}
	}
	finish {Default_Finish}
	normal
	{
		bozo 1
	}
	scale 32
	no_bump_scale
}

// brown->beige height gradient
#declare Grass_Texture_b = texture
{

	pigment
	{
		gradient y
		pigment_map
		{
			[0 gamma_color_adjust(<098,064,030,>/255)]
			[1 gamma_color_adjust(<140,123,093,>/255)]
		}
		scale Height
	}
	finish {Default_Finish}
/*
	normal
	{
		bozo 32
		scale 32
	}
*/
	no_bump_scale
}

// mottled grass texture
#declare Grass_Texture_c = texture
{
	// green->green bozo
	#local GreenBorder_Pattern = pigment
	{
		granite
		color_map
		{
			[0   gamma_color_adjust(<064,104,072,>/255)]
			[1   gamma_color_adjust(<088,132,063,>/255)]
	//		[1/2 gamma_color_adjust(<088,132,063,>/255*4/4)]
	//		[1   gamma_color_adjust(<140,123,093,>/255*4/4)]
		}
	//	scale 16
		warp
		{
			turbulence 0
		}
	}
	
	// green->green->beige bozo
	#local GreenGrass_Pattern = pigment
	{
		granite
		color_map
		{
			[0   gamma_color_adjust(<064,104,072,>/255)]
			[1/2 gamma_color_adjust(<088,132,063,>/255)]
			[1   gamma_color_adjust(<140,123,093,>/255)]
		}
	//	scale 16
		warp
		{
			turbulence 0
		}
	}
	pigment
	{
		spherical
		pigment_map
		{
			[0 GreenBorder_Pattern]
//			[0 GreenGrass_Pattern]
			[1 GreenGrass_Pattern]
		}
		warp
		{
			turbulence 0
		}
	}
	scale 32
	finish {Default_Finish}
/*
	normal
	{
		bozo 32
		scale 32
	}
*/
	no_bump_scale
}

// beige->blonde height gradient
#declare Desert_Texture_a = texture
{

	pigment
	{
		gradient y
		pigment_map
		{
			[0 gamma_color_adjust(<148,141,084,>/255)]
			[1 gamma_color_adjust(<240,236,179,>/255)]
		}
		scale Height
	}
	finish {Default_Finish}
/*
	normal
	{
		bozo 32
		scale 32
	}
*/
	no_bump_scale
}

// swirly dirt. use with small boulders
#declare Desert_Texture_b = texture
{
	pigment
	{
		bozo
		color_map
		{
			[0 gamma_color_adjust(<148,141,084,>/255)]
			[1 gamma_color_adjust(<240,236,179,>/255)]
		}
		translate frame_number
		scale 32
		noise_generator 3
		warp
		{
			turbulence 4
		}
	}
	finish {Default_Finish}
	normal
	{
		bozo 32
		scale 32
	}
	rotate x * 90
	scale 32
	no_bump_scale
}

#declare Desert_Texture_c = texture
{
	average
	texture_map
	{
		[0 Desert_Texture_a]
		[1 Desert_Texture_b]
	}
}

// swirly gravel. use with small boulders
#declare Gravel_Texture_a = texture
{

	pigment
	{
		bozo
		color_map
		{
			[0 gamma_color_adjust( 96/255*<1,1,1>)]
			[1 gamma_color_adjust(192/255*<1,1,1>)]
		}
		translate frame_number
		scale 32
		noise_generator 3
		warp
		{
			turbulence 4
		}

	}
	finish {Default_Finish}
	normal
	{
		bozo 32
		scale 32
	}
	rotate x * 90
	scale 32
	no_bump_scale
}


// sepid marsh texture
#declare Marsh_Texture_a = texture
{
	// green->blue bozo
	#local Putrid_Pattern = pigment
	{
		bozo
		color_map
		{
			[0 gamma_color_adjust(<073,116,060,>/255)]
			[1 gamma_color_adjust(<000,087,166,>/255)]
		}
		warp
		{
			turbulence 2
		}
		noise_generator 1
		translate frame_number
	}
	// green bozo
	#local GreenEdges_Pattern = pigment {gamma_color_adjust(<064,104,072,>/255*4/4)}
	pigment
	{
		spherical
		pigment_map
		{
			[0 GreenEdges_Pattern]
//			[1/2 Putrid_Pattern]
			[1 Putrid_Pattern]
		}
	}
	scale Width/2
	finish {Default_Finish}
/*
	normal
	{
		bozo 32
		scale 32
	}
*/
	no_bump_scale
}

// sepid marsh texture
#declare Marsh_Texture_b = texture
{
	// green->blue bozo
	#local Putrid_Pattern = pigment
	{
		bozo
		color_map
		{
//			[0 gamma_color_adjust(<140,123,093,>/255)]
			[0 gamma_color_adjust(<073,116,060,>/255)]
//			[1 gamma_color_adjust(<000,087,166,>/255)]
			[1 gamma_color_adjust(<000,044,044,>/255)]
		}
		warp
		{
			turbulence 2
		}
		noise_generator 1
	}
	// green bozo
	#local GreenEdges_Pattern = pigment
	{
		bozo
		color_map
		{
			[0 gamma_color_adjust(<064,104,072,>/255)]
//			[1 gamma_color_adjust(<088,132,063,>/255)]
//			[1 gamma_color_adjust(<140,123,093,>/255)]
		}
		warp
		{
			turbulence 0
		}
	}
	pigment
	{
		spherical
		pigment_map
		{
			[0   GreenEdges_Pattern]
			[1/2 Putrid_Pattern]
			[1   Putrid_Pattern]
		}
	}
	scale Width/2
	finish {Default_Finish}
/*
	normal
	{
		bozo 32
		scale 32
	}
*/
	no_bump_scale
}

// swirly dirt. use with small boulders
#declare Dirt_Texture_a = texture
{

	pigment
	{
//		color rgb <72,120,56,>/255

		granite
		color_map
		{
			[0 gamma_color_adjust(<098,064,030,>/255)]
			[1 gamma_color_adjust(<140,120,093,>/255)]
//			[1 gamma_color_adjust(<160,160,080,>/255)]
		}
		translate frame_number
		scale 32
		noise_generator 3
		warp
		{
			turbulence 4
		}

	}
	finish {Default_Finish}
/*
	normal
	{
		bozo 32
		scale 32
	}
*/
	rotate x * 90
	scale 32
	no_bump_scale
}

#declare Dirt_Texture_b = texture
{

	pigment
	{
		bozo
		pigment_map
		{
			[0 gamma_color_adjust(<140,123,093,>/255)]
			[1 gamma_color_adjust(<140,123,093,>/255/4)]
		}
		translate frame_number
		scale 1
	}
	finish {Default_Finish}
/*
	normal
	{
		bozo 32
		scale 32
	}
*/
	no_bump_scale
}

// -------------------------------------------------------------
// hills

#declare Hills_Texture_a = texture
{
	pigment
	{
		gradient y
		color_map
		{
			[0   gamma_color_adjust(<072,120,056,>/255)]
			[1/2 gamma_color_adjust(<160,160,080,>/255 * 5/4)]
			[1   gamma_color_adjust(<1,1,1>)]
		}
		scale StepHeight * MaxSteps * 1.0000001
	}
	finish {Default_Finish}
}

#declare Hills_Texture_b = texture
{
	pigment
	{
		gradient y
		color_map
		{
			[0   gamma_color_adjust(<064,104,072,>/255)]
			[1/2 gamma_color_adjust(<140,123,093,>/255)]
			[1   gamma_color_adjust(<1,1,1>)]
		}
		scale StepHeight *  MaxSteps * 1.0000001
	}
	finish {Default_Finish}
}

#declare Hills_Texture_c = texture
{
	#local Body_Pigment = pigment
	{
		gradient y
		color_map
		{
			[0   gamma_color_adjust(<073,116,060,>/255)]
			[1/3 gamma_color_adjust(<160,160,080,>/255 * 5/4)]
			[1   gamma_color_adjust(<1,1,1>)]
		}
	}
	#local Cap_Pigment = pigment
	{
		color rgb 1
	}
	pigment
	{
		gradient y
		pigment_map
		{
			[00/12 Body_Pigment]
			[10/12 Body_Pigment]
//			[10/12 Cap_Pigment]
//			[12/12 Cap_Pigment]
			[12/12 Body_Pigment]
		}
		scale StepHeight *  MaxSteps * 1.0000001
	}
	finish {Default_Finish}
}

#declare Hills_Texture_d = texture
{
	pigment
	{
		#local Scale = Height * (MaxSteps-1) + StepHeight;
		gradient y
		color_map
		{							// old settings for when light intensity was 1 and ambient was 0
			[0   gamma_color_adjust(<072,120,056,>/255)]		// should use 080,125,060?
			[1/2 gamma_color_adjust(<072,120,056,>/255)]		// 2/3
			[3/4 gamma_color_adjust(<140,120,093,>/255)]		// <160,160,080,>/255 * 5/4
			[7/8 gamma_color_adjust(3/4)]
			[7/8 gamma_color_adjust(1)]
			[1   gamma_color_adjust(1)]
		}
		scale 2 * Scale * 1.0000001
		translate y * Scale
		noise_generator 3
		warp
		{
			black_hole <0,0,0,>, Height/2
			repeat Height
			strength 10
			falloff 3
			turbulence Height/8
			inverse
		}
		warp
		{
			turbulence 4
		}
	}
	finish
	{
		Default_Finish
//		crand 0.00
	}
	normal
	{
//		wrinkles 0.1
		dents 0.5
	}
}

// -------------------------------------------------------------
// water

// textures for water generator
#declare Water_Step1 = texture
{
	pigment
	{
		gradient y
		color_map
		{
			[0 gamma_color_adjust(<000,000,192,>/255)]
			[1 gamma_color_adjust(<000,000,255,>/255)]
		}
		scale 32 *  MaxSteps * 1.0000001
	}
}

#declare Water_Step2 = texture
{
	pigment
	{
		gradient y
		color_map
		{
			[0 gamma_color_adjust(<000,000,128,>/255)]
			[1 gamma_color_adjust(<000,000,192,>/255)]
		}
		scale 32 *  MaxSteps * 1.0000001
	}
}

#declare Water_Step3 = texture
{
	pigment
	{
		gradient y
		color_map
		{
			[0 gamma_color_adjust(<000,000,064,>/255)]
			[1 gamma_color_adjust(<000,000,128,>/255)]
		}
		scale 32 *  MaxSteps * 1.0000001
	}
}

#declare Water_Surface = texture
{
	pigment
	{
		gamma_color_adjust(<3/4,3/4,4/4,>)
		scale 32 *  MaxSteps * 1.0000001
	}
}

#declare Water_Texture_a = texture
{
	pigment {gamma_color_adjust(<0/4,1/4,2/4>) transmit 2/4}
	finish
	{
		specular 1
		brilliance 1
		reflection {0.1}
//		ambient 0
//		diffuse 0
	}
}

#declare Water_Texture_b = texture
{
	pigment {gamma_color_adjust(<0/4,1/4,2/4>) transmit 2/4}
	normal
	{
		bumps
		scale 2
		translate frame_number
	}
	finish
	{
		specular 1
		brilliance 1
		reflection {0.1}
//		ambient 0
//		diffuse 0
	}
}

#declare Stripe_Texture_a = texture
{
	pigment {gamma_color_adjust(<3/4,3/4,3/4>)}
	finish {Default_Finish}
}

#declare Road_Texture_a = texture
{
	pigment {gamma_color_adjust(<1/4,1/4,1/4>)}
	finish {Default_Finish}
}
