#include "GearHead.inc"
#declare Size = 3/4;

disc
{
	0, y, 1
	pigment
	{
		spherical
		color_map
		{
			[0 color rgbt <0,0,0,1,>]
			[1 color rgbt <0,0,0,0,>]
		}
	}
	scale Width/2
	scale Size
}
