#include "GearHead.inc"

// Persistence of Vision Ray Tracer Scene Description File
// File: minitank.pov
// Vers: 3
// Desc: Basic Scene Example
// Date: Nov-Dec 1997
// Auth: Francisco Muñoz Cotobal
// Copyright: This is my work if u plagiate it, my curse will fall upon u
// Notes: 1 meter = 10 units


#include "colors.inc"
#include "textures.inc"

//*****************************************************************

#declare Gun_rotate = -30;		// values 0 to -180
#declare Turret_rotate = 0;		// values 0 to 360
#declare Weapon = 1;			// 0 = GAttling gun, 1 autocannon
#declare Secundary = 1;			// 0 = A ligth focus, 1 = Missile Rack 

//*****************************************************************


#declare ACP_Texture1 =   // Semi-arid theatre
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color DarkGreen]
                [0.55 color DarkGreen]
                [0.57 color rgb <0.45,0.25,0.20>]
                [1.00 color rgb <0.45,0.25,0.20>]
            }
        }
        scale 1.5
    }
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color Clear]
                [0.70 color Clear]
                [0.71 color rgb <0.7,0.5,0.2>]
                [1.00 color rgb <0.7,0.5,0.2>]
            }
        }
        scale 1.5
        rotate 45
    }
#declare ACP_Texture2 =   // European/Woods theatre
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color DarkGreen]
                [0.55 color DarkGreen]
                [0.57 color rgb <0.45,0.25,0.20>]
                [1.00 color rgb <0.45,0.25,0.20>]
            }
        }
        scale 1.5
    }
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color Clear]
                [0.70 color Clear]
                [0.71 color rgb <0.2,0.2,0.2>]
                [1.00 color rgb <0.19,0.18,0.18>]
            }
        }
        scale 1.5
        rotate 45
    }

#declare ACP_Texture3 =   // Desert theatre
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color rgb <0.7,0.5,0.2>]
                [0.65 color rgb <0.7,0.5,0.2>]
                [0.67 color DarkGreen]
                [1.00 color DarkGreen]
            }
        }
        scale 1.5
    }
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color Clear]
                [0.75 color Clear]
                [0.76 color rgb <0.45,0.25,0.20>]
                [1.00 color rgb <0.45,0.25,0.20>]
            }
        }
        scale 1.5
        rotate 45
    }
#declare ACP_Texture4 =   // Snow theatre
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color rgb <1,1,1>]
                [0.75 color rgb <1,1,1>]
                [0.76 color rgb <0.39,0.50,0.39>]
                [1.00 color rgb <0.39,0.50,0.39>]
            }
        }
        finish {ambient .45}
        scale 1.5
    }
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color Clear]
                [0.80 color Clear]
                [0.81 color rgb <0.55,0.45,0.40>]
                [1.00 color rgb <0.55,0.45,0.40>]
            }
        }
        finish {ambient .45}
        scale 1.5
        rotate 45
    }
    

#declare Barrel_Texture = GTX;
#declare Barrel_Texture2 = GTX;

#declare Focus_Glass =
texture {
    pigment {
        gradient y
        color_map{
            [0.000 rgbf <0.0, 0.0, 0.0, 0.0>]
            [0.020 rgbf <0.2, 0.2, 0.2, 0.0>]
            [0.050 rgbf <0.98, 0.98, 0.98, 0.9>]
            [0.950 rgbf <0.98, 0.98, 0.98, 0.9>]
            [0.970 rgbf <0.2, 0.2, 0.2, 0.0>]
            [1.000 rgbf <0.0, 0.0, 0.0, 0.0>]
             }
    scale .3
    }
    finish  {
        ambient 0.1
        diffuse 0.1
        reflection 0.1
        refraction 0.9
        ior 1.45
        specular 0.8
        roughness 0.0003
        phong 1
        phong_size 400
     }
}

//************* Final Textures ********************************************
/* EDIT
#declare ACP_Texture = texture {pigment{colour <1,0,0>}}
#declare ACP_Texture_Secondary = texture {pigment{colour <1,1,0>}}
#declare Wheel_Texture = texture {pigment {colour <.10,.10,.10>}}
*/

#declare ACP_Texture = MTX;
#declare ACP_Texture_Secondary = HTX;
#declare Wheel_Texture = BTX;

//*****************************************************************
// Beware !! the Gatling gun and the turret uses a different construction scale positioning than other parts

