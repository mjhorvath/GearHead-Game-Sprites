// Desc: GearHead hills generator
// Auth: Michael Horvath
// Home Page: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm

#local MaxSteps = 4;


// Basic scene setup
#include "GearHead.inc"                 // Source of the camera and lighting code

// Hill textures
#include "Hills_Textures.inc"                 // Source of the textures

// Hill prototypes
#include "Hills_Prototypes.inc"			// Source of the object components

// -------------------------------------------------------------
// Definitions for the various wall types



// -------------------------------------------------------------

// the final object; select from one of the wall types by uncommenting the corresponding line

object
{
	Hills_Heightfield_Prototype
	texture {Hills_Texture_f}
//	no_shadow
}
