// Desc: GearHead hills generator
// Auth: Michael Horvath
// Home Page: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm

#declare MaxSteps = 4;
#declare Height = 32;
#declare Width = 64;
#declare MaxHeight = 64;
#declare Seed = seed(9823);
#declare Lights_Method = 1;

//#declare North = 0;			// is the hill connected on this side? (0 or 1)
//#declare East  = 0;			// ...
//#declare South = 0;			// ...
//#declare West  = 0;			// ...

// Basic scene setup
#include "GearHead.inc"				// Source of the camera and lighting code

// Hill textures
#include "Hills_Textures.inc"			// Source of the textures

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
			Patch_Prototype(North,West,South,East)
			scale y * 3/4		// forgot to fix the texture
			translate y * Height * (Step-1)
		}
		#if (Step > 1)
			object
			{
				box_a
				scale y * (Step-1)
				translate y * Height * 0
			}
		#end
		texture {Hills_Texture_f}
	}
#end

object {build_hill(1)}
object {build_hill(2) translate -z * 64}
object {build_hill(3) translate -x * 64}
object {build_hill(4) translate -z * 64 translate -x * 64}
