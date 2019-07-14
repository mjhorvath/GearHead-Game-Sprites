// "sphere.inc" written by Shuhei Kawachi

#declare BlankTexture = texture {}

/*
// these values look really nice when anti-aliasing is turned on
#declare N = 2;
#declare Half = 1;
#declare Method = 1;
#declare RibTexture = Plain_White;
#declare PaneTexture = T_Glass1;
#declare R_Ten = 0.025 / N;
#declare R_Hen = 0.025 / N;
#include "sphere.inc"
*/

#declare N = 2;
#declare Half = 1;
#declare Method = 1;
#declare RibTexture = Plain_White;
#declare PaneTexture = T_Glass1;
#declare R_Ten = 0.025 / N;
#declare R_Hen = 0.025 / N;
#include "sphere.inc"

#declare Dome_Object = union
{
	object { Ten texture { RibTexture } }
	object { Hen texture { RibTexture } }
//	object { Men texture { PaneTexture } }
	scale 32
	scale 3/4
	no_shadow
}

object {Dome_Object}
