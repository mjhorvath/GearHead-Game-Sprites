// Desc: GearHead walls generator
// Auth: Michael Horvath
// Home: http://isometricland.net

#version 3.7

#declare Show_CeilingMask = 0;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Walls_Textures.inc"			// Source of the textures
#include "Walls_Prototypes.inc"			// Source of the object components


// -------------------------------------------------------------
// Definitions for the various wall types

#declare Techy_Texture_a = texture
{
	pigment {gamma_color_adjust(<1,1,1>)}
	normal
	{
		bump_map {png "../walls/texture_techy_a.png" bump_size 1}
	}
	finish {Phong_Shiny}
	scale Height	// square texture
}

#macro Gear_Deco_Object()
	#local Gear_Texture = texture {Plain_Gray} texture {Grade_Texture};
	object
	{
		path8103
		translate <-AllShapes_CENTER_X,-1/2,-AllShapes_CENTER_Y>
		scale y * Width/2
		rotate y * -90
		rotate z * +90
		translate y * Height/2
		texture {Gear_Texture}
	}
#end

// low res bump map
#macro Wall_FlatTechy_a(North,East,South,West)
	#local AlignY = 1;			// should textures be rotated to match the wall face's normal?
	#local BotThick = 1/4;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
	#local TopThick = 1/1;			// the thickness of the wall top as a factor of the wall bottom (should always be 1 when using brick walls)
	#local Wall_Texture = texture {Techy_Texture_a} texture {Grade_Texture};
	#local Mask_Texture = texture {Techy_Texture_a} texture {Grade_Texture};
	#local Floor_Texture = texture {Plain_Black} texture {Grade_Texture};
	#local Roof_Texture = texture {Plain_Black} texture {Grade_Texture};
	union
	{


		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		Flat_Wall_Prototype(North,East,South,West)
		#if (frame_number = 5)
			object {Gear_Deco_Object()	rotate y * 000}
		#end
		#if (frame_number = 10)
			object {Gear_Deco_Object()	rotate y * 090}
		#end
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Wall_FlatTechy_a(North,East,South,West)
}
