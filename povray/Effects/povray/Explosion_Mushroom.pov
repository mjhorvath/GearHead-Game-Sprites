#include "GearHead.inc"
#declare New_Clock = clock + clock_delta;
#declare Width = 64;
#declare Height = 64;
#declare Width_Start = Width/12;
#declare Width_Finish = Width/36;

#declare Exhaust_Texture_a = texture
{
	pigment
	{
		bozo
		color_map
		{
			[1/4 color rgbt <1,1,1,clock,>]
			[1 color rgbt <1,1,1,1,>]
		}
	}
	finish {Default_Finish}
	scale 1
}

#declare Exhaust_Texture_b = texture
{
	pigment
	{
		gradient -y
		color_map
		{
			[0/4 rgbt <1, 1, 1/2, New_Clock,>]
			[1/4 rgbt <1, 1/2, 0, 1,>]
		}
	}
	normal
	{
		bumps 4
	}
	finish {Default_Finish}
	scale Height
}


#declare Exhaust_Texture_c = texture
{
	average
	texture_map
	{
		[1 Exhaust_Texture_a]
		[1 Exhaust_Texture_b]
	}
}

merge
{
	// ground wave
	torus
	{
		New_Clock * Width/2,
		Width/8	//(1 - clock) * 
		texture {Exhaust_Texture_a}
		clipped_by
		{
			cylinder
			{
				<0,0,0,>,
				<0,Height,0,>,
				New_Clock * Width/2
				inverse
			}
		}
	}
	// mushroom
	torus
	{
		New_Clock * Width/3,
		New_Clock * Width/3
		texture {Exhaust_Texture_a}
		translate y * clock * Height
	}
	// pillar
	#if (clock > 0)
	cone
	{
		<0,0,0,>,
		New_Clock * Width/3,	// Width/2
		<0,0,0,> + y * clock * Height,
		New_Clock * Width/4
		texture {Exhaust_Texture_a}
	}
	#end
	clipped_by
	{
		plane
		{
			-y, 0
		}
	}
	scale 3/4
}