//Primary weapon either a Gatling gun or an cannon
#declare Gatling = union {
    #declare Count = 0;
    #while (Count <11)
    difference {
        cylinder {<-1,.9,0>,<-16,.9,0>,.20 rotate Count*x*36 texture {Barrel_Texture} }
        cylinder {<-2,.9,0>,<-17,.9,0>,.19 rotate Count*x*36 texture {Barrel_Texture2} }
    }
    #declare Count = Count +1;
    #end
        cylinder {<-5,0,0>,<-1,0,0>,1.5 texture {Barrel_Texture2} }
        cylinder {<-8.875,0,0>,<-9.125,0,0>,1.5 texture {Barrel_Texture2} }
        cylinder {<-14,0,0>,<-14.25,0,0>,1.5 texture {Barrel_Texture2} }
    cylinder {<-1,0,0>,<-14.26,0,0>,.20 texture {Barrel_Texture2}} //Barrels' Axis
    sphere {<-14.26,0,0>,.20 texture {Barrel_Texture2}}
}

//Alternative weapon
#declare Autocannon = union {
    difference {
        union {
        cone {<-1,0,0>,1.2,<-26,0,0>,1.1 texture {Barrel_Texture}}
        cylinder {<-20,0,0>,<-26,0,0>,1.25 texture {Barrel_Texture}}
        cylinder {<-1,0,0>,<-10,0,0>,1.25 texture {Barrel_Texture}}
        }
        cylinder {<-5,0,0>,<-1,0,0>,1.5 texture {Barrel_Texture2} }
        cylinder {<-1,0,0>,<-27,0,0>,.8 texture {Barrel_Texture2} }
        cylinder {<-25,-2,0>,<-25,2,0>,.5 texture {Barrel_Texture2} }
        cylinder {<-25,0,-2>,<-25,0,2>,.5 texture {Barrel_Texture2} }
    }
}

//Secondary system Either a ligth focus or a missile rack
#declare Focus=union {
        difference {
            union {
                cylinder {<0,-6,0><0,-9.5,0>,.4 pigment {Black}}
                cylinder {<-1,-9.5,0>,<1,-9.5,0>,2 }
                sphere {0,2 scale <.2,1,1> translate <1,-9.5,0>}
                cylinder {<-1.1,-9.5,0><-.95,-9.5,0>,2.1 pigment {Black}}
            }
            sphere {<-1,-9.5,0>,1.8
                texture {pigment {White} finish {reflection .8}}  //"Parabolic" mirror inside focus
                }
        }
        sphere {<0,0,0>,1.8
            texture {Focus_Glass}
            scale <.25,1,1>
            translate <-1,-9.5,0>
            }
        texture{ACP_Texture_Secondary}
    }

#declare Missile_Rack=union {
        difference {
            union {
                cylinder {<0,-6,0><0,-9.5,0>,.4 pigment {Black}}
                //cylinder {<-1,-9.5,0>,<1,-9.5,0>,2 }
                //sphere {0,2 scale <.2,1,1> translate <1,-9.5,0>}
                //cylinder {<-1.1,-9.5,0><-.95,-9.5,0>,2.1 pigment {Black}}
                box {<-1,-8,2>,<1,-14,-4> texture{ACP_Texture_Secondary}}
                box {<-1.5,-8.25,1.75>,<0,-13.75,-3.75> pigment {Black}}
            #declare Count = 0;
            #while (Count<5)

                cylinder{<-3,-9,1-Count><2,-9,1-Count>,.5 texture{ACP_Texture_Secondary}}
                sphere {<-3,-9,1-Count>,.45 texture {Barrel_Texture}}
                cylinder{<-3,-10,1-Count><2,-10,1-Count>,.5 texture{ACP_Texture_Secondary}}
                sphere {<-3,-10,1-Count>,.45 texture {Barrel_Texture}}
                cylinder{<-3,-11,1-Count><2,-11,1-Count>,.5 texture{ACP_Texture_Secondary}}
                sphere {<-3,-11,1-Count>,.45 texture {Barrel_Texture}}
                cylinder{<-3,-12,1-Count><2,-12,1-Count>,.5 texture{ACP_Texture_Secondary}}
                sphere {<-3,-12,1-Count>,.45 texture {Barrel_Texture}}
                cylinder{<-3,-13,1-Count><2,-13,1-Count>,.5 texture{ACP_Texture_Secondary}}
                sphere {<-3,-13,1-Count>,.45 texture {Barrel_Texture}}
            #declare Count= Count + 1;
            #end
            }
            /*sphere {<-1,-9.5,0>,1.8
                texture {pigment {White} finish {reflection .8}}  //"Parabolic" mirror inside focus
                }*/
        }
        /*sphere {<0,0,0>,1.8
            texture {Focus_Glass}
            scale <.25,1,1>
            translate <-1,-9.5,0>
            }*/
    }


