#version 3.7;
#declare Flip = 0;
#declare Show_BasicFloor = 0;
#declare Water_Level = 2;
#include "colors.inc"
#include "functions.inc"
#include "textures.inc"
#include "GearHead.inc"
#include "Terrain_Textures.inc"
#include "Terrain_Prototypes.inc"

object
{
	#switch (Water_Level)
		#case (1)	Water_Rear_Lvl1	#break
		#case (2)	Water_Rear_Lvl2	#break
		#case (3)	Water_Rear_Lvl3	#break
	#end
	translate -y * 0.0001
}

object
{
	Water_Surface_D()
}
