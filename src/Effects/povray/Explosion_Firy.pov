// can't remember the original author
// doesn't work in POV-Ray 3.7
#version 3.6;
#include "GearHead.inc"
#declare Width = 64;
#declare Height = 16;
#declare Scale_All = Width/4;

union
{
	// Gaswolke  - expanding gas
	sphere
	{
		0, 1
		hollow
		pigment{ color rgbt 1}
		
		interior
		{
			media
			{
				emission 4/pow(clock * 2 + 0.1, 2.5)/Scale_All
				absorption 2.5/pow(clock * 2 + 0.1, 2.5)/Scale_All

				density
				{
					spherical
					color_map
					{
						[0.00 gamma_color_adjust(0)]
						[0.20 gamma_color_adjust(<1, 0.5, 0.2,> * 0.5)]
						[0.30 gamma_color_adjust(<1, 0.7, 0.3,> * 0.3)]
						[0.50 gamma_color_adjust(0)]
						[0.80 gamma_color_adjust(0)]
//						[0.95 gamma_color_adjust(<0.4, 0.4, 0.5,> * 0.5)]
						[0.95 gamma_color_adjust(<4, 4, 5,> * 0.5)]
						[1.00 gamma_color_adjust(5)]
					}
				}
				density
				{
				
					granite 
					color_map
					{
						[0.00 gamma_color_adjust(<1, 0.7, 0.7,> * 0.3)]
						[0.25 gamma_color_adjust(<0.7, 0.7, 1> * 0.4)]
						[0.35 gamma_color_adjust(1)]
						[1.00 gamma_color_adjust(1)]
					}
					scale 1
				}
			}
		}
		scale 1.5
		scale 1.5 * pow(clock, 0.85) + 0.001
	}

	// Blitz - Flash
	sphere
	{
		0, 1
		hollow
		pigment{ color rgbt 1}
		
		interior
		{
			media
			{
				emission 2/Scale_All		//pow(clock*2+1,4) 
				
				density
				{
					spherical
					color_map
					{
						[0.0 color rgb 0]
						[0.25 color rgb 1/6]
						[0.50 color rgb 1/5]
						[0.75 color rgb 1/2]
						[1.00 color rgb 1]
					}
				}
			}
		}
		scale 1.5
		scale 1-pow(abs(clock-.11),.3)
	}

	// Partikel - particles
	#if(clock>.05)
		#declare S=seed(1);
		#declare i=0;
		#while(i<100)
			sphere
			{
				0,.01
				scale <5,1,1>
				pigment{color rgb .3} finish{ambient .5}
		
				translate x*2*clock+.001*(rand(S)*.5+.5)
				rotate z*180*(rand(S)-.5)
				rotate y*360*rand(S)
			}
			#declare i = i + 1;
		#end	
	#end
	scale Scale_All
	translate y * Height
}