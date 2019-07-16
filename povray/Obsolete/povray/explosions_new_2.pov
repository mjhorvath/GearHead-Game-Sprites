// Entry code: vnijtm
// Name      : Tekno Frannansa
// Frame rate: 15
//NUKE!!!
//By Tekno Frannansa
//evilsuperbrain.com

//declare some things
#local C=clock*8-4;	//blast occurs at C=0
#local F=function{pattern{granite}}

//scenery
sphere {
	0,9
	pigment { rgb<1,2,3>/3 }
	hollow
	//I want the sky to turn white when the nuke goes off, so instead of it glowing it gets lit like everything else in the scene
	//hence I use a sphere not a sky_sphere
	//the radius is small to match the position of the main (sun) light, it gives a slight gradient on the sky that would be a flat colour with a bigger sky.
}

camera {
	location y-2 //<2,-1,2> the floor for the scene is around -1, we want to be looking up at the blast from ground level (it looks better)
	//camera wobble:
	//	atan gives a steep gradient at 0, so use atan(clock-.1) to give a reaction just after the blast.
	//	then feed this through a sine wave, scaling up from [-1,1] to whatever gives a nice number of swings: sin(4*atan(...))
	//	this wasn't fast enough so multiplied clock by 20: atan(20*(clock-.1)) = atan(20*C-2)
	//	the start and end position were wrong (cam looked at the sky to start with, then at the ground) so flip the sign (2-20*C) without needing extra characters!
	// .2 obviously just modulates the whole trick
	look_at 0
}


//note: there's several if's below, they were all combined in 1 in the short version of the scene but I've seperated them here for clarity.


//THE NUKE!
sphere {
	0, 1.5
	pigment { rgbt 1 }
	interior {
		media {
			scattering { 1,60 }
			absorption 60 //scattering gives white smoke, add absorption to get grey.
			density {
				#local G =
					function {
						F(x,y+C/6,z-C/3) //granite function, indexed using clock to scroll pattern up and away from camera, so smoke moves nicely
						+(1-sqrt(x*x+y*y+z*z))*2 //sphere radius 1, *2 so the sphere has more effect on the shape
					}
					
				function {
					max(0, //clamp the bottom so it doesn't go negative and wrap round
						
						G(x,y-cos(y*2)*(1+C)*.6,z)
						//y distortion gives the mushroom shape, by pushing the spherical cloud up and down using a cosine curve,
						//modulate this by time to get the animation.
						//I tried many versions of the numbers here before finding this one, it's a fluke that it took so little code!
						
						/3 //save us from having to clamp the top (the highest value it can hit is 3)
					)
				}
			}
		}
	}
	hollow
	scale clock
}

light_source {y*9-5, 1}
