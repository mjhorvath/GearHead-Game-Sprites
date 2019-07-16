// Desc: textures for walls generator
// Auth: Michael Horvath
// Home: http://isometricland.com

#include "Common_Textures.inc"		// generic textures used by all sprites in common

// -------------------------------------------------------------
// Tube Walls

// guts - the innards of a frightening beast generated using TexRD

#declare Guts_Texture = texture
{
	pigment
	{
		image_pattern {png "../../walls/povray/texture_bowels.png"}
		color_map
		{
			[0 gamma_color_adjust(x/2)]
			[1 gamma_color_adjust(x)]
		}
	}
	finish {Default_Finish}
	translate x * Height/Width/2
	rotate y * 180
	scale Width	// square texture
}

#declare Guts_Roof_Texture = texture
{
	pigment
	{
		image_pattern {png "../../walls/povray/texture_bowels.png"}
		color_map
		{
			[0 gamma_color_adjust(x/2)]
			[1 gamma_color_adjust(x)]
		}
	}
	finish {Default_Finish}
	translate x * 0.5
	rotate y * 180
	scale Width	// square texture
	scale 2
	rotate x * 090
	translate z * Width/2
}

#declare Concrete_Texture = texture
{
	#local Concrete_Pigment_c = pigment
	{
		gradient y
		color_map
		{
			[0   gamma_color_adjust(x/2)]
			[1/8 gamma_color_adjust(x/2)]
			[2/8 gamma_color_adjust(x)]
			[7/8 gamma_color_adjust(x)]
		}
		scale Height/4
	}
	#local Concrete_Pigment_d = pigment
	{
		gradient y
		color_map
		{
			[0   gamma_color_adjust(x*3/4)]
			[1/8 gamma_color_adjust(x*3/4)]
			[2/8 gamma_color_adjust(x)]
			[7/8 gamma_color_adjust(x)]
		}
		turbulence 1
		scale Height/4
	}
	#local Concrete_Pigment_e = pigment {gamma_color_adjust(x/2)}
	#local Concrete_Pigment_f = pigment
	{
		average
		pigment_map
		{
			[2 Concrete_Pigment_c]
			[2 Concrete_Pigment_d]
		}
	}
	pigment
	{
		wrinkles
		pigment_map
		{
			[0   Concrete_Pigment_f]
			[3/4 Concrete_Pigment_f]
			[1   Concrete_Pigment_e]
		}
	}
	normal {wrinkles}
	finish {Default_Finish}
	scale 4
	no_bump_scale
}

// -------------------------------------------------------------
// Normal maps

// a techy looking bump map texture generated using HullGen
#declare Techy_Texture_a = texture
{
	pigment {gamma_color_adjust(x)}
	normal
	{
		bump_map {png "../../walls/povray/texture_techy_a.png" bump_size 1}
	}
	finish {Phong_Shiny}
	scale Height	// square texture
}

#declare Techy_Roof_Texture_a = texture
{
	Techy_Texture_a
//	scale Width/Height
	rotate x * 090
	translate z * Width/2
}

// a techy looking bump map texture generated using HullGen
#declare Techy_Texture_b = texture
{
	pigment {gamma_color_adjust(x)}
	normal
	{
		bump_map {png "../../walls/povray/texture_techy_b.png" bump_size 1}
	}
	finish {Phong_Shiny}
	scale Height	// square texture
}

#declare Techy_Roof_Texture_b = texture
{
	Techy_Texture_b
//	scale Width/Height
	rotate x * 090
	translate z * Width/2
}

// -------------------------------------------------------------
// faceted

#declare Faceted_Normal_a = normal
{
	// pattern for use in normal {}
	// not usable in pigments
	facets          // generates facets on the surface
	coords 0.5      // for flat surfaces
	//size 1.0      // for curved surfaces
	no_bump_scale
	scale 8
}

// faceted wall
#declare FacetedWall_Texture_b = texture
{
	pigment
	{
//		gamma_color_adjust(<154,118,073,>/255)
//		gamma_color_adjust(<192,160,128,>/255)
		bozo
		color_map
		{
			[0 gamma_color_adjust(<1/2,1/2,1/2>)]
			[1 gamma_color_adjust(<154,118,073,>/255)]
		}
		scale 32
	}
	finish {Default_Finish}
	normal
	{
		facets
		coords 0.5
		warp {turbulence y * 0}
		noise_generator 3
		scale 64
	}
	no_bump_scale
}

