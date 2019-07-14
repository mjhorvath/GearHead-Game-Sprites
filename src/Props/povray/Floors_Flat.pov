// Desc: GearHead floors generator
// Auth: Michael Horvath
// Home: http://isometricland.net

#version 3.7;

#declare Use_Shadows = 1;
#declare Height = 64;
#declare Width = 64;

#local Seed = seed(522233);
//#declare Rotate = clock * 360;
#declare Show_BasicFloor = 0;
#declare Show_GridMarker = 0;

#include "GearHead.inc"				// Source of the camera and lighting code


// -------------------------------------------------------------
// Scenery

//#include "prop_Dome.inc"		// geodesic dome
#include "prop_Zigguraut.inc"		// zigguraut
//#include "prop_Temple.inc"		// temple, plain
//#include "prop_Temple_alt.inc"	// temple, gold
//#include "prop_Fortress.inc"		// fortress
//#include "prop_BigTree.inc"		// big, dead tree
//#include "prop_Boulders_XLarge.inc"	// really big boulders
//#include "prop_Boulders_Large.inc"	// big rubble pile
//#include "prop_Generator.inc"		// generator
//#include "prop_Jack.inc"		// generator
//#include "prop_RoadSign.inc"




#debug concat("\ntext = ", vstr(3, vanglesXY(<-1500,  4000, -3000>), ",", 0, -1), "\n")
