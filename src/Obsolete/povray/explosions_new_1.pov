#version 3.5

#declare Seed = seed(882 + frame_number);
#declare __TURBULENCE__ = 0.2 + 0.6 * rand(Seed);	//	TURBULENCE by a float of how turbulent the effect should be, maybe 0.2 + 0.6 * frand()
#declare __TURBSTART__ = 100 * rand(Seed);		//	TURBSTART by a float to be used as seed for the effect maybe 100 * frand() (can be animated when stepping with stepsize < 1.0 or so)
#declare __EMISSION__ = 0.6 + 0.5 * rand(Seed);		//	EMISSION by a float how bright the effect should be, maybe 0.6 + 0.5 * frand()
#declare __COLORMAP__ = color_map			//	COLORMAP by a colormap, like this:
{
	[ 0.000  0.270 color rgb < 0, 0, 0> color rgb < 0, 0, 0> ]
	[ 0.270  0.280 color rgb <.5,.5,.4> color rgb <.8,.8,.4> ]
	[ 0.280  0.470 color rgb < 0, 0, 0> color rgb < 0, 0, 0> ]
	[ 0.470  0.480 color rgb <.4,.4,.5> color rgb <.4,.4,.8> ]
	[ 0.480  0.680 color rgb < 0, 0, 0> color rgb < 0, 0, 0> ]
	[ 0.680  0.690 color rgb <.5,.4,.4> color rgb <.8,.4,.4> ]
	[ 0.690  0.880 color rgb < 0, 0, 0> color rgb < 0, 0, 0> ]
	[ 0.880  0.890 color rgb <.5,.5,.5> color rgb < 1, 1, 1> ]
	[ 0.890  1.000 color rgb < 0, 0, 0> color rgb < 0, 0, 0> ]
}	

//    Persistence of Vision Raytracer Version 3.5 Scene Description File
//
//*******************************************

global_settings
{
//	max_trace_level 5
}

camera
{
	location <0,0,-2.3>
//	angle 90
	right <1,0,0>
	up <0,1,0>
//	clock
}

background { color rgb <0,0,0> }

sphere
{
	< 0, 0, 0>, 4
	pigment { rgbt 1 } // surface of sphere is transparent
	interior
	{
		media
		{
			emission __EMISSION__
			intervals 1
			samples 33
			method 3
			density
			{
				spherical
				ramp_wave
				translate +(__TURBSTART__ + clock*1.0)*y  // replace +1.0 = +t  by time for animation
				warp { turbulence __TURBULENCE__ }
				translate -(__TURBSTART__ + clock*1.0)*y // replace -1.0 = -t  by time for animation
				color_map {__COLORMAP__}
			}
			scale 0.7
		}
	}
	//translate 25*y
	hollow
}
