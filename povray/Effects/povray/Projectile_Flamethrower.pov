// uses flamethrower effect by H.E. Day
// doesn't work in POV-Ray 3.7
#version 3.6;

#declare Show_BasicFloor = 0;
#include "GearHead.inc"				// Source of the camera and lighting code

//Fire Jet - For the Walker
#include "colors.inc"

#declare Vector = z;
#declare Length = 20;

#declare DensMap = density
{
        radial
        rotate y*90
        translate Vector*-Length*1/4
        translate Vector*-Length*3/4*clock
        warp {turbulence 0.8 octaves 3 lambda 2.5}
        translate Vector*Length*3/4*clock
        colour_map
        {
                [0.490 rgb 0]
                [0.495 rgb 1]
                [0.500 rgb 4]
                [0.505 rgb 1]
                [0.510 rgb 0]
        }
}
#declare ColMap = density
{
        radial
        rotate y*90
        translate Vector*-Length*1/4
        translate Vector*-Length*3/4*clock
        warp {turbulence 1.2 octaves 3 lambda 2.5}
        translate Vector*Length*3/4*clock
        colour_map
        {
                [0.495 Yellow]
                [0.500 White]
                [0.505 Yellow]
        }
}
#declare DensEnding = density
{
        spherical
        scale 10
        colour_map
        {
                [0.000 rgb 0*<1,0,0>]
                [0.500 rgb <1,.5,0>*.5]
                [0.750 rgb <1,1,0>] 
                [0.875 rgb 1] 
//                [1.000 rgb <-1,0,1>]
        }
}

#declare DensMap2 = density
{
        radial
        rotate y*90
        translate Vector*-Length/7
        translate Vector*-Length*5/4*clock
        warp {turbulence 1.3 octaves 3 }
        translate Vector*Length*5/4*clock
        colour_map
        {
                [0.45 rgb 0]
                [0.48 rgb 0.4]
                [0.50 rgb 1]
                [0.52 rgb 0.4]
                [0.55 rgb 0]
        }
}
#declare ColMap2 = density
{
        radial
        rotate y*90
        translate Vector*-Length/7
        translate Vector*-Length*5/4*clock
        warp {turbulence 1.3 octaves 3 }
        translate Vector*Length*5/4*clock
        colour_map
        {
                [0.47 Red]
                [0.50 Orange]
                [0.53 Red]
        }
}
#declare DensEnding2 = density
{
        spherical
        scale 5
        scale Vector*2
        translate Vector*-Length*3/4*clock
        warp {turbulence 0.5}
        translate Vector*Length*3/4*clock
        colour_map
        {
                [0.000 rgb 0]
                [0.100 rgb 1]
                [0.875 rgb 1] 
                [1.000 rgb <-1,-1,1>]
        }
}

#declare Flame = union
{
	cylinder
	{
	        0, Vector*Length/2, Length/7
	        pigment {Clear}
	        hollow
	        interior
	        {
	                media
	                {
	                        emission 1
	                        /*
	                        intervals 5
	                        samples 2, 30
	                        confidence 0.9999
	                        variance 1/1000
	                        */
	                        density {ColMap}
	                        density {DensMap}
	                        density {DensMap rotate Vector*90}
	                        density {DensEnding}
	                	scale .8
	                }
	                media
	                {
	                        emission .75
	                        /*
	                        intervals 5
	                        samples 2, 30
	                        confidence 0.9999
	                        variance 1/1000
	                        */
	                        density {ColMap2}
	                        density {DensMap2}
	                        density {DensMap2 rotate Vector*90}
	                        density {DensEnding2}
	                	scale .8
	                }
	        
	        }
//	        scale Vector*3/.8
	        scale 3/.8
	}
	/*
	cylinder
	{
	        0, Vector*Length/2, Length/7
	        pigment {Clear}
	        hollow
	        interior
	        {
	                media
	                {
	                        absorption rgb .675
	                        //scattering { 2, rgb .5 extinction 1 }                        
	                        density
	                        {
	                        	bozo
	                        	translate Vector*-5*clock
	                        	warp {turbulence 0.2 octaves 1 lambda .5}
	                        	translate Vector*5*clock
	                        	scale Vector*1/3*.75                        
	                        	color_map
	                        	{
	                        		[0 rgb 0]
	                        		[1 rgb 1]         
	                       		}
	                	}
	                	density
	                	{
	                	        spherical
	                	        scale 5
	                	        scale Vector*2
	                	        translate Vector*-5*clock
	                	        warp {turbulence 0.5}
	                	        translate Vector*5*clock
	                	        color_map
	                	        {
	                	        	[0 rgb 0]
	                	        	[1 rgb 1]         
	                	        }
	                	}
	        	scale .8
	        	}
		}
		scale .675/.8
		scale Vector*2/.675
		translate Vector*Length
	}
	*/
}


object
{
	Flame
	scale 2
	translate z*-Width/2
	translate y * 16
	rotate y * -45
	rotate y * 360 * clock
}
