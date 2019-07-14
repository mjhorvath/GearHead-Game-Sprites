// Desc: GearHead floors generator
// Auth: Michael Horvath
// Home: http://isometricland.com

#declare Height = 64;
#declare Width = 64;
#local Seed = seed(522233);

//#declare Rotate_Y = y * clock * 360;
#declare Show_BasicFloor = 0;
#declare Show_GridMarker = 0;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Floors_Textures.inc"			// Source of the textures
#include "Floors_Prototypes.inc"		// Source of the object components

// -------------------------------------------------------------
// Definitions for the various floor types

#macro Floor_Flat_Hardwood_a()
	union
	{
		Basic_Floor
		texture {Hardwood_Texture_a}
		texture {Grade_Texture}
	}
#end

#macro Floor_Flat_Hardwood_b()
	union
	{
		Basic_Floor
		texture {Hardwood_Texture_a}
		texture {Grade_Texture}
		rotate y * 90
	}
#end

#macro Floor_Flat_Guts()
	union
	{
		Basic_Floor
		texture {Guts_Texture}
		texture {Grade_Texture}
	}
#end

#macro Floor_Flat_Concrete()
	union
	{
		Basic_Floor
		texture {Wrinkle_Texture}
		texture {Grade_Texture}
	}
#end

#macro Floor_Flat_Tiling21()
	union
	{
		Basic_Floor
		texture {Tiling21_Texture}
		texture {Grade_Texture}
	}
#end

// -------------------------------------------------------------
// the final object: select from one of the floor types by uncommenting the corresponding line


object
{
	Floor_Flat_Hardwood_a()
//	Floor_Flat_Hardwood_b()
//	Floor_Flat_Guts()
//	Floor_Flat_Concrete()
//	Floor_Flat_Tiling21()
}
