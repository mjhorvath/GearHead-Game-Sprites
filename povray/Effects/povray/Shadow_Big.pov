#version 3.7;
#include "GearHead.inc"
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
