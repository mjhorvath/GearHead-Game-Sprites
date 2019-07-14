// Desc: GearHead tree-tile generator 1.0
// Auth: Michael Horvath

#local Height = 32;
#local Width = 64;
#local Seed = seed(22231*frame_number*Trees_Number+Flip*44221);

#include "terrain_Trees_csg_f.inc"

#local Trees_Object = object
{
	TREE
}

Populate_Triangle(Trees_Object, Trees_Number, Seed, Flip)
