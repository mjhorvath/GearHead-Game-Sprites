#version 3.7;
#include "glass.inc"
#include "textures.inc"

global_settings
{
	assumed_gamma 1.0
}

//background {color rgb x}

camera
{
	orthographic
	location	-z*16
	direction	+z
	right		+x
	up		+y
	rotate		+x * 90
	scale		2
}

light_source
{
	<-1,+1,+1>
	color rgb 1
	scale 1024
//	parallel
}


#macro make_bulb(in_color, in_active)
	#if (in_active = 1)
		#local color_multi = 1;
	#else
		#local color_multi = 1/4;
	#end
	union
	{
		light_source
		{
			0
			color rgb in_color*color_multi
		}
		difference
		{
			sphere
			{
				0, 3/4
				scale 0.999
			}
	//		plane
	//		{
	//			+y, 0
	//		}
			material
			{
				texture
				{
					pigment { color srgb in_color filter 7/8 }
					finish
					{
						ambient		0.1
						diffuse		0.1
						reflection	0.25
						specular	1
						roughness	0.05
					}
				}
				interior
				{
					ior		1.5
					fade_distance	1.0
					fade_power	2
				}
			}
	//		hollow
			no_shadow
		}
		difference
		{
			cylinder
			{
				+y/10, -y/1, 1
			}
			sphere
			{
				0, 3/4
			}
			material
			{
				texture
				{
					pigment { color srgb 0 }
					finish
					{
						ambient		0.1
						diffuse		0.1
						reflection	0.25
						specular	1
						roughness	0.001
					}
				}
			}
		}
	}
#end

object
{
	make_bulb(x+y, 1)
}

/*
object
{
	make_bulb(x, 0)
	translate <-3/2,0,-1>
}
*/
