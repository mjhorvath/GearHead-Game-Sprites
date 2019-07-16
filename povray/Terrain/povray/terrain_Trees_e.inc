// Desc: GearHead tree-tile generator 1.0
// Auth: Michael Horvath

#local Height = 32;
#local Width = 64;
#local Seed = seed(22231*(frame_number+1)+22231*Trees_Number+22231*Flip);

#include "terrain_Trees_csg_e.inc"

#local Trees_Object = object
{
	TREE
}

Populate_Triangle(Trees_Object, Trees_Number, Seed, Flip)
