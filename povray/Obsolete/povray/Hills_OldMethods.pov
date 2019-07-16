// Desc: GearHead hills generator
// Auth: Michael Horvath
// Home Page: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm

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


#macro build_hill(Step)
	union
	{
		object
		{
			hill_sml_a
			scale y * 1
			translate y * 32 * (Step - 1)
		}
		#if (Step > 1)
			object
			{
				box_a
				scale y * (Step - 1)
				translate y * 32 * 0	// normally 32, 16 or 24 for the smaller ones
			}
		#end
		texture {Hills_Texture_f}
	}
#end

object {build_hill(1)}
object {build_hill(2) translate -z * 64}
object {build_hill(3) translate -x * 64}
