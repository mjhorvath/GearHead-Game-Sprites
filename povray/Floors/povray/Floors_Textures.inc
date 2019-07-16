// Desc: textures for floors generator
// Auth: Michael Horvath
// Home: http://isometricland.net

#include "Common_Textures.inc"		// generic textures used by all sprites in common

#declare Hardwood_Texture_a = texture
{
	#local board_length = 1/2;
	#local board_width = 1/8;
	pigment
	{
		cells
		color_map
		{
			[0   gamma_color_adjust(x)]
			[1   gamma_color_adjust(x*2/3)]
		}
		scale x * board_width
		scale z * board_length
		warp
		{
			repeat z * board_length * 2
		}
		warp
		{
			repeat x * board_width
			offset <0,1,board_length/2,>
		}
	}
	finish {Default_Finish}
	normal
	{
		cells
		slope_map
		{
			[0   <1,0>]
//			[1/4 <0,0>]
//			[1/8 <1/2,0>]
//			[1/2 <1/2,0>]
			[1   <0,0>]
		}
		bump_size 1/1
		scale x * board_width
		scale z * board_length
		warp
		{
			repeat z * board_length
		}
		warp
		{
			repeat x * board_width
			offset z * board_length / 2
		}
	}
	translate x * frame_number
	scale Width
}


#declare Hardwood_Texture_b = texture
{
	#local board_length = 1/4;
	#local board_width = 1/8;
	pigment
	{
		cells
		color_map
		{
			[0   gamma_color_adjust(x)]
			[1   gamma_color_adjust(x/2)]
		}
		scale x * board_width
		scale z * board_length
		warp
		{
			repeat z * board_length * 2
		}
		warp
		{
			repeat x * board_width
			offset <0,1,board_length/2,>
		}
	}
	finish {Default_Finish}
	normal
	{
		cells
		slope_map
		{
			[0   <1,0>]
//			[1/4 <0,0>]
//			[1/8 <1/2,0>]
//			[1/2 <1/2,0>]
			[1   <0,0>]
		}
		bump_size 1/1
		scale x * board_width
		scale z * board_length
		warp
		{
			repeat z * board_length
		}
		warp
		{
			repeat x * board_width
			offset z * board_length / 2
		}
	}
	translate x * frame_number
	scale Width
}

#declare StoneBlock_Texture_a = texture
{
	pigment
	{
		brick y, x
		brick_size <1/2,1/4,1>
		mortar 1/16
		warp
		{
			turbulence <0.02,0.02,0>
			octaves 9
			omega 7/8
		}
	}
	finish {Default_Finish}
	rotate x * 90
	translate y * 1/2
	translate x * frame_number
	scale Width
}

#declare StoneBlock_Texture_b = texture
{
	pigment
	{
		brick y, x
		brick_size <1/2,1/4,1>
		mortar 1/16
		warp
		{
			turbulence <0.02,0.02,0>
			octaves 9
			omega 7/8
		}
	}
	finish {Default_Finish}
	rotate x * 90
	rotate y * 90
	translate y * 1/2
	translate x * frame_number
	scale Width
}

#declare Guts_Texture = texture
{
	pigment
	{
		image_pattern {png "texture_bowels.png"}
		color_map
		{
			[0 gamma_color_adjust(x/2)]
			[1 gamma_color_adjust(x)]
		}
	}
	finish {Default_Finish}
	rotate x * 90
	translate <-1/2,0,-1/2>
	scale Width	// square texture
}

#declare Wrinkle_Texture = texture
{
	pigment
	{
		wrinkles
		color_map
		{
			[0   gamma_color_adjust(x)]
			[3/4 gamma_color_adjust(x)]
			[1   gamma_color_adjust(1/4)]
		}
		scale 4
	}
	normal {wrinkles scale 4}
	finish {Default_Finish}
	no_bump_scale
	translate x * Width * frame_number
}

#declare Tiling21_Texture = texture
{
	pigment
	{
		tiling 21 // 1~24 Pattern_Number
		color_map
		{
			[ 0.0 color rgb x/2]
			[ 1.0 color rgb x/1]
		}
		scale 1/2.75
		scale Width
	}
	finish {Default_Finish}
}
