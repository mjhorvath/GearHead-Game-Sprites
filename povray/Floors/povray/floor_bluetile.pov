// Desc: GearHead floors generator
// Auth: Michael Horvath
// Home: http://isometricland.net

#version 3.7
#declare Height = 0;
#declare Width = 64;
#declare Seed = seed(522233);

#include "GearHead.inc"                 // Source of the camera and lighting code
#include "Floors_Textures.inc"                 // Source of the textures
#include "Floors_Prototypes.inc"			// Source of the object components


// -------------------------------------------------------------
// Definitions for the various floor types

#macro Floor_Tile_SquareNoStagger_Large()
	#local Tiles_Height = 0.01;
	#local Tiles_Width = 64;
	#local Tiles_Number = 4;
	#local Tiles_Stagger = 0;
	intersection
	{
		union
		{
			object
			{
				Basic_Floor
				texture {Plain_Gray}
//				texture {Grade_Texture}
			}
			object
			{
				SquareEvenPatchTile_Floor_Prototype(Tiles_Width,Tiles_Height,Tiles_Number,Tiles_Stagger)
				texture {Plain_DarkSteelBlue}
//				texture {Grade_Texture}
			}
		}
		box {-Width/2,+Width/2}
	}
#end


// -------------------------------------------------------------

// the final object; select from one of the floor types by uncommenting the corresponding line
object
{
	Floor_Tile_SquareNoStagger_Large()
}
