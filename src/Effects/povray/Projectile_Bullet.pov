// doesn't work in POV-Ray 3.7
#version 3.6;

#declare Width = 64;
#declare Height = 16;
#declare Rotate_Y = clock * 360 - 45;
#declare Burst = 0;

#include "GearHead.inc"


#declare Bullet_Material = material
{
	texture {pigment {color rgbt 1}}
	interior
	{
		media
		{
			emission rgbt <1,1/2,0>
			density
			{
				gradient y
				color_map
				{
					[0 color rgb 0]
					[1 color rgb 1]
				}
			}
//			intervals 50
		}

	}
}

#local max_radius = 0.2;
#declare Bullet_Object = merge
{
	cone {<0,-4,0,>, 0, <0,4-max_radius,0,>, max_radius}
	sphere {<0,4-max_radius,0,>, max_radius}
	hollow
	material
	{
		Bullet_Material
		scale 8
		translate -y * 4
	}
}

object
{
	Bullet_Object
	scale 8
	rotate x * 90
	translate y * Height
	rotate y * Rotate_Y
}

#if (Burst = 1)
	object
	{
		Bullet_Object
		scale 8
		rotate x * 90
		translate y * Height
		translate +x * 8
		translate +z * 24
		rotate y * Rotate_Y
	}
	object
	{
		Bullet_Object
		scale 8
		rotate x * 90
		translate y * Height
		translate -x * 8
		translate -z * 24
		rotate y * Rotate_Y
	}
#end