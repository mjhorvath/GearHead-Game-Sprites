// Desc: GearHead floors generator
// Auth: Michael Horvath
// Home: http://isometricland.net
// Need to hide basic floor in some cases since there will be shadows on only the rear layer of the sprite, and not the front.

#version 3.7

#declare Height = 64;
#declare Width = 64;
#local Seed = seed(2233);

//#declare Rotate = clock * 360;
#declare Show_BasicFloor = 0;
#declare Show_GridMarker = 0;
#declare Show_LowerFloor = 1;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Terrain_Textures.inc"			// Source of the textures
#include "Terrain_Prototypes.inc"		// Source of the object components

// -------------------------------------------------------------
// Definitions for the various terrain types

#macro Terrain_Flat_Marsh_Field()
	union
	{
		#include "terrain_Weeds.inc"
		#if (Show_LowerFloor)
			Basic_Floor
			texture	{Marsh_Texture_a}
		#end
	}
#end

#macro Terrain_Flat_Wasteland_Field()
	union
	{
		#include "terrain_Boulders_Tiny.inc"
		#if (Show_LowerFloor)
			Basic_Floor
			texture {Dirt_Texture_a}
		#end
	}
#end

#macro Terrain_Flat_Plain_Field()
	union
	{
		Basic_Floor
		texture {Grass_Texture_a}
	}
#end


#macro Terrain_Flat_Desert_Field()
	union
	{
		Basic_Floor
		texture {Desert_Texture_b}
	}
#end

#macro Terrain_Flat_Gravel_Field()
	union
	{
		#include "terrain_Boulders_Small.inc"
		#if (Show_LowerFloor)
			Basic_Floor
			texture {Gravel_Texture_a}
		#end
	}
#end

#macro Terrain_Flat_Pavement_Field()
	union
	{
		#if (Show_LowerFloor)
			Basic_Floor
			texture {Gravel_Texture_a}
		#end
	}
#end

#macro Terrain_Flat_Corn_Field()
	union
	{
		#include "terrain_Corn_Crop.inc"
		#if (Show_LowerFloor)
			Basic_Floor
			texture {Dirt_Texture_b}
		#end
	}
#end

#macro Terrain_Flat_Wheat_Field()
	union
	{
		#include "terrain_Wheat_Crop.inc"
		#if (Show_LowerFloor)
			Basic_Floor
			texture {Dirt_Texture_b}
		#end
	}
#end

#macro Terrain_Flat_Reeds_Field()
	union
	{
		#local Trees_Number = 16;
		#if (Show_LowerFloor = 1)
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
		#include "terrain_Reeds_Crop.inc"
	}
#end

#macro Terrain_Flat_Ferns_Group(Flip)
	union
	{
		#local Trees_Number = 6;
		#include "terrain_Fern.inc"
		#if ((Flip = 0) & (Show_LowerFloor = 1))
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
	}
#end

#macro Terrain_Flat_Wheat_Group(Flip)
	union
	{
		#local Trees_Number = 6;
		#include "terrain_Wheat.inc"
		#if ((Flip = 0) & (Show_LowerFloor = 1))
			object
			{
				Basic_Floor
				texture {Dirt_Texture_b}
			}
		#end
	}
#end

#macro Terrain_Flat_Reeds_Group(Heavy, Flip)
	union
	{
		#if (Heavy = 1)
			#local Trees_Number = 36;
		#else
			#local Trees_Number = 12;
		#end
		#if ((Flip = 0) & (Show_LowerFloor = 1))
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
			polygon
			{
				4, <-1,0,-1>, <-1,0,+1>, <+1,0,+1>, <+1,0,-1>
				pigment {color rgbt <0,0,0,3/4,>}
				scale Width/2
			}
		#end
		#include "terrain_Reeds.inc"
	}
#end

