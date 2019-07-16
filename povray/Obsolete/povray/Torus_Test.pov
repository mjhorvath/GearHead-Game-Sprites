// Persistence of Vision Ray Tracer Scene Description File
// File: ?.pov
// Vers: 3.6
// Desc: Basic Scene Example
// Date: mm/dd/yy
// Auth: ?
//

#version 3.6;

#include "colors.inc"

global_settings {
  assumed_gamma 1.0
}

// ----------------------------------------

camera
{
  location  <0.0, 1, -8.0>
  direction 1.5*z
  right     x*image_width/image_height
  look_at   <0.0, 0.0,  0.0>
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.6,0.7,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}

light_source {
  <0, 0, 0>            // light's position (translated below)
  color rgb <1, 1, 1>  // light's color
  translate <-30, 30, -30>
//  shadowless
}

// ----------------------------------------

plane
{
  y, -1
  pigment { color rgb <0.7,0.5,0.3> }
}

intersection
{
	sphere
	{
		0, 1
	}
	torus
	{
		0.5, 1
	}
	plane
	{
		-z,0
	}
	texture
	{
		pigment
		{
			color rgb <1,0,0,>
		}
	}
	translate x * 1
}

difference
{
	sphere
	{
		0, 1
	}
	torus
	{
		0.5, 1
	}
	plane
	{
		-z,0
	}
	texture
	{
		pigment
		{
			color rgb <1,0,0,>
		}
	}
	translate x * -1
}

/*
difference
//intersection
{
	box
	{
		<0,0,0>,
		<2,2,2>
	}
	sor
	{
		7,
		<06.1,-11.3>
		<06.1,-11.3>
		<16.0,00.0>
		<25.6,28.3>
		<19.7,57.6>
		<00.0,80.0>
		<00.0,80.0>
		scale 1/40
	}
	texture
	{
		pigment
		{
			color rgb <1,0,0,>
		}
	}
	translate x * -3
}
*/