#declare Gun_Turret = union {
    sphere {<0,0,0>,6}  // Core
    difference {
        sphere {<0,0,0>,8  }
        box {<-15,-2,-1>,<15,2,-15>  }
        plane {-z,0}
    }
    cylinder {<0,0,0>,<0,0,-.5>,9 pigment {Black}}          // Turret base
    union  {                                            // Antenae
        cylinder {<0,7,0>,<0,7,-7>,0.2  }
        cylinder {<0,7,0>,<0,7,-15>,0.05 pigment {Black}}
        sphere {<0,7,-15>,.1  no_shadow pigment {color rgbf <1,.1,.1,.75>}}
//        light_source { <0,7,-15.02> color rgb <.2,.1,.1>}
        rotate z*-45
    }
    //object {Focus rotate y*Gun_rotate translate <-1,0,-4>}  //Locate the focus/missiles
    object {Missile_Rack rotate y*Gun_rotate translate <-1,0,-4>}  //Locate the focus/missiles
}

#declare Cannon_gun = union {
    object { Gun_Turret }
    #if (Weapon=0)
        object { Gatling rotate y*Gun_rotate translate <0,0,-2>}
    #else
        object { Autocannon rotate y*Gun_rotate translate <0,0,-2>}
    #end
    }

#declare Big_wheel= union {   // A Big Wheel ;-)
    difference {
        superellipsoid {<1,.25> scale <5,5,2.5>}
        cylinder {<0,0,3>,<0,0,-3>,3}
        texture{Wheel_Texture}
    }
    torus {3,.5 rotate x*90 translate <0,0,-2> texture{Wheel_Texture}}
    cylinder {<0,0,2.4>,<0,0,-2.4>,2.5  texture {ACP_Texture_Secondary}}
    sphere {<0,0,0>,2.6 scale <1,1,.2> translate <0,0,-2.6>   texture {ACP_Texture_Secondary}}
    intersection {
        superellipsoid {<1,.25> texture{Wheel_Texture} scale <5.25,5.25,2.5>}
        union {
            #declare Count = 0;
            #while (Count<25)
            union {
                cylinder {<0,4,0>,<0,6,0>,.25}
                cylinder {<1,4,-2>,<.5,6,-2>,.25}
                cylinder {<1,4,2>,<.5,6,2>,.25}
                box {<-.25,4,0>,<.25,6,-2.236> rotate y*30}
                box {<-.25,4,0>,<.25,6,2.236> rotate y*-30}
                rotate z*15*Count
            texture{Wheel_Texture}
            }
            #declare Count= Count + 1;
            #end
        }
    }
}

//Left headlight has a small machine gun
#declare L_Headlight = difference {
    union {
        cylinder {<-18,9,-10>,<-14,9,-10>,.75}
        cylinder {<-18,9,-6>,<-14,9,-6>,.75}
        box {<-18,9.75,-10>,<-14,8.25,-6>}
        sphere {<-14,9,-10>,.75 }
        cylinder {<-14,9,-10>,<-14,9,-6>,.75}
        cylinder {<-18.2,9,-9.5>,<-14,9,-9.5>,.7 pigment {Black}}
        difference {
                cylinder {<-20,9,-6.5>,<-17,9,-6.5>,-.4 texture {Barrel_Texture}}
                cylinder {<-21,9,-6.5>,<-18,9,-6.5>,-.3 texture {Barrel_Texture2}}
        }
        sphere {<0,0,0>,.6
            texture {pigment {rgbf <0,1,0,1>}}
            texture {Focus_Glass rotate x*90}
            scale <.25,1,1>
            translate <-18.2,9,-9.5>
            }
       }
       sphere {<-18.2,9,-9.5>,.6
                             texture {pigment {White} finish {reflection .8}}
            }
      texture{ACP_Texture_Secondary}
}

