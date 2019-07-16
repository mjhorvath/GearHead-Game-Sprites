// Desc: GearHead tree-tile generator 1.0
// Auth: Michael Horvath
// Uses "veg.inc" by Joerg Schrammel and Stig Bachmann Nielsen.

#local Seed = seed(22231*frame_number);

#include "terrain_Wheat_mesh.inc"

union
{
	#local iCount = 0;
	#local iMax = 100;
	#while (iCount < iMax)
		#local jCount = 0;
		#local jMax = 100;
		#while (jCount < jMax)
			union
			{
				object {wheat_13_stems}
				object {wheat_13_leaves}
				scale (rand(Seed) * 1/4 + 3/4)
				scale 1/4
				scale Height
				rotate y * rand(Seed) * 360
				translate x * (iCount * Width/iMax - Width/2)
				translate z * (jCount * Width/jMax - Width/2)
			}
			#local jCount = jCount + 1;
		#end
		#local iCount = iCount + 1;
	#end
	pigment {gamma_color_adjust(<255,222,123>/255)}
	finish {Default_Finish}
}

