// "grasspatch.inc" written by Josh English

#include "grasspatch.inc"

// Some random number generators, you may change these if you wish
#declare someseed = seed(2345*(frame_number+1));
#declare xseed = seed(422*(frame_number+1));
#declare zseed = seed(369*(frame_number+1));

#declare Patch_Translation = <0,0,0>;
// Sometimes it's handy just to see where the blades will be
// so we set PlotPoints to true, by default it is
#declare PlotPoints = false;

// per unit length. Square this to know how many will be in each
// unit squared of landscape
#declare Blade_Density = 20; 

// And of course the texture. This is the default:
#declare Blade_Tex = texture
{
//	pigment { gamma_color_adjust(<0,0.3,0>) }
//	pigment { gamma_color_adjust(<064/255,104/255,072/255,> * 4/3) }
	pigment { gamma_color_adjust(<064/255,104/255,072/255,> * 2) }
//	pigment { gamma_color_adjust(<0,0.5,0,>) }
//	finish { phong 0.25 ambient 0.2 }
	finish {Default_Finish}
}

#declare Patch_Shape = 1; // Square
#declare Spread_Correction = 1;

#declare Patch_X_Minimum = -1;
#declare Patch_X_Maximum = +1;

#declare Patch_Z_Minimum = -1;
#declare Patch_Z_Maximum = +1;

// Blade_Heights are in standard POV units
#declare Blade_Height_Minimum = 1/2;
#declare Blade_Height_Maximum = 1;

#declare Use_Blade_Distance = true;
#declare Blade_Detail = 10;
#declare Max_Blade_Angle = 0;
#declare Min_Blade_Angle = 0;

#declare Blade_Scale = 0.5;
#declare Blade_Width = 0.1;

#declare Use_Blade_Distance = true;
#declare Max_Blade_Detail = 20;
#declare Min_Blade_Detail = 5;
#declare Max_Detail_Distance = 1;
#declare Min_Detail_Distance = 10;

union
{
	PlantPatch()
	scale Width/2
//	no_shadow
}
