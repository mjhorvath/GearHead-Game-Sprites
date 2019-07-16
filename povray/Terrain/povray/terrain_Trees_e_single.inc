// Desc: GearHead tree-tile generator 1.0
// Auth: Michael Horvath

#local Height = 128;
#local Width = 64;
#local Seed = seed(22231*frame_number);

#include "terrain_Trees_csg_e.inc"

object
{
	TREE
	scale Height
//	translate <-1/2 + rand(Seed),0,-1/2 + rand(Seed)> * 16
	no_shadow
}

#declare Size = 1;

disc
{
	0, y, 1
	pigment
	{
		spherical
		color_map
		{
			[0/2 color rgbt <0,0,0,4/4,>]
			[2/2 color rgbt <0,0,0,1/4,>]
		}
	}
	scale Width/2
	scale Size
}
