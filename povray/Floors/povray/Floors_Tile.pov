// Desc: GearHead floors generator
// Auth: Michael Horvath
// Home: http://isometricland.net

#version 3.7
#declare Height = 2;
#declare Width = 64;
#declare Lights_Method = 1;
#declare Ambient_Factor = 1/3;
#declare Seed = seed(522233);
#declare Show_GridMarker = 0;

#include "GearHead.inc"                 // Source of the camera and lighting code
#include "Floors_Textures.inc"                 // Source of the textures
#include "Floors_Prototypes.inc"			// Source of the object components


// -------------------------------------------------------------
// Definitions for the various floor types

#macro Floor_Tile_SquareStagger_Large_a()
	#local Tiles_Height = 2;
	#local Tiles_Width = 64;
	#local Tiles_Number = 2;
	#local Tiles_Stagger = 1;
	intersection
	{
		union
		{
			object
			{
				Basic_Floor
				texture {CTX}
				texture {Grade_Texture}
			}
			object
			{
				SquarePatchTile_Floor_Prototype(Tiles_Width,Tiles_Height,Tiles_Number,Tiles_Stagger)
				texture {MTX}
				texture {Grade_Texture}
			}
		}
		box {-Width/2,+Width/2}
	}
#end

#macro Floor_Tile_SquareStagger_Large_b()
	object {Floor_Tile_SquareStagger_Large_a() rotate y * 90}
#end

#macro Floor_Tile_SquareStagger_Small_a()
	#local Tiles_Height = 2;
	#local Tiles_Width = 64;
	#local Tiles_Number = 4;
	#local Tiles_Stagger = 1;
	intersection
	{
		union
		{
			object
			{
				Basic_Floor
				texture {CTX}
				texture {Grade_Texture}
			}
			object
			{
				SquarePatchTile_Floor_Prototype(Tiles_Width,Tiles_Height,Tiles_Number,Tiles_Stagger)
				texture {MTX}
				texture {Grade_Texture}
			}
		}
		box {-Width/2,+Width/2}
	}
#end

#macro Floor_Tile_SquareStagger_Small_b()
	object {Floor_Tile_SquareStagger_Small_a() rotate y * 90}
#end

#macro Floor_Tile_SquareNoStagger_Large()
	#local Tiles_Height = 2;
	#local Tiles_Width = 64;
	#local Tiles_Number = 2;
	#local Tiles_Stagger = 0;
	intersection
	{
		union
		{
			object
			{
				Basic_Floor
				texture {CTX}
				texture {Grade_Texture}
			}
			object
			{
				SquarePatchTile_Floor_Prototype(Tiles_Width,Tiles_Height,Tiles_Number,Tiles_Stagger)
				texture {MTX}
				texture {Grade_Texture}
			}
		}
		box {-Width/2,+Width/2}
	}
#end

#macro Floor_Tile_SquareNoStagger_Small()
	#local Tiles_Height = 2;
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
				texture {CTX}
				texture {Grade_Texture}
			}
			object
			{
				SquarePatchTile_Floor_Prototype(Tiles_Width,Tiles_Height,Tiles_Number,Tiles_Stagger)
				texture {MTX}
				texture {Grade_Texture}
			}
		}
		box {-Width/2,+Width/2}
	}
#end

// -------------------------------------------------------------

// the final object; select from one of the floor types by uncommenting the corresponding line
object
{
//	Floor_Tile_SquareNoStagger_Large()
//	Floor_Tile_SquareNoStagger_Small()
	Floor_Tile_SquareStagger_Large_a()
//	Floor_Tile_SquareStagger_Large_b()
//	Floor_Tile_SquareStagger_Small_a()
//	Floor_Tile_SquareStagger_Small_b()
}
