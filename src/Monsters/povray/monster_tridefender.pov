#include "colors.inc"
#include "GearHead.inc"

#declare tridefender = union
{
	//*PMName body 
	union
	{ 
		//*PMName upper half 
		difference
		{ 
			cone
			{ 
				<0, 0, 0>, 10, 
				<0, 10, 0>, 5 
			} 
			box
			{ 
				<-10, 8, -4.5>, <10, 6, -15> 
			} 
			texture {MTX} 
		} 
		//*PMName window
		cone
		{ 
			<0, 0.01, 0>, 9.9, 
			<0, 9.99, 0>, 4.95 
			texture {CTX} 
		} 
		//*PMName lower half
		intersection
		{ 
			sphere
			{ 
				<0, 0, 0>, 10 
			} 
			box
			{ 
				<-11, 0, -11>, <11, -11, 11> 
			} 
			texture {MTX} 
		} 
		//*PMName missile rack
		union
		{ 
			superellipsoid
			{ 
				<0.35, 0.35> 
				scale <4, 3, 3> 
				translate z*(-8) 
				texture {HTX}  
			} 
			//*PMName missiles
			union
			{ 
				sphere
				{ 
					<-3, 1.5, 0>, 0.5 
				} 
				sphere
				{ 
					<-1.5, 1.5, 0>, 0.5 
				} 
				sphere
				{ 
					<0, 1.5, 0>, 0.5 
				} 
				sphere
				{ 
					<1.5, 1.5, 0>, 0.5 
				} 
				sphere
				{ 
					<3, 1.5, 0>, 0.5 
				} 
				sphere
				{ 
					<-3, -1.5, 0>, 0.5 
				} 
				sphere
				{ 
					<-1.5, -1.5, 0>, 0.5 
				} 
				sphere
				{ 
					<0, -1.5, 0>, 0.5 
				} 
				sphere
				{ 
					<1.5, -1.5, 0>, 0.5 
				} 
				sphere
				{ 
					<3, -1.5, 0>, 0.5 
				} 
				texture {Plain_Gray}  
				translate z*(-11) 
			} 
		} 
	} 
	
	//*PMName turret 
	union
	{ 
		sphere
		{ 
			<0, 10, 0>, 4.75 
			texture {HTX}  
		} 
		intersection
		{ 
			sphere
			{ 
				<0, 10, 0>, 5 
			} 
			box
			{ 
				<-2, 0, -11>, <2, 16, 11> 
			} 
			texture {MTX}  
		} 
		cone
		{ 
			<0, 0, 0>, 1, 
			<0, 0, -15>, 0.8 
			texture {Plain_Gray}  
			scale 1 
			rotate x*30 
			translate y*10 
		} 
		cone
		{ 
			<0, 0, 0>, 0.5, 
			<0, 0, -10>, 0.3 
			texture {Plain_Gray}  
			scale 1 
			rotate x*30 
			translate <-3, 12, 0> 
		} 
	} 
	
	//*PMName leg
	union
	{ 
		sphere
		{ 
			<0, 0, 0>, 2.5 
			texture {MTX}  
		} 
		cone
		{ 
			<0, 0, 0>, 2, 
			<8, 8, 0>, 1.75 
			texture {HTX}  
		} 
		sphere
		{ 
			<8, 8, 0>, 2.25 
			texture {MTX}  
		} 
		cone
		{ 
			<8, 8, 0>, 1.75, 
			<15, 0, 0>, 1.5 
			texture {HTX}  
		} 
		sphere
		{ 
			<15, 0, 0>, 2 
			texture {MTX} 
		} 
		cone
		{ 
			<15, 0, 0>, 1.5, 
			<10, -11, 0>, 1.25 
			texture {HTX} 
		} 
		sphere
		{ 
			<10, -11, 0>, 1.25 
			texture {HTX}  
		} 
		translate x*10.5 
		rotate y*30 
	} 
	
	//*PMName leg 
	union
	{ 
		sphere
		{ 
			<0, 0, 0>, 2.5 
			texture {MTX}  
		} 
		cone
		{ 
			<0, 0, 0>, 2, 
			<8, 8, 0>, 1.75 
			texture {HTX} 
		} 
		sphere
		{ 
			<8, 8, 0>, 2.25 
			texture {MTX}  
		} 
		cone
		{ 
			<8, 8, 0>, 1.75, 
			<15, 0, 0>, 1.5 
			texture {HTX} 
		} 
		sphere
		{ 
			<15, 0, 0>, 2 
			texture {MTX} 
		} 
		cone
		{ 
			<15, 0, 0>, 1.5, 
			<10, -11, 0>, 1.25 
			texture {HTX} 
		} 
		sphere
		{ 
			<10, -11, 0>, 1.25 
			texture {HTX} 
		} 
		translate x*10.5 
		rotate y*150 
	} 
	
	//*PMName leg 
	union
	{ 
		sphere
		{ 
			<0, 0, 0>, 2.5 
			texture {MTX}  
		} 
		cone
		{ 
			<0, 0, 0>, 2, 
			<8, 8, 0>, 1.75 
			texture {HTX} 
		} 
		sphere
		{ 
			<8, 8, 0>, 2.25 
			texture {MTX} 
		} 
		cone
		{ 
			<8, 8, 0>, 1.75, 
			<15, 0, 0>, 1.5 
			texture {HTX} 
		} 
		sphere
		{ 
			<15, 0, 0>, 2 
			texture {MTX} 
		} 
		cone
		{ 
			<15, 0, 0>, 1.5, 
			<10, -11, 0>, 1.25 
			texture {HTX} 
		} 
		sphere
		{ 
			<10, -11, 0>, 1.25 
			texture {HTX}  
		}
		translate x*10.5 
		rotate y*(-90) 
	} 
}

object
{
	tridefender
	translate y * 11
	scale 6/4
	scale Scale_LDraw
	rotate y * 135
	rotate y * clock * 360
/*
	clipped_by
	{
		plane {-y,0}
	}
*/
}