#declare R_Headlight =     union {
        difference {
            union {
                cylinder {<-18,9,10>,<-14,9,10>,.75}
                cylinder {<-18,9,6>,<-14,9,6>,.75}
                box {<-18,9.75,10>,<-14,8.25,6>}
                sphere {<-14,9,10>,.75 }
                cylinder {<-14,9,10>,<-14,9,6>,.75}
                cylinder {<-18.2,9,9.5>,<-14,9,9.5>,.7 pigment {Black}}
                cylinder {<-18.2,9,6.5>,<-14,9,6.5>,.55 pigment {Black}}
            }
            sphere {<-18.2,9,9.5>,.6
                             texture {pigment {White} finish {reflection .8}}
            }
            sphere {<-18.2,9,6.5>,.5
                             texture {pigment {White} finish {reflection .8}}
            }

        }
        sphere {<0,0,0>,.6
           texture {pigment {rgbf <0,1,0,1>}}
             texture {Focus_Glass rotate x*90}
            scale <.25,1,1>
            translate <-18.2,9,9.5>
            }
        sphere {<0,0,0>,.5
            texture {pigment {rgbf <0,1,0,1>}}
            texture {
                Focus_Glass
                rotate x*90}
            scale <.25,1,1>
            translate <-18.2,9,6.5>
            }
     texture {ACP_Texture_Secondary}
}

#declare Body = union {
    difference {
        union {
        difference {
            box {<-20,-2,5>,<20,6,-5>}                  // Upper part
            plane {y,0 rotate <0,0,-60> translate <-20,6,0>}
            plane {y,0 rotate <0,0,50> translate <20,6,0>}

        }
        difference {
            box {<-20,6,-12>,<20,12,12>}            // Lower part
            plane {-y,0 rotate <0,0,40> translate <-20,6,0>}
            plane {-y,0 rotate <0,0,-55> translate <20,6,0>}
            plane {-y,0 rotate <55,0,0> translate <0,6,12> }
            plane {-y,0 rotate <-55,0,0> translate <0,6,-12> }

        }
        }
    box {<18,-2.1,4.5>,<20,11.5,-4.5>   }  // hole for the back door
    }
    union {
        box {<15,-1,4.5>,<18,11.5,-4.5> }       // Backdoor for troops
        box {<18,-0.5,4.3>,<18.5,11,-4> }
        cylinder {<18.15,1.5,-4.15>,<18.15,2.5,-4.15>,.155 }
        cylinder {<18.15,7.5,-4.15>,<18.15,6.5,-4.15>,.155 }
        cylinder {<18.5,4,3.5>,<19,4,3.5>,.125}
        cylinder {<18.5,6,3.5>,<19,6,3.5>,.125}
        sphere {<19,4,3.5>,.125}
        sphere {<19,6,3.5>,.125}
        cylinder {<19,4,3.5>,<19,6,3.5>,.125}

    }
    union {
        sphere {<14,13,-6>,.125}
        sphere {<12,13,-6>,.125}
        cylinder {<14,12,-6>,<14,13,-6>,.125}
        cylinder {<12,12,-6>,<12,13,-6>,.125}
        cylinder {<12,13,-6>,<14,13,-6>,.125}

    }
    union {
        sphere {<14,13,6>,.125}
        sphere {<12,13,6>,.125}
        cylinder {<14,12,6>,<14,13,6>,.125}
        cylinder {<12,12,6>,<12,13,6>,.125}
        cylinder {<12,13,6>,<14,13,6>,.125}

    }
    sphere {<0,9,-10>,.75 texture {ACP_Texture_Secondary}}
    sphere {<14,9,-10>,.75 texture {ACP_Texture_Secondary}}
    cylinder {<0,9,-10>,<14,9,-10>,.75 texture {ACP_Texture_Secondary}}
    sphere {<0,9,10>,.75 texture {ACP_Texture_Secondary}}
    sphere {<14,9,10>,.75 texture {ACP_Texture_Secondary}}
    cylinder {<0,9,10>,<14,9,10>,.75 texture {ACP_Texture_Secondary}}
    object {L_Headlight}
    object {R_Headlight}
}
 
#declare Floor= difference {
    plane {y,0 }
    plane {y,-1}
    superellipsoid {<.05,.25> scale <100,5,2.5> translate y*4.98
        translate <88,0,10>
        pigment {Gray90}
        finish {ambient .5}
        }
    superellipsoid {<.05,.25> scale <100,5,2.5> translate y*4.98
        translate <88,0,-10>
        pigment {Gray90}
        finish {ambient .5}
        }
}

//*****************************************************************

#declare APC = union  {
    object {Big_wheel translate <-12,0,-10>}
    object {Big_wheel translate <0,0,-10>}
    object {Big_wheel translate <12,0,-10>}
    object {Big_wheel scale <1,1,-1> translate <-12,0,10>}
    object {Big_wheel scale <1,1,-1> translate <0,0,10>}
    object {Big_wheel scale <1,1,-1> translate <12,0,10>}
    cylinder {<-12,0,10>,<-12,0,-10>,2.25  } // Wheel Axis 1
    cylinder {<0,0,10>,<0,0,-10>,2.25  } // Wheel Axis 2
    cylinder {<12,0,10>,<12,0,-10>,2.25  } // Wheel Axis 2
    object {Cannon_gun scale .75 rotate <90,Turret_rotate,0> translate <-3,12,0>}
    object {Body translate 0}
    translate y*5.20
}

