#include "colors.inc"
#include "GearHead.inc"

#declare capsule = union
{
	sphere
	{ 
		<0, 0, 0>, 1 
		scale <3, 3, 6> 
		texture {CTX}
	} 
	
	difference
	{ 
		sphere
		{ 
			<0, 0, 0>, 1 
			scale <3.01, 3.01, 6.02> 
		} 
		box {<-6, 1, 2>, <6, 6, -7> } 
		texture {MTX}
	} 

	//*PMName wing 	
	union
	{ 
		sphere
		{ 
			<0, 0, 0>, 1 
			scale <12, 0.5, 2> 
			translate x*5 
			texture {HTX}
		} 
		difference
		{ 
			sphere
			{ 
				<0, 0, 0>, 1 
				scale <12.1, 0.501, 2.001> 
				translate x*5 
			} 
			cone
			{ 
				<0, 2, 0>, 1, 
				<0, -2, 0>, 1 
				scale <12.1, 0.501, 2.001> 
				translate <5, 0, 0.5> 
			} 
			texture {MTX}
		} 
	} 
	
	superellipsoid
	{ 
		<0.4, 0.4> 
		scale <2, 1, 2.5> 
		translate x*13 
		texture {MTX}
	} 
	
	sphere
	{ 
		<0, 0, 0>, 0.5 
		scale <0.5, 2, 4> 
		translate <13, 0.75, 0> 
		texture {MTX}
	} 
	
	sphere
	{ 
		<0, 0, 0>, 0.5 
		scale <0.5, 3.5, 6> 
		translate <0, 1.5, 2.75> 
		texture {MTX}
	} 
	
	union
	{ 
		cone
		{ 
			<0, 0, 0>, 1.5, 
			<0, 0, 3.5>, 2 
			scale 0.6 
			translate <13, 0, 2> 
		} 
		cone
		{ 
			<0, 0, 0>, 1.5, 
			<0, 0, 3.5>, 2 
			scale 0.8 
			translate z*4 
		} 
		texture {GTX} 
	} 
}

object
{
	capsule
	scale 6/4
	scale Scale_Mecha
	rotate y * 135
	rotate y * clock * 360
}