#declare Sprite_Height = 128;
#local Height = 16;
#declare Burst = 0;
#declare Rotate_Y = clock * 360 - 45;
#include "GearHead.inc"

#declare Exhaust_Texture_a = texture
{
	pigment
	{
		bozo
		color_map
		{
			[1/4 gamma_color_adjust(<1,1,1>) transmit 0]
			[4/4 gamma_color_adjust(<1,1,1>) transmit 1]
		}
	}
	finish {Default_Finish}
	scale 4/Width
}

#declare Exhaust_Texture_b = texture
{
	pigment
	{
		gradient -y
		color_map
		{
			[0/4 gamma_color_adjust(<1,1,1/2>) transmit 0]
			[1/4 gamma_color_adjust(<1,1/2,0>) transmit 1]
		}
	}
	finish {Default_Finish ambient 1}
}

#declare Exhaust_Texture_c = texture
{
	average
	texture_map
	{
		[1 Exhaust_Texture_a]
		[3 Exhaust_Texture_b]
	}
	scale Width
}

#declare Exhaust_Texture_d = texture
{
	pigment
	{
		gamma_color_adjust(<1,1/2,0>) transmit 0
	}
	finish {Default_Finish ambient 1}
}

#declare Missile = union
{
	cylinder
	{
		<0,0,0,>, <0,12,0,>, 1
		texture {Plain_White}
	}
	cone
	{
		<0,12,0,>, 1, <0,16,0,>, 0
		texture {Plain_White}
	}
	cone
	{
		<0,0,0,>, 2, <0,2,0,>, 0
		texture {Plain_Black}
	}
	cone
	{
		<0,10,0,>, 2, <0,12,0,>, 0
		texture {Plain_Black}
	}
	cone
	{
		<0,-32/cosd(45),0,>, 4, <0,0,0,>, 2
		open
		texture {Exhaust_Texture_c}
	}
	translate y * -6
	rotate x * 90
	scale 1/2
	scale z * 2
	translate y * Height
	no_shadow
}

union
{
	object {Missile}
	#if (Burst = 1)
		object {Missile translate +x * Width/4}
		object {Missile translate -x * Width/4}
	#end
	rotate y * Rotate_Y
}
