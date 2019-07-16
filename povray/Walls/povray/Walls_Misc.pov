// Desc: GearHead walls generator
// Auth: Michael Horvath
// Home: http://isometricland.net

#version 3.7

#declare Show_CeilingMask = 0;

#include "GearHead.inc"				// Basic scene setup - source of the camera and lighting code
#include "Walls_Textures.inc"			// Source of the textures
#include "Walls_Prototypes.inc"			// Source of the object components


// -------------------------------------------------------------
// Definitions for the various wall types

#macro Wall_Fence_a(North,East,South,West)
	#local RazrWid = Width/2;
	#local RazrHgh = Width/2;
	#local RazrThk = 2;
	#local RazrFq1 = 2;
	#local RazrSt1 = 32;
	#local RazorY = 0;
	#local Razor_Texture = texture {Plain_Green} texture {Grade_Texture};
	#local Jack_Texture = texture {Plain_Red} texture {Grade_Texture};
	union
	{
		#switch (frame_number)
			#range ( 0,15)	Razor_Wire_Prototype(North,East,South,West)	#break
			#range (16,17)	object {Jack_Deco_Object()	rotate y * Deco_Rotate}	Razor_Wire_Prototype(North,East,South,West)	#break
		#end
	}
#end

#macro Wall_Fence_b(North,East,South,West)
	#local AlignY = 1;			// should textures be rotated to match the wall face's normal?
	#local BotThick = 0;			// the thickness of the wall bottom as a factor of its width (should always be 1 when using brick walls)
	#local TopThick = 0;
	#local Wall_Texture = texture {Fence_Wall_Texture scale Width/16};
	#local Mask_Texture = texture {Fence_Wall_Texture scale Width/16};
	#local Roof_Texture = texture {Fence_Wall_Texture scale Width/16};
	#local Floor_Texture = texture {Fence_Wall_Texture scale Width/16};
	#local Post_Texture = texture {Plain_Red} texture {Grade_Texture};
	#local Caution_Texture = texture {Plain_Green} texture {Grade_Texture};
	union
	{
		#switch (frame_number)
			#range ( 0,15)	Flat_Wall_Prototype(North,East,South,West)	Fence_Wall_Posts(North,East,South,West)	#break
			#range (16,17)	object {Caution_Deco_Object()	rotate y * Deco_Rotate}	Flat_Wall_Prototype(North,East,South,West)	Fence_Wall_Posts(North,East,South,West)	#break
		#end
	}
#end

#macro Wall_Fence_c(North,East,South,West)
	#local AlignY = 0;			// should textures be rotated to match the wall face's normal?
	#local Wall_Texture = texture {Plain_Green} texture {Grade_Texture};
	#local Mask_Texture = texture {Plain_Green} texture {Grade_Texture};
	#local Roof_Texture = texture {Plain_Green} texture {Grade_Texture};
	#local Floor_Texture = texture {Plain_Green} texture {Grade_Texture};
	#local Sheet_Texture = texture {Anodized_Metal_Texture} texture {Grade_Texture};
	#local Post_Texture = texture {Plain_LightRed} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/6)
		#end
		#switch (frame_number)
			#range ( 0,15)	Corrugated_Wall_Prototype_a(North,East,South,West)	#break
		#end
	}
#end

#macro Wall_IsoAgate_a(North,East,South,West)
	#local MakeAgatePigment = IsoAgate_Pigment_a;
	#local Wall_Texture = texture {Plain_Red} texture {Grade_Texture};
	#local Mask_Texture = texture {Plain_Red} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		#switch (frame_number)
			#range ( 0,15)	Agate_Wall_Prototype(North,East,South,West)	#break
			#range (16,17)	object {Badge_Deco_Object()	rotate y * Deco_Rotate}	Agate_Wall_Prototype(North,East,South,West)	#break
			#range (18,19)	object {Gear_Deco_Object()	rotate y * Deco_Rotate}	Agate_Wall_Prototype(North,East,South,West)	#break
			#range (20,21)	object {Dollar_Deco_Object()	rotate y * Deco_Rotate}	Agate_Wall_Prototype(North,East,South,West)	#break
			#range (22,23)	object {RedCross_Deco_Object()	rotate y * Deco_Rotate}	Agate_Wall_Prototype(North,East,South,West)	#break
			#range (24,25)	object {Window_Deco_Object_a()	rotate y * Deco_Rotate}	difference {Agate_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
			#range (26,27)	object {Window_Deco_Object_b()	rotate y * Deco_Rotate}	difference {Agate_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
		#end
	}
#end