#macro Terrain_Flat_Tree_Group_a(Heavy, Flip)
	union
	{
		#if (Heavy = 1)
			#local Trees_Number = 4;
		#else
			#local Trees_Number = 2;
		#end
		#if ((Flip = 0) & (Show_LowerFloor = 1))
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
		#include "terrain_Trees_a.inc"
	}
#end

#macro Terrain_Flat_Tree_Group_b(Heavy, Flip)
	union
	{
		#if (Heavy = 1)
			#local Trees_Number = 4;
		#else
			#local Trees_Number = 2;
		#end
		#if ((Flip = 0) & (Show_LowerFloor = 1))
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
		#include "terrain_Trees_b.inc"
	}
#end

#macro Terrain_Flat_Tree_Group_c(Heavy, Flip)
	union
	{
		#if (Heavy = 1)
			#local Trees_Number = 12;
		#else
			#local Trees_Number = 6;
		#end
		#if ((Flip = 0) & (Show_LowerFloor = 1))
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
		#include "terrain_Trees_c.inc"
	}
#end

#macro Terrain_Flat_Tree_Group_d(Heavy, Flip)
	union
	{
		#if (Heavy = 1)
			#local Trees_Number = 12;
		#else
			#local Trees_Number = 6;
		#end
		#if ((Flip = 0) & (Show_LowerFloor = 1))
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
		#include "terrain_Trees_d.inc"
	}
#end

#macro Terrain_Flat_Tree_Group_e(Heavy, Flip)
	union
	{
		#if (Heavy = 1)
			#local Trees_Number = 8;
		#else
			#local Trees_Number = 4;
		#end
		#if ((Flip = 0) & (Show_LowerFloor = 1))
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
		#include "terrain_Trees_e.inc"
	}
#end

#macro Terrain_Flat_Tree_Group_f(Heavy, Flip)
	union
	{
		#if (Heavy = 1)
			#local Trees_Number = 8;
		#else
			#local Trees_Number = 4;
		#end
		#if ((Flip = 0) & (Show_LowerFloor = 1))
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
		#include "terrain_Trees_f.inc"
	}
#end

#macro Terrain_Flat_Tree_Single_a()
	union
	{
		#include "terrain_Trees_a_single.inc"
		#if (Show_LowerFloor = 1)
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
		no_shadow
	}
#end

#macro Terrain_Flat_Tree_Single_c()
	union
	{
		#include "terrain_Trees_c_single.inc"
		#if (Show_LowerFloor = 1)
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
//		no_shadow
	}
#end

#macro Terrain_Flat_Tree_Single_e()
	union
	{
		#include "terrain_Trees_e_single.inc"
		#if (Show_LowerFloor = 1)
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
		no_shadow
	}
#end

#macro Terrain_Flat_Boulder_Single()
	union
	{
		#include "terrain_Boulders_Large.inc"
		#if (Show_LowerFloor = 1)
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
	}
#end

#macro Terrain_Flat_Boulder_Group()
	union
	{
		#include "terrain_Boulders_Small.inc"
		#if (Show_LowerFloor = 1)
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
	}
#end

#macro Terrain_Flat_Jack_Single()
	union
	{
		#local Jacks_Number = 1;
		#include "terrain_Jack_Large.inc"
		#if (Show_LowerFloor = 1)
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
	}
#end

#macro Terrain_Flat_Jack_Group()
	union
	{
		#include "terrain_Jack_Small.inc"
		#if (Show_LowerFloor = 1)
			object
			{
				Basic_Floor
				texture {Grass_Texture_a}
			}
		#end
	}
#end

#macro Nothing()
	union {}
#end

// -------------------------------------------------------------
// The final object: select from one of the terrain types by uncommenting the corresponding line.
// Use anti-aliasing if possible. Otherwise they might not look so great. :(
// Macro_Name(Heavy, Flip)
// Macro_Name(Flip)

