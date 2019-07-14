// Desc: GearHead tree-tile generator 1.0
// Auth: Michael Horvath

#local Height = 32;
#local Width = 64;
#local Seed = seed(22231*frame_number*Trees_Number+Flip*44221);

#include "VEG.INC"
#local Trees_Object = object
{
	Grantrae
	scale 1/10
}

Populate_Triangle(Trees_Object, Trees_Number, Seed, Flip)
