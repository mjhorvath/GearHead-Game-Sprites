#include "GearHead.inc"

#local Scale_Factor = 2;

#local barrel_a = union
{
	cylinder
	{
		<0,0,0,>, <28,0,0,>, 2
		open
	}
	cylinder
	{
		<0,0,0,>, <32,0,0,>, 2
		open
	}
	texture {CTX}
}

// gun turret
#local barrel_b = union
{
	cylinder {<0,1,0,>, <32,1,0,>, 3/4}
	cylinder {<0,-1,0,>, <32,-1,0,>, 3/4}
	cylinder {<0,0,1,>, <32,0,1,>, 3/4}
	cylinder {<0,0,-1,>, <32,0,-1,>, 3/4}
	cylinder {<0,0,-2,>, <0,0,2,>, 4}
	cylinder {<-6,0,0,>, <10,0,0,>, 2}
	cylinder {<29,0,0,>, <30,0,0,>, 2}
	texture {CTX}
}

#local missile_a = union
{
	cylinder {<-32,0,0,>, <20,0,0,>, 2}
	cone {<20,0,0,>, 2 <32,0,0,>, 0}
	cone
	{
		<-32,0,0,>, 6 <-20,0,0,>, 2
		scale y * 1/32
	}
	cone
	{
		<-32,0,0,>, 6 <-20,0,0,>, 2
		scale z * 1/32
	}
	cone
	{
		<-4,0,0,>, 6 <8,0,0,>, 2
		scale y * 1/32
	}
	cone
	{
		<-4,0,0,>, 6 <8,0,0,>, 2
		scale z * 1/32
	}
	//texture {Plain_White}
	texture {CTX}
}

// missile turret
#local barrel_c = union
{
	cylinder {<0,0,-2,>, <0,0,4,>, 2}
	sphere {<0,0,4,>, 2}	//4
	object
	{
		missile_a
		scale 1/2
		translate <0,4,8,>
	}
	object
	{
		missile_a
		scale 1/2
		translate <0,4,0>
	}
	object
	{
		missile_a
		scale 1/2
		translate <0,-4,8,>
	}
	object
	{
		missile_a
		scale 1/2
		translate <0,-4,0>
	}
	texture {BTX}
}

//-------------------

union
{
	union
	{
		difference
		{
			intersection
			{
				sphere {<0,8,0,>, 16}
				box {<-32,-32,-8,>, <32,32,8,>}
			}
			box {<8,8,-4,>, <16,32,4,>}
			texture {MTX}
		}
		intersection
		{
			sphere {<0,8,0,>, 15}
			box {<8,8,-4,>, <16,32,4,>}
			texture {HTX}
		}
		/*
		difference
		{
			sphere {<0,8,0,>, 16}
			box {<-32,-32,-10,>, <32,32,10,>}
			box {<32,6,-32,>, <32,10,32,>}
			texture {MTX}
		}
		*/
		object
		{
			barrel_b
			rotate x * 180
			translate <0,8,-12,>
		}
		object
		{
			barrel_b
			translate <0,8,12,>
		}
		rotate y * -135
		rotate y * clock * 360
		translate y * 28
	}
	difference
	{
		cone {<0,64,0,>, 0, <0,0,0,>, 32}
		sphere {<0,32,0,>, 16}
		clipped_by
		{
			box {<-24,0.0001,-24,>, <24,30,24,>}
		}
		texture {MTX}
	}
	scale 1/Scale_Factor
	scale Scale_Mecha
}