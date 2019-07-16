// Desc: GearHead straight road generator
// Auth: Michael Horvath
// Home Page: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm

#declare Rotate = 0;
#declare Height = 0;
#declare Width = 64;

#include "GearHead.inc"
#include "Terrain_Textures.inc"
#include "Terrain_Prototypes.inc"


// -------------------------------------------------------------
// Definitions for the various road types

#declare Map_Scale_Road = object
{
	// map-scale road
	#local Road_Width = 16;
	#local Stripe_Length = 2;
	#local Stripe_Gap = 2;
	#local Stripe_Width = 9/8;
	#local Curb_Width = 1;
	#local Road_Texture = Road_Texture_a;
	#local Curb_Texture = Road_Texture_a;
	#local Stripe_Texture = Stripe_Texture_a;
	#local Divider_Texture = Road_Texture_a;
	#local Side_Texture = Road_Texture_a;
	#local Fill_Corners = 0;
	Road_Intersect(North,East,South,West)
}

#declare City_Scale_Road = object
{
	// regular-scale road
	#local Road_Width = 64;
	#local Stripe_Length = 4;
	#local Stripe_Gap = 4;
	#local Stripe_Width = 9/8;
	#local Curb_Width = 2;
	#local Road_Texture = Road_Texture_a;
	#local Curb_Texture = Road_Texture_a;
	#local Stripe_Texture = Stripe_Texture_a;
	#local Divider_Texture = Stripe_Texture_a;
	#local Side_Texture = Road_Texture_a;
	#local Fill_Corners = 0;
	Road_Intersect(North,East,South,West)
}


// -------------------------------------------------------------
// the final object; select from one of the road types by uncommenting the corresponding line

object
{
//	Map_Scale_Road
	City_Scale_Road
}
