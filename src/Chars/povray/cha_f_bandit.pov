// Persistence Of Vision Scene file.
// Generated by Ani2Pov v0.39.
#include "colors.inc"
#include "GearHead.inc"
#include "cha_f_bandit.inc"


object {
   object01
   matrix <0.707112, 0.000000, -0.707101,
          0.000000, 1.000000, 0.000000,
          0.707101, 0.000000, 0.707112,
          0.000000, 0.000000, 0.000000>
   translate <0.000000, 0.000000, 0.000000>
   scale <1.000000, 1.000000, 1.000000>
   	scale 3/4
	scale Scale_Chars
	rotate y * -90
	rotate y * clock * 360
}

#debug concat("clock = ", str(clock,0,-1), "\n")