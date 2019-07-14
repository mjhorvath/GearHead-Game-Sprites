#include "GearHead.inc"

	object
	{
		Basic_Floor
		uv_mapping
		texture{Plain_White}
		translate x * 32
		translate z * -32
	}
	
	object
	{
		Basic_Floor
		uv_mapping
		texture{Plain_White}
		translate x * -32
		translate z * 32
	}
	
	sphere
	{
		0, 32
		texture
		{
			Plain_Red
			finish {ambient 1}
		}
		translate x * 32
		translate z * -32
	}
	
	plane
	{
		<1,0,-1,>, 0
		texture{Plain_Red}
		no_shadow
		no_reflection
		no_image
	}