#declare FacetedWall_Texture_c = texture
{
	pigment
	{
		// solid pattern for use in texture/pigment/normal(/density)
		// create a hexagonal pattern texture with 3 colors
		// hexagons are in the X-Z plane, extending infinitely in Y plane
//		hexagon
//		color blue 1,
//		color red 1,
//		color green 1
		gamma_color_adjust(1)
	}
	finish {Default_Finish}
	normal
	{
		// pattern for use in texture/pigment/normal/density
		crackle   32      // crackled pattern
		// pattern for use in texture/pigment/normal/density
//		granite 8        // create a granite-like texture
		//granite 0.5  // for use with normal{} (0...1 or more)

	}
	scale 8
	no_bump_scale
}

#declare FacetedWall_Texture_d = texture
{
	pigment
	{
		crackle
		color_map
		{
			[0 gamma_color_adjust(<1/3,1/3,1/3>)]
			[1 gamma_color_adjust(<2/3,2/3,2/3>)]
		}
		warp
		{
			turbulence y * 0.0
		}
		noise_generator 3
	}
	finish
	{
		Default_Finish
//		crand 0.2
	}
	normal
	{
		// pattern for use in texture/pigment/normal/density
		crackle   8      // crackled pattern
		warp
		{
			turbulence y * 0.0
		}
		noise_generator 3
	}
	scale 8
	no_bump_scale
}

#declare FacetedWall_Texture_e = texture
{
	pigment
	{
		crackle
		color_map
		{
			[0 gamma_color_adjust(<1/2,1/2,1/2>)]
			[1/2 gamma_color_adjust(<098,064,030,>/255)]
			[1 gamma_color_adjust(<140,123,093,>/255)]
		}
		warp
		{
			turbulence y * 0.0
		}
		noise_generator 3
	}
	finish
	{
		Default_Finish
//		crand 0.2
	}
	normal
	{
		// pattern for use in texture/pigment/normal/density
		crackle   8      // crackled pattern
		warp
		{
			turbulence y * 0.0
		}
		noise_generator 3
	}
	scale 8
	no_bump_scale
}

// -------------------------------------------------------------
// simplistic brick wall

#macro BrickWall_Texture_a()
	#local board_length = 1/Cols;
	#local board_height = 1/Rows;
	texture
	{
		pigment
		{
			cells
			color_map
			{
				[0 gamma_color_adjust(x/2)]
				[1 gamma_color_adjust(x)]
			}
			scale <board_length,board_height,board_length,>
			warp
			{
				repeat x * board_length * 2
			}
			warp
			{
				repeat z * board_length * 2
			}
			warp
			{
				repeat y * board_height
				offset <board_length/2,2,board_length/2,>
			}
		}
		finish {Default_Finish}
		no_bump_scale
		scale <Width,Height,Width,>
	}
#end

#macro BrickWall_Texture_c()
	#local board_length = 1/Cols;
	#local board_height = 1/Rows;
	texture
	{
		pigment
		{
			cells
			color_map
			{
				[0   gamma_color_adjust(x)]
				[1   gamma_color_adjust(x/2)]
			}
			scale <board_length,board_height,board_length,>
			warp
			{
				repeat x * board_length * 2
			}
			warp
			{
				repeat z * board_length * 2
			}
			warp
			{
				repeat y * board_height
				offset <board_length/2,2,board_length/2,>
			}
		}
		finish {Default_Finish}
		no_bump_scale
		scale <Width,Height,Width,>
	}
#end

// -------------------------------------------------------------
// fence. use Thick = 0

// last remaining baked-in grade pigment
#declare Fence_Wall_Texture = texture
{
	#local pigment_a = pigment
	{
		gradient y
		color_map
		{
			[-1/4 gamma_color_adjust(<0,0,0>)]
			[1    gamma_color_adjust(x)]
		}
		scale Height
		rotate z * -45
	}
	#local pigment_b = pigment
	{
		color rgbt <1,1,1,1,>
	}

	#local pigment_c = pigment
	{
		gradient y
		pigment_map
		{
			[00/16 pigment_b]
			[07/16 pigment_b]
			[07/16 pigment_a]
			[09/16 pigment_a]
			[09/16 pigment_b]
			[16/16 pigment_b]
		}
	}
	pigment
	{
		gradient x
		pigment_map
		{
			[00/16 pigment_c]
			[07/16 pigment_c]
			[07/16 pigment_a]
			[09/16 pigment_a]
			[09/16 pigment_c]
			[16/16 pigment_c]
		}
		rotate z * 45
		scale 1/cos(pi/4)
	}
	finish {Default_Finish}
}

