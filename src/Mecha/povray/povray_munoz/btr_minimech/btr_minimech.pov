
#include "colors.inc"
//#include "GearHead.inc"
#include "GearHead_nice_render.inc"

#declare MainTexture= MTX;
/*
camera
{
	#local CamRadius = 50;
	orthographic
	up y * image_height / image_width * CamRadius
	right x * CamRadius
	location <1,0,0,> * CamRadius
	look_at <0,0,0,>
}
*/
// Persistence of Vision Ray Tracer Scene Description File
// File: minimech.pov
// Vers: 3
// Desc: Basic Scene Example
// Date: Nov-Dec 1997
// Auth: Francisco Muñoz Cotobal
//

#declare Turbo = 0;  // 1 to Turbo render, 2 Render without background, 3 Render only background

#include "colors.inc"
#include "textures.inc"
#include "minimech_textures.inc"  // Selecting colors
#include "minimech_vogue.inc"         // Bending joints & defining defaults
#include "minimech_pieces.inc"    // Cheap mech pieces for sale

// ----------------------------------------
// ----------------------------------------
#include "homid2.inc"

#declare homid = union
{
	// the basic homid figure
	object
	{
		homid
	}
	// adding shoulderpads & some small changes
	object
	{
		shoulderpadL
        	rotate <girXupperarmD,girYtorso,girZtorso>
        	translate poshombroD
	}
	object
	{
		shoulderpadR
		rotate <girXupperarmI,girYtorso,girZtorso>
		translate poshombroI
	}
}

object
{
	homid
	translate y * 14.25
	scale 3
	scale Scale_LDraw
	rotate y * 135
	rotate y * clock * 360
}