//*****************************************************************
/* EDIT
#declare acp_size = .325

object {APC
    scale acp_size
    rotate <0,180,0> translate <-45,0,30>
    //rotate <0,150,0> translate <0,0,0>
    texture {ACP_Texture}
    
}
object {APC
    scale acp_size
    rotate <0,-135,0> translate <-15,0,30>
    //rotate <0,150,0> translate <0,0,0>
    texture {ACP_Texture}
    
}
object {APC
    scale acp_size
    rotate <0,-90,0> translate <15,0,30>
    //rotate <0,150,0> translate <0,0,0>
    texture {ACP_Texture}
    
}
object {APC
    scale acp_size
    rotate <0,-45,0> translate <45,0,30>
    //rotate <0,150,0> translate <0,0,0>
    texture {ACP_Texture}
    
}


object {APC
    scale acp_size
    rotate <0,0,0> translate <-45,0,-40>
    //rotate <0,150,0> translate <0,0,0>
    texture {ACP_Texture}
    
}
object {APC
    scale acp_size
    rotate <0,45,0> translate <-15,0,-40>
    //rotate <0,150,0> translate <0,0,0>
    texture {ACP_Texture}
    
}
object {APC
    scale acp_size
    rotate <0,90,0> translate <15,0,-40>
    //rotate <0,150,0> translate <0,0,0>
    texture {ACP_Texture}
    
}
object {APC
    scale acp_size
    rotate <0,135,0> translate <45,0,-40>
    //rotate <0,150,0> translate <0,0,0>
    texture {ACP_Texture}
    
}
*/
// here starts the background
 /*
object {Floor
    rotate <0,-50,0> translate <0,0,0>
    texture {
        pigment {White}
        normal {
            waves
            slope_map {
                [0.0  <0, 1>]
                [0.2  <0, 1>]
                [0.2  <1,-1>]
                [0.4  <0,-1>]
                [0.4  <0, 0>]
                [0.5  <0, 0>]
                [0.5  <1, 0>]
                [0.6  <1, 0>]
                [0.6  <0, 0>]
                [0.7  <0, 0>]
                [0.7  <0, 3>]
                [0.8  <1, 0>]
                [0.9  <0,-3>]
                [0.9  <0, 0>]
           }
        }
        finish {ambient .5}
        scale 15
    }
}

//plane {y,0 pigment {White}}
#declare Iceberg=height_field
{
  gif               // the file type to read (gif/tga/pot/pgm/ppm/png/sys)
  "Iceberg.gif"      // the file name to read
    texture {
        pigment {White}
        finish {ambient .4}
        normal {bumps 0.2}
    }
  scale <150,75,150>
}

object {Iceberg rotate <0,40,0> translate <-300,-1,500>}
object {Iceberg rotate <0,-40,0> translate <-240,-40,500>}
object {Iceberg rotate <0,70,-2> translate <-210,-10,500>}
object {Iceberg rotate <0,-70,0> translate <-180,-1,500>}
object {Iceberg rotate <0,-190,0> translate <-140,-1,500>}
object {Iceberg rotate <3,50,0> translate <-120,-15,500>}
object {Iceberg rotate <0,91,-2> translate <-60,-20,490>}
object {Iceberg translate <-40,-1,500>}
object {Iceberg rotate <3,-20,2> translate <-10,-1,470>}
object {Iceberg rotate <3,80,2> translate <20,-10,500>}

object {Iceberg rotate <0,140,0> translate <80,-10,1000>}

fog {
    distance 250
    colour rgbt<0.7, 0.7, 0.7, 0.35>
    turbulence 0.2
    turb_depth 0.3
    fog_type 2
    fog_offset 20
    fog_alt 10
  }
fog {
    distance 250
    colour rgbt <0.7, 0.7, 0.7, 0.3>
    turbulence 0.2
    turb_depth 0.3
    fog_type 2
    fog_offset 5
    fog_alt 5
  }
sky_sphere {pigment {color rgb <.2,.2,.8>}}
*/
/* EDIT
sky_sphere {pigment {color rgb <0,0,1>}}
*/
//*****************************************************************


// -------------------------------------------------------------
// the final object: select from one of the floor types by uncommenting the corresponding line

object
{
	APC
	rotate y * (clock * 360 + 45)
	texture {ACP_Texture}
	scale Scale_LDraw
}