// -------------------------------------------------------------
// wood plank

#declare WoodPlank_Pigment_a = pigment
{
	wood
	color_map
	{
		[0 gamma_color_adjust(x*3/3)]
		[1 gamma_color_adjust(x*3/3*8/8)]
	}
	warp
	{
		black_hole <rand(Seed), rand(Seed), rand(Seed)>, 0.5
		turbulence 1/100
	}
	warp
	{
		black_hole <rand(Seed), rand(Seed), rand(Seed)>, 0.5
		turbulence 1/100
	}
	warp
	{
		black_hole <rand(Seed), rand(Seed), rand(Seed)>, 0.5
		turbulence 1/100
	}
	scale x * 1/Width/2
	scale z * 1/Width/2
	scale y * Height
	rotate y * 45
}

#declare WoodPlank_Pigment_b = pigment
{
	wood
	color_map
	{
		[0 gamma_color_adjust(x*1/3)]
		[1 gamma_color_adjust(x*1/3*8/8)]
	}
	warp
	{
		black_hole <rand(Seed), rand(Seed), rand(Seed)>, 0.5
		turbulence 1/100
	}
	warp
	{
		black_hole <rand(Seed), rand(Seed), rand(Seed)>, 0.5
		turbulence 1/100
	}
	warp
	{
		black_hole <rand(Seed), rand(Seed), rand(Seed)>, 0.5
		turbulence 1/100
	}
	scale x * 1/Width/2
	scale z * 1/Width/2
	scale y * Height
	rotate y * 45
}

#declare WoodPlank_Texture_b = texture
{
	#local board_length = 1;
	#local board_width = 1/6;
	pigment
	{
		cells
		pigment_map
		{
			[0/2 WoodPlank_Pigment_a]
			[2/2 WoodPlank_Pigment_b]
		}
		scale <board_width,board_length,board_width,>

//		warp
//		{
//			turbulence 1/200
//		}
		warp
		{
			repeat z * board_width
			offset y * board_length / 4 * 7
		}
		warp
		{
			repeat x * board_width
			offset y * board_length / 4 * 7
		}
		warp
		{
			repeat y * board_length * 2
		}

	}
	finish {Default_Finish}
/*
	normal
	{
		cells
		slope_map
		{
			[0    <0,1>]
//			[1/16 <0,0>]
//			[1/16 <1/2,0>]
//			[1/2  <1/2,0>]
			[1    <1,1>]
		}
		bump_size 1
		scale <board_width,board_length,board_width,>

//		warp
//		{
//			turbulence 1/200
//		}
		warp
		{
			repeat z * board_width
			offset y * board_length / 4 * 7
		}
		warp
		{
			repeat x * board_width
			offset y * board_length / 4 * 7
		}

	}
*/
	scale <Width,Height,Width,>
}

// -------------------------------------------------------------
// stone block

#declare StoneBlock_Texture_b = texture
{
	#local board_length = 1/2;
	#local board_width = 1/6;
	#local Pig_1 = pigment
	{
		bozo
		color_map
		{
			[0 gamma_color_adjust(<1/3,1/3,1/3>)]
			[1 gamma_color_adjust(<2/3,2/3,2/3>)]
		}
	}
	#local Pig_2 = pigment
	{
		crackle
		color_map
		{
			[0 gamma_color_adjust(<1/3,1/3,1/3>)]
			[1 gamma_color_adjust(<2/3,2/3,2/3>)]
		}
	}
	pigment
	{
		crackle
		pigment_map
		{
			[0 Pig_1]
			[1 Pig_2]
		}
		scale <board_length,board_width,1,>
		warp
		{
			repeat x * board_length * 2
		}
		warp
		{
			repeat y * board_width
			offset x * board_length / 2
		}
		warp
		{
			repeat y * board_width * 2
			offset z * 1
		}
	}
	finish {Default_Finish}
	normal
	{
		boxed
		slope_map
		{
//			[0 <0,10000000>]
			[0 <0,0>]
			[1/16 <1,0>]
			[1 <1,0>]
		}
		bump_size 1/8
		scale <board_length,board_width,1,>
		warp
		{
			repeat x * board_length
		}
		warp
		{
			repeat y * board_width
			offset x * board_length / 2
		}
	}
	scale <Width,Height,Width,>
}

