// Modified from Chris Colefax's Explosion Include example scene.
// doesn't work in POV-Ray 3.7
#version 3.6;

#declare Sprite_Height = 128;
#declare Use_Radiosity = 0;
//#declare Use_Shadows = 0;
#declare Ambient_Factor = 1;

#include "GearHead.inc"
//background {color rgb 1}

#declare Height = 16;
#declare Step = clock;
#declare MClock = Step;			// * 4 / 3
#declare FClock = Step;		//pow (MClock, .8)
#declare Radius = 4;	// LegLength/4
#declare End_Scale = 4;

// OBJECT EXPLODER: EXPLODING MOON ANIMATION
// *****************************************
// This animation shows a moon exploding into a number of asteroids.
// Note: to preserve the starfield background this animation should NOT
//       be rendered with anti-aliasing enabled.

/*
// CAMERA AND LIGHTS
   camera {location <0, 0, -7> look_at <0, 0, 0>}
   light_source {<10, 10, -50> rgb <1, 1, 1>}

// BACKGROUND
   sky_sphere {pigment {granite color_map {
      [0 rgb <.5, .7, 1>] [.1 rgb <0, 0, 0>]
      [.8 rgb <0, 0, 0>] [1 rgb <1, 1, 1>]}
      scale .01}}
*/

#declare Explosion_Texture_a = texture
{
	pigment
	{
		bozo
		color_map
		{
			[0 rgb .4]
			[1 rgb .8]
		}
		scale .4
	}
	normal
	{
		bump_map
		{
			gif "Map.gif"
			map_type 1
			interpolate 2
		}
		bump_size 3
	}
}

#declare Explosion_Texture_b = texture
{
	pigment
	{
		bozo
		color_map
		{
			[0 rgb .4]
			[1 rgb .8]
		}
		scale .3
	}
	normal
	{
		bumps 2
		scale .1
	}
}

#declare Explosion_Texture_c = texture
{
	pigment
	{
		bozo
		color_map
		{
			[0/4 gamma_color_adjust(<0, 1, 1/2>) transmit 1/2]
			[1/4 gamma_color_adjust(<1, 1/2, 0>) transmit 1]
		}
		scale .4
	}
	/*
	normal
	{
		bump_map
		{
			gif "Map.gif"
			map_type 1
			interpolate 2
		}
		bump_size 3
	}
	*/
}

// SCENE DEFINITIONS
#declare Moon = sphere
{
	<0, Height, 0>,
	Radius
	texture {Explosion_Texture_c}
//	no_image
}

/*
// ROTATE MOON FOR FIRST PART OF ANIMATION
   #switch (clock)
      #range (0, .25)
         object {Moon rotate y * clock * 120 rotate z * -20}
         #break
      #else
   #end
*/

// EXPLOSION PARAMETERS
#declare explode_start = 0;
#declare explode_life = 1;
#declare explode_object = object {Moon}
#declare object_centre = <0, Height, 0>;
#declare object_size = Radius * 2;
#declare object_hollow = false;
#declare particle_object = sphere {<0,0,0>, .75}
#declare particle_res = <4, 4, 4>;
#declare particle_texture = Explosion_Texture_c;
#declare exp_location = object_centre;
#declare exp_strength = 32;	// 12
#declare exp_spin = 1;
#declare exp_seed = 87632;
#declare exp_turb = 1;
#declare disintegration = .25;
#declare scale_turb = .5;
#declare rotate_turb = 1;
#declare vel_turb = .3;
#declare dir_turb = .4;
#declare spin_turb = .3;

// CREATE EXPLODING MOON
#include "Explode.inc"	// OBJECT EXPLODER INCLUDE FILE FOR PERSISTENCE OF VISION 3.X Created by Chris Colefax

// CREATE FIREBALL
disc
//sphere
{
	<0,0,0,>,
	Camera_Location,
	1
	pigment
	{
		onion
		color_map
		{
			[0/4 gamma_color_adjust(<1 - (FClock * 1/2), 2/2 - (FClock * 1/2), 1/2>) transmit 1/2 + (FClock * 1/4)]
			[1/4 gamma_color_adjust(<1 - (FClock * 1/2), 1/2, FClock * 1/2>) transmit 1]
		}
		scale 2
		warp
		{
			turbulence -FClock * 1/2
			octaves 3
			lambda 3
		}
		rotate FClock*30
	}
	finish
	{
		ambient 3
		diffuse 0
	}
	no_shadow
	hollow
	scale Radius * 4
	scale 1 + Step * (End_Scale - 1)
	translate object_centre
}



