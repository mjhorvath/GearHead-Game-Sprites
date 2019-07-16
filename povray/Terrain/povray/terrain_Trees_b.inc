// Desc: GearHead tree-tile generator 1.0
// Auth: Michael Horvath

#local Height = 32;
#local Width = 64;
#local Seed = seed(1122331*frame_number*Trees_Number+Flip*41221);

#local doh = rand(Seed);

#include "terrain_Trees_mesh_b.inc"

#local Trees_Object = object
{
	TREE
	scale 2/3
}

Populate_Triangle(Trees_Object, Trees_Number, Seed, Flip)