#declare StoneBlock_Texture_c = texture
{
	pigment
	{
		crackle
		color_map
		{
			[1/16 gamma_color_adjust(x*4/16)]
			[9/16 gamma_color_adjust(x*12/16)]
		}
		warp { turbulence <1,1,1>/4 octaves 3 lambda 1.5 omega 0.3 }
		noise_generator 3
		scale Width/8
	}
	finish {Default_Finish}
	normal
	{
		// pattern for use in texture/pigment/normal/density
		crackle   8      // crackled pattern
		warp { turbulence <1,1,1>/4 octaves 3 lambda 1.5 omega 0.3 }
		noise_generator 3
		scale Width/8
	}
	no_bump_scale
}

#declare StoneBlock_Texture_d = texture
{
	pigment
	{
		crackle
		color_map
		{
			[1/16 gamma_color_adjust(x*4/16)]
			[9/16 gamma_color_adjust(x*12/16)]
		}
		warp {turbulence <1,1,1>/4 octaves 3 lambda 1.5 omega 0.3}
		noise_generator 3
		scale 2
		scale Width/8
	}
	finish {Default_Finish}
	normal
	{
		crackle 8
		warp {turbulence <1,1,1>/4 octaves 3 lambda 1.5 omega 0.3}
		noise_generator 3
		scale 2
		scale Width/8
	}
//	no_bump_scale
}

// -------------------------------------------------------------
// wrinkles

#declare Wrinkle_Texture_a = texture
{
	pigment
	{
		wrinkles
		color_map
		{
			[0/4 gamma_color_adjust(x)]
			[3/4 gamma_color_adjust(x)]
			[4/4 gamma_color_adjust(<1/4,1/4,1/4>)]
		}
		scale 4
	}
	normal {wrinkles scale 4}
	finish {Default_Finish}
	no_bump_scale
}

#declare Wrinkle_Texture_b = texture
{
	#local Concrete_Pigment_a = pigment
	{
		gamma_color_adjust(x)
	}
	#local Concrete_Pigment_b = pigment
	{
		gradient y
		color_map
		{
			[0 gamma_color_adjust(x)]
			[1 gamma_color_adjust(y)]
		}
		scale Height/4
	}
	pigment
	{
		wrinkles
		pigment_map
		{
			[0/4 Concrete_Pigment_a]
			[3/4 Concrete_Pigment_a]
			[4/4 Concrete_Pigment_b]
		}
	}
	normal {wrinkles}
	finish {Default_Finish}
	scale 4
	no_bump_scale
}

// -------------------------------------------------------------
// misc.

#declare Wall_Glass_Texture = texture
{
	finish {F_Glass5}
	pigment {color rgbt 1}
}

#declare Anodized_Metal_Texture = texture
{
	pigment {gamma_color_adjust(x)}
	finish {Phong_Dull}
	normal
	{
		facets
		coords 1/8
		scale Width/4
	}
}

#declare Metal_Post_Texture = texture
{
	pigment {P_Chrome3}
	finish {Shiny}
}

#declare Razor_Coil_Texture = texture
{
	pigment {P_Silver3}
	finish {F_MetalA}
}

#declare IsoAgate_Pigment_a = pigment
{
	agate
	color_map
	{
		[0 color rgb 0]
		[1 color rgb 1]
	}
	scale 32
}

#declare IsoAgate_Pigment_b = pigment
{
	agate
	color_map
	{
		[0 color rgb 0]
		[1 color rgb 1]
	}
	scale 64
}

#declare IsoCrackle_Pigment_a = pigment
{
	crackle
	color_map
	{
		[0 color rgb 0]
		[1 color rgb 1]
	}
	scale 16
}

#declare IsoCrackle_Pigment_b = pigment
{
	crackle
	color_map
	{
		[0 color rgb 0]
		[1 color rgb 1]
	}
	scale 8
}

#declare StoneVein_Texture = texture
{
	#local pigment_a = pigment {gamma_color_adjust(x)}
	#local pigment_b = pigment {gamma_color_adjust(x+y)}
	pigment
	{
		bozo
		turbulence 4
		pigment_map
		{
			[0   pigment_a]
			[1/2 pigment_a]
			[1   pigment_b]
		}
	}
	finish {Default_Finish}
	scale Width
}