union
{
//	Terrain_Flat_Desert_Field()
//	Terrain_Flat_Marsh_Field()
//	Terrain_Flat_Wasteland_Field()
//	Terrain_Flat_Plain_Field()
//	Terrain_Flat_Gravel_Field()
//	Terrain_Flat_Pavement_Field()
//	Terrain_Flat_Wheat_Field()
//	Terrain_Flat_Reeds_Field()
//	Terrain_Flat_Corn_Field()
//	Terrain_Flat_Wheat_Group(0)		// very grainy when anti-aliasing is turned off
//	Terrain_Flat_Wheat_Group(1)		// very grainy when anti-aliasing is turned off
//	Terrain_Flat_Ferns_Group(0)		// needs light and heavy variants, uses filtering so is not appropriate for 1-bit transparency
//	Terrain_Flat_Ferns_Group(1)		// needs light and heavy variants, uses filtering so is not appropriate for 1-bit transparency
//	Terrain_Flat_Reeds_Group(0, 0)
//	Terrain_Flat_Reeds_Group(1, 0)
//	Terrain_Flat_Reeds_Group(0, 1)
	Terrain_Flat_Reeds_Group(1, 1)
//	Terrain_Flat_Tree_Group_a(0, 0)		// dark deciduous tree
//	Terrain_Flat_Tree_Group_a(1, 0)		// dark deciduous tree
//	Terrain_Flat_Tree_Group_a(0, 1)		// dark deciduous tree
//	Terrain_Flat_Tree_Group_a(1, 1)		// dark deciduous tree
//	Terrain_Flat_Tree_Group_b(0, 0)		// light deciduous tree
//	Terrain_Flat_Tree_Group_b(1, 0)		// light deciduous tree
//	Terrain_Flat_Tree_Group_b(0, 1)		// light deciduous tree
//	Terrain_Flat_Tree_Group_b(1, 1)		// light deciduous tree
//	Terrain_Flat_Tree_Group_c(0, 0)		// bushy spruce
//	Terrain_Flat_Tree_Group_c(1, 0)		// bushy spruce
//	Terrain_Flat_Tree_Group_c(0, 1)		// bushy spruce
//	Terrain_Flat_Tree_Group_c(1, 1)		// bushy spruce
//	Terrain_Flat_Tree_Group_d(0, 0)		// tall pine, uses filtering so is not appropriate for 1-bit transparency
//	Terrain_Flat_Tree_Group_d(1, 0)		// tall pine, uses filtering so is not appropriate for 1-bit transparency
//	Terrain_Flat_Tree_Group_d(0, 1)		// tall pine, uses filtering so is not appropriate for 1-bit transparency
//	Terrain_Flat_Tree_Group_d(1, 1)		// tall pine, uses filtering so is not appropriate for 1-bit transparency
//	Terrain_Flat_Tree_Group_e(0, 0)		// super simple conical pine tree
//	Terrain_Flat_Tree_Group_e(1, 0)		// super simple conical pine tree
//	Terrain_Flat_Tree_Group_e(0, 1)		// super simple conical pine tree
//	Terrain_Flat_Tree_Group_e(1, 1)		// super simple conical pine tree
//	Terrain_Flat_Tree_Group_f(0, 0)		// super simple spherical deciduous tree
//	Terrain_Flat_Tree_Group_f(1, 0)		// super simple spherical deciduous tree
//	Terrain_Flat_Tree_Group_f(0, 1)		// super simple spherical deciduous tree
//	Terrain_Flat_Tree_Group_f(1, 1)		// super simple spherical deciduous tree
//	Terrain_Flat_Tree_Single_a()
//	Terrain_Flat_Tree_Single_c()
//	Terrain_Flat_Tree_Single_e()		// super simple conical pine tree
//	Terrain_Flat_Boulder_Single()
//	Terrain_Flat_Boulder_Group()
//	Terrain_Flat_Jack_Single()
//	Terrain_Flat_Jack_Group()
//	Nothing()
}