#macro Wall_IsoAgate_b(North,East,South,West)
	#local MakeAgatePigment = IsoAgate_Pigment_b;
	#local Wall_Texture = texture {StoneVein_Texture} texture {Grade_Texture};
	#local Mask_Texture = texture {StoneVein_Texture} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		#switch (frame_number)
			#range ( 0,15)	Agate_Wall_Prototype(North,East,South,West)	#break
			#range (16,17)	object {Badge_Deco_Object()	rotate y * Deco_Rotate}	Agate_Wall_Prototype(North,East,South,West)	#break
			#range (18,19)	object {Gear_Deco_Object()	rotate y * Deco_Rotate}	Agate_Wall_Prototype(North,East,South,West)	#break
			#range (20,21)	object {Dollar_Deco_Object()	rotate y * Deco_Rotate}	Agate_Wall_Prototype(North,East,South,West)	#break
			#range (22,23)	object {RedCross_Deco_Object()	rotate y * Deco_Rotate}	Agate_Wall_Prototype(North,East,South,West)	#break
			#range (24,25)	object {Window_Deco_Object_a()	rotate y * Deco_Rotate}	difference {Agate_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
			#range (26,27)	object {Window_Deco_Object_b()	rotate y * Deco_Rotate}	difference {Agate_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
		#end
	}
#end

#macro Wall_IsoCrackle_a(North,East,South,West)
	#local MakeCracklePigment = IsoCrackle_Pigment_a;
	#local Wall_Texture = texture {Plain_Red} texture {Grade_Texture};
	#local Mask_Texture = texture {Plain_Red} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		#switch (frame_number)
			#range ( 0,15)	Crackle_Wall_Prototype(North,East,South,West)	#break
			#range (16,17)	object {Badge_Deco_Object()	rotate y * Deco_Rotate}	Crackle_Wall_Prototype(North,East,South,West)	#break
			#range (18,19)	object {Gear_Deco_Object()	rotate y * Deco_Rotate}	Crackle_Wall_Prototype(North,East,South,West)	#break
			#range (20,21)	object {Dollar_Deco_Object()	rotate y * Deco_Rotate}	Crackle_Wall_Prototype(North,East,South,West)	#break
			#range (22,23)	object {RedCross_Deco_Object()	rotate y * Deco_Rotate}	Crackle_Wall_Prototype(North,East,South,West)	#break
			#range (24,25)	object {Window_Deco_Object_a()	rotate y * Deco_Rotate}	difference {Crackle_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
			#range (26,27)	object {Window_Deco_Object_b()	rotate y * Deco_Rotate}	difference {Crackle_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
		#end
	}
#end

#macro Wall_IsoCrackle_b(North,East,South,West)
	#local MakeCracklePigment = IsoCrackle_Pigment_b;
	#local Wall_Texture = texture {Plain_Red} texture {Grade_Texture};
	#local Mask_Texture = texture {Plain_Red} texture {Grade_Texture};
	union
	{
		#if (Show_CeilingMask = 1)
			Fake_Roof(North,East,South,West,Width/3)
		#end
		#switch (frame_number)
			#range ( 0,15)	Crackle_Wall_Prototype(North,East,South,West)	#break
			#range (16,17)	object {Badge_Deco_Object()	rotate y * Deco_Rotate}	Crackle_Wall_Prototype(North,East,South,West)	#break
			#range (18,19)	object {Gear_Deco_Object()	rotate y * Deco_Rotate}	Crackle_Wall_Prototype(North,East,South,West)	#break
			#range (20,21)	object {Dollar_Deco_Object()	rotate y * Deco_Rotate}	Crackle_Wall_Prototype(North,East,South,West)	#break
			#range (22,23)	object {RedCross_Deco_Object()	rotate y * Deco_Rotate}	Crackle_Wall_Prototype(North,East,South,West)	#break
			#range (24,25)	object {Window_Deco_Object_a()	rotate y * Deco_Rotate}	difference {Crackle_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
			#range (26,27)	object {Window_Deco_Object_b()	rotate y * Deco_Rotate}	difference {Crackle_Wall_Prototype(North,East,South,West)	Window_Hole_Prototype()}	#break
		#end
	}
#end

// -------------------------------------------------------------
// the final object: select from one of the wall types by uncommenting the corresponding line

object
{
//	Wall_Fence_a(North,East,South,West)
//	Wall_Fence_b(North,East,South,West)
	Wall_Fence_c(North,East,South,West)
//	Wall_IsoAgate_a(North,East,South,West)
//	Wall_IsoAgate_b(North,East,South,West)
//	Wall_IsoCrackle_a(North,East,South,West)
//	Wall_IsoCrackle_b(North,East,South,West)
}
