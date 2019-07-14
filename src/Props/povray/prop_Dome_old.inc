// "sphere.inc" written by Shuhei Kawachi

#declare BlankTexture = texture {}

#declare N = 1;
#declare Half = 1;
#declare Method = 1;
#declare RibTexture = Plain_White;
#declare PaneTexture = T_Glass1;
#declare R_Ten = 0.025 / N;
#declare R_Hen = 0.025 / N;
#include "sphere.inc"

#declare Dome_Object = union
{
	union
	{
		object { Ten texture { RibTexture } }
		object { Hen texture { RibTexture } }
		object { Men texture { PaneTexture } }
		scale 12
		translate <0,0,-20,>
		no_shadow
	}
	union
	{
		object { Ten texture { RibTexture } }
		object { Hen texture { RibTexture } }
		object { Men texture { PaneTexture } }
		scale 12
		translate <0,0,20,>
		no_shadow
	}
	union
	{
		object { Ten texture { RibTexture } }
		object { Hen texture { RibTexture } }
		object { Men texture { PaneTexture } }
		scale 12
		translate <-20,0,0,>
		no_shadow
	}
	union
	{
		object { Ten texture { RibTexture } }
		object { Hen texture { RibTexture } }
		object { Men texture { PaneTexture } }
		scale 12
		translate <20,0,0,>
		no_shadow
	}
	cylinder
	{
		<-12,0,0,>,
		<12,0,0,>,
		4
		texture {Plain_White}
	}
	cylinder
	{
		<0,0,-12,>,
		<0,0,12,>,
		4
		texture {Plain_White}
	}
	cylinder
	{
		<0,0,0,>,
		<0,4,0,>,
		8
		texture {Plain_White}
	}
	cylinder
	{
		<0,0,0,>,
		<0,6,0,>,
		4
		texture {Plain_White}
	}
	/*
	cone
	{
		<Width/3,0,Width/2>,
		2
		<Width/3,64,Width/2>,
		1
		texture {Plain_White}
	}
	*/
	clipped_by
	{
		box
		{
			<-Width/2,0,-Width/2,>,
			<Width/2,Height,Width/2,>
		}
	}
}

object {Dome_Object}
