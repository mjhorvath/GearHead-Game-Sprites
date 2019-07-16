// spiderweb. uses "spweb.inc" by Chris Colefax.
object
{
	#local web_type =		3		; // Sets the style of the web circles (choose from 1, 2, or 3)
	#local web_radius =		Width/1		; // Sets the overall radius of the web
	#local web_spokes_count =	8		; // Sets the number of spokes in the web
	#local web_circles_count =	4		; // Sets the number of circles in the web
	#local web_circles_radius =	Width/2		; // Sets the overall radius of the web circles
	#local thread_thickness =	0.5		; // Sets the thickness of the web thread
	#local thread_tightness =	0.5		; // Sets the tightness of the web circles
	#local web_seed =		0		; // Sets the random seed used to create the web
	#local web_spokes_turb =	0.3		; // Sets the randomness of the web spokes
	#local web_circles_turb =	0.5		; // Sets the randomness of the web circles
	#include "spweb.inc"
	texture
	{
		pigment {color rgbt <1,1,1,3/4,>}
		finish
		{
			ambient Ambient_Factor
			diffuse 1
			phong .2
			phong_size 10
			brilliance 0
		}
	}
	translate -x * Width/2
	rotate y * 90
	no_shadow
}
