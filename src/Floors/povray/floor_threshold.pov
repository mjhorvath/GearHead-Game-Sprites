// Desc: GearHead floors generator
// Auth: Michael Horvath
// Home: http://isometricland.net

#version 3.7;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Floors_Textures.inc"			// Source of the textures
#include "Floors_Prototypes.inc"		// Source of the object components


// -------------------------------------------------------------
// Definitions for the various floor types

#macro Floor_Flat()
	union
	{
		Basic_Floor
		texture {Plain_VeryDarkGray}
//		texture {Grade_Texture}
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the floor types by uncommenting the corresponding line


object
{
	Floor_Flat()
}
