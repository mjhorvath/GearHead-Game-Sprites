// Desc: GearHead tree-tile generator 1.0
// Auth: Michael Horvath

#local Height = 96;
#local Width = 64;
#local Seed = seed(22231*frame_number);

#include "terrain_Trees_mesh_a.inc"

object
{
	TREE
	scale (rand(Seed) * 1/4 + 3/4)
	scale Height
	rotate y * rand(Seed) * 360
}
