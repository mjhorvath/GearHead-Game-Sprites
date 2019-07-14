// Desc: GearHead floors generator
// Auth: Michael Horvath
// Home Page: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm

#declare Height = 16;
#declare Width = 64;
#local Seed = seed(522233);

#include "GearHead.inc"                 // Source of the camera and lighting code, basic scene description
#include "Floors_Textures.inc"          // Source of the textures
#include "Floors_Prototypes.inc"			// Source of the object components

// -------------------------------------------------------------
// Definitions for the various floor types

#declare Floor_Bumpy_Granite = union
{
	object
	{
		Basic_Floor
		texture {CTX}
		texture {Grade_Texture}
	}
	object
	{
		IsoGranite_Floor_Prototype()
		scale 15/16
		texture {MTX}
		texture {Grade_Texture}
	}
}

#declare Floor_Bumpy_Agate_a = union
{
	object
	{
		Basic_Floor
		texture {CTX}
		texture {Grade_Texture}
	}
	object
	{
		IsoAgate_Floor_Prototype()
//		scale 15/16
		texture {MTX}
		texture {Grade_Texture}
	}
}

#declare Floor_Bumpy_Agate_b = union
{
	object
	{
		Basic_Floor
		translate y
		texture {HTX}
		texture {Grade_Texture}
	}
	object
	{
		IsoAgate_Floor_Prototype()
		texture {MTX}
		texture {Grade_Texture}
	}
}


#declare Floor_Bumpy_Blocks_a = union
{
	object
	{
		Basic_Floor
		texture {CTX}
		texture {Grade_Texture}
	}
	intersection
	{
		object {WavyBlock_Floor_Prototype()}
		object {IsoGranite_Floor_Prototype()}
		texture {MTX}
		texture {Grade_Texture}
	}
}

#declare Floor_Bumpy_Blocks_b = object
{
	Floor_Bumpy_Blocks_a
	rotate y * 90
}


// -------------------------------------------------------------

// the final object; select from one of the floor types by uncommenting the corresponding line


object
{
	Floor_Bumpy_Granite
//	Floor_Bumpy_Agate_a
//	Floor_Bumpy_Agate_b
//	Floor_Bumpy_Blocks_a
//	Floor_Bumpy_Blocks_b
}
