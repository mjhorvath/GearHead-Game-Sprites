// Desc: GearHead tree-tile generator 1.0
// Auth: Michael Horvath
// Uses "veg.inc" by Joerg Schrammel and Stig Bachmann Nielsen.

#local Seed = seed(22231*frame_number*Trees_Number);

#include "terrain_Wheat_mesh.inc"

#local Trees_Object = union
{
	object {wheat_13_stems}
	object {wheat_13_leaves}
	pigment {gamma_color_adjust(<255,222,123>/255)}
	finish {Default_Finish}
}

Populate_Triangle(Trees_Object, Trees_Number, Seed, Flip)
