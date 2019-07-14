// Desc: GearHead hills generator
// Auth: Michael Horvath
// Home: http://isometricland.net
#version 3.7;

#declare Sprite_Height = 128;
#declare MaxSteps = 4;
#declare Height = 32;
#declare Width = 64;
#declare Step  = 2;			// the current elevation level. (from 1 to MaxSteps)
//#declare North = 1;			// is the hill connected on this side? (0 or 1)
//#declare East  = 1;			// ...
//#declare South = 0;			// ...
//#declare West  = 0;			// ...

#include "GearHead.inc"                 // Source of the camera and lighting code
#include "Terrain_Textures.inc"                 // Source of the textures
#include "Terrain_Prototypes.inc"			// Source of the object components

// pedestal
#declare box_a = box
{
	#local Wid = Width/2;
	#local Hgh = Height;
	<+Wid,000,+Wid,>,
	<-Wid,Hgh,-Wid,>
}

// -------------------------------------------------------------
// Definitions for the various wall types



// -------------------------------------------------------------

// the final object; select from one of the wall types by uncommenting the corresponding line

union
{
	object
	{
		Prism_Prototype(North,West,South,East)
		translate y * 32 * (Step - 1)
	}
	#if (Step > 1)
		object
		{
			box_a
			scale y * (Step - 1)
		}
	#end
	texture
	{
		Hills_Texture_a
	}
//	no_shadow
}
