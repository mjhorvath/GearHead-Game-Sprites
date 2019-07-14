// Desc: GearHead walls generator
// Auth: Michael Horvath
// Home: http://isometricland.com
// Note: the curvature of the wall may be off when, for example, the South and West directions are set to equal 1. I started a thread in the POV-Ray newsgroup about this, but can't remember if I committed the changes.

#declare Height = 80;
#declare Width = 64;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Walls_Textures.inc"			// Source of the textures
#include "Walls_Prototypes.inc"			// Source of the object components

#if (frame_number > 15)
	#local frame_mod = mod(frame_number,2);
	#if (frame_mod = 1)
		#declare North = 1;
		#declare East  = 0;
		#declare South = 1;
		#declare West  = 0;
		#declare Deco_Rotate = 0;
	#else
		#declare North = 0;
		#declare East  = 1;
		#declare South = 0;
		#declare West  = 1;
		#declare Deco_Rotate = 90;
	#end
#end

// -------------------------------------------------------------
// Definitions for the various wall types

#macro Wall_TubeGuts(North,East,South,West)
	#local Wall_Texture = texture {Guts_Texture} texture {Grade_Texture};
	#local Mask_Texture = texture {Plain_Red} texture {Grade_Texture};
	#local Roof_Texture = texture {Guts_Roof_Texture} texture {Grade_Texture};
	#local Floor_Texture = texture {Guts_Roof_Texture} texture {Grade_Texture};
	union
	{
		#switch (frame_number)
			#range ( 0,15)	Tube_Wall_Prototype(North,East,South,West)	#break
		#end
	}
#end

#macro Wall_TubeConcrete(North,East,South,West)
	#local Wall_Texture = texture {Concrete_Texture} texture {Grade_Texture};
	#local Mask_Texture = texture {Concrete_Texture} texture {Grade_Texture};
	#local Roof_Texture = texture {Concrete_Texture} texture {Grade_Texture};
	#local Floor_Texture = texture {Concrete_Texture} texture {Grade_Texture};
	union
	{
		#switch (frame_number)
			#range ( 0,15)	Tube_Wall_Prototype(North,East,South,West)	#break
		#end
	}
#end


// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
	Wall_TubeGuts(North,East,South,West)
//	Wall_TubeConcrete(North,East,South,West)
}
