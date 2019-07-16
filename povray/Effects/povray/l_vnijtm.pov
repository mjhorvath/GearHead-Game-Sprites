// Entry code: vnijtm
// Name      : Tekno Frannansa
// Frame rate: 15
//NUKE!!!
//By Tekno Frannansa
//evilsuperbrain.com

//declare some things
#local C=clock-.2;	//blast occurs at C=0
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

height_field {
	//I need a granite function for the nuke, so may as well use it for the ground too.
	//apply a pow curve to try and make it look like mesas
	function 999,999 {
		pow( F(y,1,x), 9 )
	}
	translate .14*y-.5 //center on the origin, place the floor just below -1 (after the scaling)
	scale 10-y*7 //big enough to look like a good horizon, small enough to hide the polys fairly well and to have a few rocks in front of the nuke
	pigment { rgb<3,2,1>/3 }
}


camera {
	location y-2 //<2,-1,2> the floor for the scene is around -1, we want to be looking up at the blast from ground level (it looks better)
	//camera wobble:
	//	atan gives a steep gradient at 0, so use atan(clock-.1) to give a reaction just after the blast.
	//	then feed this through a sine wave, scaling up from [-1,1] to whatever gives a nice number of swings: sin(4*atan(...))
	//	this wasn't fast enough so multiplied clock by 20: atan(20*(clock-.1)) = atan(20*C-2)
	//	the start and end position were wrong (cam looked at the sky to start with, then at the ground) so flip the sign (2-20*C) without needing extra characters!
	// .2 obviously just modulates the whole trick
	look_at .2*y*sin(4*atan(2-C*20))
}


//note: there's several if's below, they were all combined in 1 in the short version of the scene but I've seperated them here for clarity.


//THE NUKE!
#if ( C>0 ) //if's take up quite a few characters in a short-code image, but the blast is much more dramatic if there's a stillness before it.
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
	}

	//light from the blast	
	light_source {
		-y*.7,
		<3,2,1>/99/C/C //ugly shorthand for <3,2,1>/(99*C*C)
		//n.b. there's no division by zero because the animation is 99 frames with clock from 0 to 1,
		//which means the clock increases by 1/99, not 1/100, so it never exactly hits my moment of detonation (0.2), but on that frame I do
		//get a really really bright light here, which sticks around for a while (C*C ~= 0) then dies off to almost nothing (1/99 ~= 0)
	}
#end



light_source {
	y*9-5,
	#if ( C>0 )
		//Fake an iris effect, make the other light in the scene darker at the moment of the blast so they turn black unless illuminated by the blast
		//really I should lower the brightness of everything, either by reducing all lights & ambient values, or with a tinted lens over the camera
		//but in this short code I didn't have room, and this looks fine anyway.
		pow(C,.3)
	#else
		//normal sunlight before the blast
		1
	#end
}


//---------end-of-scene--------




//below are a handful of nuggets of early code that you might find interesting if you're playing with this file:

#if(0)

//originally the ambient light was controlled by the same value as the sun light
#local iris=pow(C,.3);
global_settings{ambient_light iris}

//prior to optimisation the nuke code looked like this.
//it's nearly identical now, except:
// -emission 2 - this is the only thing I regret removing, it's basically ambient light for smoke and made the shadows more interesting.
// -(.5+clock*.7) has become (1+C)*.6 (note C=clock-.2 so this is fairly accurate)
// -the whole function was divided by 3, to avoid the need for min(1,...), hence scattering and absorption are now 60
media {
	scattering{1,20}
	emission 2*iris absorption 20 //plus scattering = v good colour
	density {
		#local G=function{F(x,y+clock/6,z-clock/3).x+(1-sqrt(x*x+y*y+z*z))*2};
		function{min(1,max(0,G(x,y-cos(y*2)*(.5+clock*.7),z)))}
	}
}

//some other camera motions I experimented with
//all of these can just be dropped into the above scene
camera{rotate-x*16-C*5translate-y*.95-z*(C+2.5)} //tilt
camera{location<0,C*C-.96,-2-C*3>sky y-x*C/2look_at -y/2} //flyby
camera{rotate-x*20+y*C*C*30translate-z*2-x*C-y*.9} //drive by
camera{rotate-x*16-sin(.1/(C-.03))translate-y*.95-z*(C+2.5)} //shaken by blast
camera{location-2.5*z-x*C/2-y*.95look_at y*sin(-4*atan(C*20-2))*.2}//better shake

//placeholder for the blast when I was testing camera animation (so I could render in 10 minutes, not 27 hours!)
cylinder{-y,y*.8,1pigment{rgb 1}no_shadow double_illuminate}

#end
