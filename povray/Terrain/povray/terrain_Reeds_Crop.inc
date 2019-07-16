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
#declare Blade_Density = sqrt(0.5/pi); 

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

#declare Patch_Shape = 0; // Circle

#declare Clump_Radius_Minimum = 4;
#declare Clump_Radius_Maximum = 8;

// Blade_Heights are in standard POV units
#declare Blade_Height_Minimum = 16;
#declare Blade_Height_Maximum = 8;

#declare Max_Blade_Angle = 30;
#declare Min_Blade_Angle = 15;

#declare Blade_Scale = 4;		// was 3 or 4
#declare Blade_Width = 8/10;		// was 4/10 or 8/10

#declare Use_Blade_Distance = true;
#declare Max_Blade_Detail = 20;
#declare Min_Blade_Detail = 5;
//#declare Max_Detail_Distance = 16;
//#declare Min_Detail_Distance = 16;

#declare Blade_Tex = texture { pigment { srgb <0,0.5,0> } finish { phong 0.25 ambient 0.2 } }

union
{
	#for (i, 1, Trees_Number)
		union
		{
			PlantPatch()
			scale 1/4
			translate x * rand(someseed) * Width * 4/8 * RandSign(someseed)
			translate z * rand(someseed) * Width * 4/8 * RandSign(someseed)
		}
	#end
//	no_shadow
}
