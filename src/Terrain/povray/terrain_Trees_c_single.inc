// Desc: GearHead tree-tile generator 1.0
// Auth: Michael Horvath

#local Height = 80;
#local Width = 64;
#local Seed = seed(22231*(frame_number+1));

#include "terrain_Trees_mesh_c.inc"

object
{
	TREE
	scale (rand(Seed) * 1/4 + 3/4)
	scale Height
	scale 3/2
	rotate y * rand(Seed) * 360
}
